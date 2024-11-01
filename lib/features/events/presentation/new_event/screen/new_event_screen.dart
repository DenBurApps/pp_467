import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pp_467/core/extensions/theme_context_extension.dart';
import 'package:pp_467/core/services/image_service.dart';
import 'package:pp_467/core/ui_kit/custom_back_button.dart';
import 'package:pp_467/features/events/domain/entities/event/event.dart';
import 'package:easy_stepper/easy_stepper.dart';
import 'package:pp_467/features/events/domain/entities/expense/expense.dart';
import 'package:pp_467/features/events/domain/entities/guest/guest.dart';
import 'package:pp_467/features/events/domain/entities/subtask/subtask.dart';
import 'package:pp_467/features/events/domain/st_mgmt/event_cubit.dart';
import 'package:pp_467/features/events/presentation/new_event/steps/budget/budget_content.dart';
import 'package:pp_467/features/events/presentation/new_event/steps/budget/budget_inh_widget.dart';
import 'package:pp_467/features/events/presentation/new_event/steps/guests/guests_content.dart';
import 'package:pp_467/features/events/presentation/new_event/steps/guests/guests_inh_widget.dart';
import 'package:pp_467/features/events/presentation/new_event/steps/main_info/main_info_content.dart';
import 'package:pp_467/features/events/presentation/new_event/steps/main_info/main_info_inh_widget.dart';
import 'package:pp_467/features/events/presentation/new_event/steps/photo/photo_content.dart';
import 'package:pp_467/features/events/presentation/new_event/steps/photo/photo_inh_widget.dart';
import 'package:pp_467/features/events/presentation/new_event/steps/indicator/step_circle.dart';
import 'package:pp_467/features/events/presentation/new_event/steps/indicator/step_title.dart';
import 'package:pp_467/features/events/presentation/new_event/steps/tasks_setup/tasks_setup_content.dart';
import 'package:pp_467/features/events/presentation/new_event/steps/tasks_setup/tasks_setup_inh_widget.dart';
import 'package:uuid/v4.dart';

@RoutePage()
class NewEventScreen extends StatefulWidget {
  final Event? event;
  const NewEventScreen({super.key, this.event});

  @override
  State<NewEventScreen> createState() => _NewEventScreenState();
}

class _NewEventScreenState extends State<NewEventScreen> {
  final _pageController = PageController();
  int _activeStep = 0;

  final _titleController = TextEditingController();
  final _locationController = TextEditingController();
  final _descriptionController = TextEditingController();
  DateTime _dateTime = DateTime.now();

  XFile? _image;

  List<Subtask> _subtasks = [
    Subtask(
      uuid: const UuidV4().generate(),
      title: '',
      description: '',
      done: false,
    ),
  ];

  List<Guest> _guests = [
    Guest(
      uuid: const UuidV4().generate(),
      name: '',
      contacts: '',
    ),
  ];

  List<Expense> _expenses = [
    Expense(
      uuid: const UuidV4().generate(),
      name: '',
      amount: null,
    ),
  ];

  @override
  void initState() {
    super.initState();
    _pageController.addListener(listener);
    final event = widget.event;
    if (event != null) {
      _titleController.text = event.title;
      _locationController.text = event.location;
      _descriptionController.text = event.description;
      _dateTime = event.dateTime;
      final path = context.read<ImageService>().loadImage(event.imagePath).path;
      _image = XFile(path);
      _subtasks = List.from(event.subtasks);
      _guests = List.from(event.guests);
      _expenses = List.from(event.expenses);
    }
  }

