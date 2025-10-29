import 'package:flutter/material.dart';
import 'emotion_expression_screen.dart';

class EmotionRecordScreen extends StatefulWidget {
  const EmotionRecordScreen({super.key});

  @override
  State<EmotionRecordScreen> createState() => _EmotionRecordScreenState();
}

class _EmotionRecordScreenState extends State<EmotionRecordScreen> {
  Set<String> selectedEmotions = {};

  final List<String> emotions = [
    '마음이 불안해요',
    '너무 미안해요',
    '남편이 너무 미워요',
    '괜찮아요',
    '숨이 막힐 듯 답답해요',
    '후련해요',
    '보고싶어요',
    '내 탓인 것만 같아요',
    '억울해요',
    '도망가고 싶어요',
    '자신감이 생겨요',
    '서운한 마음이 들어요',
    '내 자신이 불쌍해요',
    '내 모습이 창피해요',
    '머릿속이 복잡해요',
    '평안해요',
    '따뜻해요',
    '남편에게 고마워',
    '내 자신이 너무 싫어요',
    '감사해요',
  ];

  // 각 감정별 단계 점수 매핑 (부정, 분노, 타협, 우울, 수용)
  final Map<String, Map<String, int>> emotionStageScores = {
    '마음이 불안해요': {'부정': 2, '분노': 0, '타협': 0, '우울': 0, '수용': 0},
    '너무 미안해요': {'부정': 0, '분노': 0, '타협': 2, '우울': 0, '수용': 0},
    '남편이 너무 미워요': {'부정': 0, '분노': 3, '타협': 0, '우울': 0, '수용': 0},
    '괜찮아요': {'부정': 0, '분노': 0, '타협': 0, '우울': 0, '수용': 2},
    '숨이 막힐 듯 답답해요': {'부정': 3, '분노': 0, '타협': 0, '우울': 0, '수용': 0},
    '후련해요': {'부정': 0, '분노': 0, '타협': 0, '우울': 0, '수용': 3},
    '보고싶어요': {'부정': 0, '분노': 0, '타협': 0, '우울': 1, '수용': 0},
    '내 탓인 것만 같아요': {'부정': 0, '분노': 0, '타협': 3, '우울': 1, '수용': 0},
    '억울해요': {'부정': 0, '분노': 2, '타협': 0, '우울': 0, '수용': 0},
    '도망가고 싶어요': {'부정': 2, '분노': 0, '타협': 0, '우울': 0, '수용': 0},
    '자신감이 생겨요': {'부정': 0, '분노': 0, '타협': 0, '우울': 0, '수용': 3},
    '서운한 마음이 들어요': {'부정': 0, '분노': 1, '타협': 0, '우울': 0, '수용': 0},
    '내 자신이 불쌍해요': {'부정': 0, '분노': 0, '타협': 0, '우울': 2, '수용': 0},
    '내 모습이 창피해요': {'부정': 0, '분노': 0, '타협': 3, '우울': 0, '수용': 0},
    '머릿속이 복잡해요': {'부정': 2, '분노': 0, '타협': 0, '우울': 0, '수용': 0},
    '평안해요': {'부정': 0, '분노': 0, '타협': 0, '우울': 0, '수용': 3},
    '따뜻해요': {'부정': 0, '분노': 0, '타협': 0, '우울': 0, '수용': 3},
    '남편에게 고마워': {'부정': 0, '분노': 0, '타협': 0, '우울': 0, '수용': 2},
    '내 자신이 너무 싫어요': {'부정': 0, '분노': 0, '타협': 0, '우울': 4, '수용': 0},
    '감사해요': {'부정': 0, '분노': 0, '타협': 0, '우울': 0, '수용': 3},
  };

  // 선택된 감정들의 단계별 점수 계산
  Map<String, int> calculateStageScores() {
    Map<String, int> stageScores = {
      '부정': 0,
      '분노': 0,
      '타협': 0,
      '우울': 0,
      '수용': 0,
    };

    print('\n=== 감정 단계별 점수 계산 ===');
    print('선택된 감정들: $selectedEmotions');

    for (String emotion in selectedEmotions) {
      Map<String, int> emotionScores = emotionStageScores[emotion] ?? {};
      print('$emotion:');
      for (String stage in stageScores.keys) {
        int score = emotionScores[stage] ?? 0;
        stageScores[stage] = stageScores[stage]! + score;
        if (score > 0) print('  $stage: +$score점');
      }
    }

    print('최종 단계별 점수:');
    stageScores.forEach((stage, score) {
      print('  $stage: $score점');
    });
    print('=================================\n');

    return stageScores;
  }

  // 가장 높은 점수의 단계 반환 (기존 호환성을 위해 유지)
  int calculateTotalScore() {
    Map<String, int> stageScores = calculateStageScores();

    // 동점시 더 왼쪽 단계 우선 (부정 → 분노 → 타협 → 우울 → 수용)
    List<String> stageOrder = ['부정', '분노', '타협', '우울', '수용'];
    String dominantStage = '부정';
    int maxScore = 0;

    for (String stage in stageOrder) {
      int score = stageScores[stage] ?? 0;
      if (score > maxScore) {
        maxScore = score;
        dominantStage = stage;
      }
    }

    // 단계별로 점수 범위 매핑 (기존 코드 호환성을 위해)
    switch (dominantStage) {
      case '부정':
        return 5;
      case '분노':
        return 15;
      case '타협':
        return 25;
      case '우울':
        return 35;
      case '수용':
        return 45;
      default:
        return 1;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 40,
                  right: 20,
                  top: 30,
                  bottom: 100,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      '오늘 하루, 내 마음과 가장 가까운\n감정을 골라볼까요?',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF2C2C2C),
                        height: 1.4,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      '최대 5개까지 고를 수 있어요.',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF999999),
                      ),
                    ),
                    const SizedBox(height: 30),
                    Column(
                      children: [
                        for (int i = 0; i < emotions.length; i += 2)
                          Padding(
                            padding: const EdgeInsets.only(bottom: 12),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                _buildEmotionButton(emotions[i]),
                                if (i + 1 < emotions.length) ...[
                                  const SizedBox(width: 12),
                                  _buildEmotionButton(emotions[i + 1]),
                                ],
                              ],
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Center(
                child: SizedBox(
                  width: 130,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: selectedEmotions.isNotEmpty
                        ? () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => EmotionExpressionScreen(
                                  selectedEmotions: selectedEmotions.toList(),
                                  emotionScore: calculateTotalScore(),
                                  stageScores: calculateStageScores(),
                                ),
                              ),
                            );
                          }
                        : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFF9999),
                      disabledBackgroundColor: const Color(0xFFFFCCCC),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      elevation: 0,
                    ),
                    child: const Text(
                      '다음',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmotionButton(String emotion) {
    final isSelected = selectedEmotions.contains(emotion);
    final canSelect = selectedEmotions.length < 5 || isSelected;

    return GestureDetector(
      onTap: canSelect
          ? () {
              setState(() {
                if (isSelected) {
                  selectedEmotions.remove(emotion);
                } else {
                  selectedEmotions.add(emotion);
                }
              });
            }
          : null,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 5.5,
        ),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFFF9999) : Colors.white,
          border: Border.all(
            color: isSelected
                ? const Color(0xFFFF9999)
                : canSelect
                    ? const Color(0xFFFF9999)
                    : Colors.grey.shade300,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          emotion,
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w500,
            color: Colors.black,
            letterSpacing: 0.8,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
