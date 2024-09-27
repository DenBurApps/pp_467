// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ArticleImpl _$$ArticleImplFromJson(Map<String, dynamic> json) =>
    _$ArticleImpl(
      date: json['date'] as String,
      title: json['title'] as String,
      body: json['body'] as String,
      url: json['url'] as String,
      image: json['image'] as String,
      source: json['source'] as String,
    );

Map<String, dynamic> _$$ArticleImplToJson(_$ArticleImpl instance) =>
    <String, dynamic>{
      'date': instance.date,
      'title': instance.title,
      'body': instance.body,
      'url': instance.url,
      'image': instance.image,
      'source': instance.source,
    };
