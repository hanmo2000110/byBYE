import 'package:flutter/material.dart';
import 'grief_guideline_screen.dart';
import 'emotion_review_screen.dart';

class EmotionResultScreen extends StatefulWidget {
  final List<String>? selectedEmotions;
  final String? expressionText;
  final int? emotionScore; // emotion_record에서 계산된 점수
  final Map<String, int>? stageScores; // 단계별 점수

  const EmotionResultScreen({
    super.key,
    this.selectedEmotions,
    this.expressionText,
    this.emotionScore,
    this.stageScores,
  });

  @override
  State<EmotionResultScreen> createState() => _EmotionResultScreenState();
}

class _EmotionResultScreenState extends State<EmotionResultScreen> {
  final List<String> processEmotions = ['부정', '분노', '타협', '우울', '수용'];

  // 점수 기준값들 (수정하기 편하게 상수로 분리)
  static const int defaultScore = 1; // 기본값
  static const int denialThreshold = 10; // 부정 단계 상한
  static const int angerThreshold = 20; // 분노 단계 상한
  static const int bargainingThreshold = 30; // 타협 단계 상한
  static const int depressionThreshold = 40; // 우울 단계 상한
  // 41점 이상은 수용 단계

  // 애도 단계별 감정 매핑 (추천 우선순위 기반)
  final Map<String, List<String>> stageEmotions = {
    '부정': ['불안', '답답함', '혼란', '회피'],
    '분노': ['분노', '억울함', '서운함', '질투/원망'],
    '타협': ['미안함', '죄책감', '자책감', '수치심'],
    '우울': ['무기력함', '자기혐오', '불쌍함', '체념'],
    '수용': ['평안', '감사함', '따뜻함', '후련함'],
  };

  // emotion_record에서 계산된 점수 가져오기
  int getEmotionScore() {
    return widget.emotionScore ?? defaultScore; // 기본값 사용
  }

  // 단계별 점수에 따른 애도 단계 결정
  String getCurrentStage() {
    Map<String, int> stageScores = widget.stageScores ?? {};

    if (stageScores.isEmpty) {
      // 기존 방식으로 fallback
      int score = getEmotionScore();
      if (score <= denialThreshold) return '부정';
      if (score <= angerThreshold) return '분노';
      if (score <= bargainingThreshold) return '타협';
      if (score <= depressionThreshold) return '우울';
      return '수용';
    }

    // 가장 높은 점수를 가진 단계 찾기 (동점시 더 왼쪽/앞쪽 단계 우선)
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

    print('\n=== EmotionResultScreen ===');
    print('전달받은 선택된 감정들: ${widget.selectedEmotions}');
    print('전달받은 단계별 점수: $stageScores');
    print('결정된 애도 단계: $dominantStage (${maxScore}점)');
    print('============================\n');

    return dominantStage;
  }

  // 현재 단계에 따른 상위 감정들 반환
  List<String> getTopEmotions() {
    String currentStage = getCurrentStage();
    return stageEmotions[currentStage] ?? ['불안', '답답함', '좋은', '화남'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAF0F0),
      resizeToAvoidBottomInset: false,
      extendBody: true,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 30,
                right: 30,
                top: 80,
                bottom: 30,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '당신의 감정을 토대로\n분석해봤어요.',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF2C2C2C),
                        height: 1.4,
                        fontFamily: 'Pretendard',
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Wrap(
                    spacing: 16,
                    runSpacing: 16,
                    alignment: WrapAlignment.center,
                    children: getTopEmotions().map((emotion) {
                      return Container(
                        width: 70,
                        height: 70,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: const Color(0xFFFF8B8B),
                            width: 1.5,
                          ),
                          color: Colors.white,
                        ),
                        child: Center(
                          child: Text(
                            emotion,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFFFF8B8B),
                              fontFamily: 'Pretendard',
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    "'불안하다'는 감정을 가장 많이 느끼고 있어요.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF999999),
                      fontFamily: 'Pretendard',
                    ),
                  ),
                  const SizedBox(height: 400),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Transform.translate(
              offset: const Offset(0, 250),
              child: Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.9,
                padding: const EdgeInsets.only(top: 20, bottom: 50),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(59),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Center(
                      child: Image.asset(
                        'assets/images/illustrations/emotion.png',
                        height: 100,
                        width: 94,
                        fit: BoxFit.contain,
                      ),
                    ),
                    const SizedBox(height: 30),
                    Wrap(
                      spacing: 12,
                      runSpacing: 12,
                      alignment: WrapAlignment.center,
                      children: processEmotions.map((emotion) {
                        final isSelected = emotion == getCurrentStage();
                        return Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: isSelected
                                ? const Color(0xFFFF8B8B)
                                : const Color(0xFFFFDDDD),
                          ),
                          child: Center(
                            child: Text(
                              emotion,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: isSelected
                                    ? Colors.white
                                    : const Color(0xFFC0A0A0),
                                fontFamily: 'Pretendard',
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Text(
                        '애도 과정 중에 \'${getCurrentStage()}\'단계에 있습니다.\n애도 가이드라인을 읽어보는 것은 어떨까요?',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF999999),
                          fontFamily: 'Pretendard',
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: SizedBox(
                        width: 300,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => GriefGuidelineScreen(
                                  currentStage: getCurrentStage(),
                                ),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFF8F8F8),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            elevation: 0,
                          ),
                          child: const Column(
                            children: [
                              Text(
                                '애도 가이드라인 바로가기',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF2C2C2C),
                                  fontFamily: 'Pretendard',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: SizedBox(
                        width: 300,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => EmotionReviewScreen(
                                  expressionText: widget.expressionText,
                                ),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFF8F8F8),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            elevation: 0,
                          ),
                          child: const Column(
                            children: [
                              Text(
                                '내가 기록한 감정 다시 읽어보기',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF2C2C2C),
                                  fontFamily: 'Pretendard',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: SizedBox(
                        width: 117,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.popUntil(
                                context, (route) => route.isFirst);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFFF8B8B),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                            elevation: 0,
                          ),
                          child: const Text(
                            '완료',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                              fontFamily: 'Pretendard',
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
