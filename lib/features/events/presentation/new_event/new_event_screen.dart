import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pp_467/core/extensions/theme_context_extension.dart';
import 'package:pp_467/core/ui_kit/custom_back_button.dart';
import 'package:pp_467/core/ui_kit/section.dart';
import 'package:pp_467/features/events/domain/entities/event/event.dart';
import 'package:easy_stepper/easy_stepper.dart';
import 'package:pp_467/features/events/domain/entities/expense/expense.dart';
import 'package:pp_467/features/events/domain/entities/guest/guest.dart';
import 'package:pp_467/features/events/domain/entities/subtask/subtask.dart';
import 'package:pp_467/features/events/domain/st_mgmt/event_cubit.dart';
import 'package:pp_467/features/events/presentation/home_screen.dart';
import 'package:pp_467/features/events/presentation/new_event/budget/budget_content.dart';
import 'package:pp_467/features/events/presentation/new_event/budget/budget_inh_widget.dart';
import 'package:pp_467/features/events/presentation/new_event/guests/guests_content.dart';
import 'package:pp_467/features/events/presentation/new_event/guests/guests_inh_widget.dart';
import 'package:pp_467/features/events/presentation/new_event/main_info/main_info_content.dart';
import 'package:pp_467/features/events/presentation/new_event/main_info/main_info_inh_widget.dart';
import 'package:pp_467/features/events/presentation/new_event/photo/photo_content.dart';
import 'package:pp_467/features/events/presentation/new_event/photo/photo_inh_widget.dart';
import 'package:pp_467/features/events/presentation/new_event/step_circle.dart';
import 'package:pp_467/features/events/presentation/new_event/step_title.dart';
import 'package:pp_467/features/events/presentation/new_event/tasks_setup/tasks_setup_content.dart';
import 'package:pp_467/features/events/presentation/new_event/tasks_setup/tasks_setup_inh_widget.dart';
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

  final List<Subtask> _subtasks = [];

  final List<Guest> _guests = [];

  final List<Expense> _expenses = [];

  @override
  void initState() {
    super.initState();
    _pageController.addListener(listener);
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
                                      image: _image,
                                    );
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
