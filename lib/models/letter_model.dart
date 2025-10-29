import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'letter_model.g.dart';

enum LetterType {
  farewell,
  love,
  memory,
  hope,
  gratitude,
  custom,
}

@JsonSerializable()
class Letter extends Equatable {
  const Letter({
    required this.id,
    required this.title,
    required this.content,
    required this.type,
    this.babyName,
    this.gestationWeeks,
    this.dateWritten,
    this.isTemplate = false,
    this.isFavorite = false,
    this.tags = const [],
    this.createdAt,
    this.updatedAt,
  });

  final String id;
  final String title;
  final String content;
  final LetterType type;
  final String? babyName;
  final int? gestationWeeks;
  final DateTime? dateWritten;
  final bool isTemplate;
  final bool isFavorite;
  final List<String> tags;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory Letter.fromJson(Map<String, dynamic> json) => _$LetterFromJson(json);

  Map<String, dynamic> toJson() => _$LetterToJson(this);

  Letter copyWith({
    String? id,
    String? title,
    String? content,
    LetterType? type,
    String? babyName,
    int? gestationWeeks,
    DateTime? dateWritten,
    bool? isTemplate,
    bool? isFavorite,
    List<String>? tags,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Letter(
      id: id ?? this.id,
      title: title ?? this.title,
      content: content ?? this.content,
      type: type ?? this.type,
      babyName: babyName ?? this.babyName,
      gestationWeeks: gestationWeeks ?? this.gestationWeeks,
      dateWritten: dateWritten ?? this.dateWritten,
      isTemplate: isTemplate ?? this.isTemplate,
      isFavorite: isFavorite ?? this.isFavorite,
      tags: tags ?? this.tags,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  String get typeDisplayName {
    switch (type) {
      case LetterType.farewell:
        return '작별 인사';
      case LetterType.love:
        return '사랑의 편지';
      case LetterType.memory:
        return '추억 이야기';
      case LetterType.hope:
        return '희망의 메시지';
      case LetterType.gratitude:
        return '감사의 마음';
      case LetterType.custom:
        return '자유 형식';
    }
  }

  int get wordCount => content.replaceAll(RegExp(r'\s+'), ' ').split(' ').length;

  String get shortContent {
    if (content.length <= 100) return content;
    return '${content.substring(0, 100)}...';
  }

  bool get hasBabyInfo => babyName != null && babyName!.isNotEmpty;

  @override
  List<Object?> get props => [
        id,
        title,
        content,
        type,
        babyName,
        gestationWeeks,
        dateWritten,
        isTemplate,
        isFavorite,
        tags,
        createdAt,
        updatedAt,
      ];

  @override
  String toString() {
    return 'Letter(id: $id, title: $title, type: $typeDisplayName, wordCount: $wordCount)';
  }
}