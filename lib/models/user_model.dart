import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class User extends Equatable {
  const User({
    required this.id,
    this.name,
    this.email,
    this.age,
    this.isFirstTime = true,
    this.hasCompletedSurvey = false,
    this.createdAt,
    this.surveyResponses = const {},
  });

  final String id;
  final String? name;
  final String? email;
  final int? age;
  final bool isFirstTime;
  final bool hasCompletedSurvey;
  final DateTime? createdAt;
  final Map<String, dynamic> surveyResponses;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  User copyWith({
    String? id,
    String? name,
    String? email,
    int? age,
    bool? isFirstTime,
    bool? hasCompletedSurvey,
    DateTime? createdAt,
    Map<String, dynamic>? surveyResponses,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      age: age ?? this.age,
      isFirstTime: isFirstTime ?? this.isFirstTime,
      hasCompletedSurvey: hasCompletedSurvey ?? this.hasCompletedSurvey,
      createdAt: createdAt ?? this.createdAt,
      surveyResponses: surveyResponses ?? this.surveyResponses,
    );
  }

  bool get hasBasicInfo => name != null && name!.isNotEmpty;

  @override
  List<Object?> get props => [
        id,
        name,
        email,
        age,
        isFirstTime,
        hasCompletedSurvey,
        createdAt,
        surveyResponses,
      ];

  @override
  String toString() {
    return 'User(id: $id, name: $name, hasCompletedSurvey: $hasCompletedSurvey)';
  }
}