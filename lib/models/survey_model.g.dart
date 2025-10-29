// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'survey_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SurveyQuestion _$SurveyQuestionFromJson(Map<String, dynamic> json) =>
    SurveyQuestion(
      id: json['id'] as String,
      question: json['question'] as String,
      type: $enumDecode(_$QuestionTypeEnumMap, json['type']),
      options: (json['options'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      isRequired: json['isRequired'] as bool? ?? true,
      order: (json['order'] as num?)?.toInt() ?? 0,
      minValue: (json['minValue'] as num?)?.toInt(),
      maxValue: (json['maxValue'] as num?)?.toInt(),
      placeholder: json['placeholder'] as String?,
    );

Map<String, dynamic> _$SurveyQuestionToJson(SurveyQuestion instance) =>
    <String, dynamic>{
      'id': instance.id,
      'question': instance.question,
      'type': _$QuestionTypeEnumMap[instance.type]!,
      'options': instance.options,
      'isRequired': instance.isRequired,
      'order': instance.order,
      'minValue': instance.minValue,
      'maxValue': instance.maxValue,
      'placeholder': instance.placeholder,
    };

const _$QuestionTypeEnumMap = {
  QuestionType.singleChoice: 'singleChoice',
  QuestionType.multipleChoice: 'multipleChoice',
  QuestionType.text: 'text',
  QuestionType.scale: 'scale',
  QuestionType.yesNo: 'yesNo',
};

SurveyResponse _$SurveyResponseFromJson(Map<String, dynamic> json) =>
    SurveyResponse(
      questionId: json['questionId'] as String,
      answer: json['answer'],
      answeredAt: json['answeredAt'] == null
          ? null
          : DateTime.parse(json['answeredAt'] as String),
    );

Map<String, dynamic> _$SurveyResponseToJson(SurveyResponse instance) =>
    <String, dynamic>{
      'questionId': instance.questionId,
      'answer': instance.answer,
      'answeredAt': instance.answeredAt?.toIso8601String(),
    };