  listener() => setState(() => _activeStep = _pageController.page!.round());

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MainInfoInheritedWidget(
      titleController: _titleController,
      locationController: _locationController,
      descriptionController: _descriptionController,
      dateTime: _dateTime,
      onDateTimeChanged: (value) => setState(() => _dateTime = value!),
      child: PhotoContentInheritedWidget(
        image: _image,
        onUpdated: (newImage) => setState(() => _image = newImage),
        onCleared: () => setState(() => _image = null),
        child: TasksSetupInheritedWidget(
          subtasks: _subtasks,
          child: GuestsInheritedWidget(
            guests: _guests,
            child: BudgetInheritedWidget(
              expenses: _expenses,
              child: Scaffold(
                backgroundColor: context.colors.surfaceBright,
                appBar: AppBar(
                  toolbarHeight: 80,
                  leading: const CustomBackButton(),
                  title: Text(
                    widget.event == null ? 'Add event' : 'Edit event',
                    style: context.text.bodyMedium,
                  ),
                  centerTitle: true,
                ),
                body: Container(
                  decoration: BoxDecoration(
                    color: context.colors.surfaceDim,
                    borderRadius:
                        const BorderRadius.vertical(top: Radius.circular(20)),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 30),
                      EasyStepper(
                        activeStep: _activeStep,
                        showLoadingAnimation: false,
                        borderThickness: 0,
                        stepRadius: 17,
                        internalPadding: 5,
                        showStepBorder: false,
                        lineStyle: const LineStyle(
                          lineType: LineType.normal,
                        ),
                        steps: [
                          EasyStep(
                            customStep: StepCircle(
                              step: 0,
                              activeStep: _activeStep,
                            ),
                            customTitle: StepTitle(
                              text: 'Main Info',
                              step: 0,
                              activeStep: _activeStep,
                            ),
                          ),
                          EasyStep(
                            customStep: StepCircle(
                              step: 1,
                              activeStep: _activeStep,
                            ),
                            customTitle: StepTitle(
                              text: 'Photo',
                              step: 1,
                              activeStep: _activeStep,
                            ),
                          ),
                          EasyStep(
                            customStep: StepCircle(
                              step: 2,
                              activeStep: _activeStep,
                            ),
                            customTitle: StepTitle(
                              text: 'Tasks Setup',
                              step: 2,
                              activeStep: _activeStep,
                            ),
                          ),
                          EasyStep(
                            customStep: StepCircle(
                              step: 3,
                              activeStep: _activeStep,
                            ),
                            customTitle: StepTitle(
                              text: 'Guests',
                              step: 3,
                              activeStep: _activeStep,
                            ),
                          ),
                          EasyStep(
                            customStep: StepCircle(
                              step: 4,
                              activeStep: _activeStep,
                            ),
                            customTitle: StepTitle(
                              text: 'Budget',
                              step: 4,
                              activeStep: _activeStep,
                            ),
                          ),
                        ],
                        onStepReached: (index) =>
                            setState(() => _activeStep = index),
                        enableStepTapping: false,
                      ),
                      Expanded(
                        child: PageView(
                          controller: _pageController,
                          physics: const NeverScrollableScrollPhysics(),
                          children: [
                            MainInfoContent(
                              submitButtonTitle: 'Next',
                              submitButtonCallback: () => nextPage(),
                            ),
                            PhotoContent(
                              submitButtonTitle: 'Next',
                              submitButtonCallback: () => nextPage(),
                            ),
                            TasksSetupContent(
                              submitButtonTitle: 'Next',
                              submitButtonCallback: () => nextPage(),
                            ),
                            GuestsContent(
                              submitButtonTitle: 'Next',
                              submitButtonCallback: () => nextPage(),
                            ),
                            BudgetContent(
                              submitButtonTitle: 'Save',
                              submitButtonCallback: () {
                                if (widget.event == null) {
                                  final event = Event(
                                    uuid: const UuidV4().generate(),
                                    title: _titleController.text,
                                    dateTime: _dateTime,
                                    location: _locationController.text,
                                    description: _descriptionController.text,
                                    imagePath: '',
                                    subtasks: _subtasks,
                                    guests: _guests,
                                    expenses: _expenses,
                                  );
                                  context.read<EventCubit>().create(
                                        event: event,
                                        image: _image!,
                                      );
                                } else {
                                  final event = widget.event!.copyWith(
                                    title: _titleController.text,
                                    dateTime: _dateTime,
                                    location: _locationController.text,
                                    description: _descriptionController.text,
                                    subtasks: _subtasks,
                                    guests: _guests,
                                    expenses: _expenses,
                                  );
                                  context.read<EventCubit>().update(
                                        event: event,
                                        newImage: _image,
                                      );
                                }
                                context.router.popForced();
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> nextPage() {
    return _pageController.nextPage(
      duration: Durations.medium1,
      curve: Curves.easeInOutCubicEmphasized,
    );
  }
}
