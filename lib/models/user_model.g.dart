// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as String,
      name: json['name'] as String?,
      email: json['email'] as String?,
      age: (json['age'] as num?)?.toInt(),
      isFirstTime: json['isFirstTime'] as bool? ?? true,
      hasCompletedSurvey: json['hasCompletedSurvey'] as bool? ?? false,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      surveyResponses:
          json['surveyResponses'] as Map<String, dynamic>? ?? const {},
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'age': instance.age,
      'isFirstTime': instance.isFirstTime,
      'hasCompletedSurvey': instance.hasCompletedSurvey,
      'createdAt': instance.createdAt?.toIso8601String(),
      'surveyResponses': instance.surveyResponses,
    };
