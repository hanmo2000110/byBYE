import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'survey_model.g.dart';

enum QuestionType {
  singleChoice,
  multipleChoice,
  text,
  scale,
  yesNo,
}

@JsonSerializable()
class SurveyQuestion extends Equatable {
  const SurveyQuestion({
    required this.id,
    required this.question,
    required this.type,
    this.options = const [],
    this.isRequired = true,
    this.order = 0,
    this.minValue,
    this.maxValue,
    this.placeholder,
  });

  final String id;
  final String question;
  final QuestionType type;
  final List<String> options;
  final bool isRequired;
  final int order;
  final int? minValue;
  final int? maxValue;
  final String? placeholder;

  factory SurveyQuestion.fromJson(Map<String, dynamic> json) =>
      _$SurveyQuestionFromJson(json);

  Map<String, dynamic> toJson() => _$SurveyQuestionToJson(this);

  SurveyQuestion copyWith({
    String? id,
    String? question,
    QuestionType? type,
    List<String>? options,
    bool? isRequired,
    int? order,
    int? minValue,
    int? maxValue,
    String? placeholder,
  }) {
    return SurveyQuestion(
      id: id ?? this.id,
      question: question ?? this.question,
      type: type ?? this.type,
      options: options ?? this.options,
      isRequired: isRequired ?? this.isRequired,
      order: order ?? this.order,
      minValue: minValue ?? this.minValue,
      maxValue: maxValue ?? this.maxValue,
      placeholder: placeholder ?? this.placeholder,
    );
  }

  @override
  List<Object?> get props => [
        id,
        question,
        type,
        options,
        isRequired,
        order,
        minValue,
        maxValue,
        placeholder,
      ];
}

@JsonSerializable()
class SurveyResponse extends Equatable {
  const SurveyResponse({
    required this.questionId,
    required this.answer,
    this.answeredAt,
  });

  final String questionId;
  final dynamic answer;
  final DateTime? answeredAt;

  factory SurveyResponse.fromJson(Map<String, dynamic> json) =>
      _$SurveyResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SurveyResponseToJson(this);

  SurveyResponse copyWith({
    String? questionId,
    dynamic answer,
    DateTime? answeredAt,
  }) {
    return SurveyResponse(
      questionId: questionId ?? this.questionId,
      answer: answer ?? this.answer,
      answeredAt: answeredAt ?? this.answeredAt,
    );
  }

  String get answerText {
    if (answer is List) {
      return (answer as List).join(', ');
    }
    return answer.toString();
  }

  @override
  List<Object?> get props => [questionId, answer, answeredAt];

  @override
  String toString() {
    return 'SurveyResponse(questionId: $questionId, answer: $answerText)';
  }
}