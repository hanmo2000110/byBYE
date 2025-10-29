import 'package:flutter/material.dart';
import 'emotion_result_screen.dart';

class EmotionExpressionScreen extends StatefulWidget {
  final List<String>? selectedEmotions;
  final int? emotionScore;
  final Map<String, int>? stageScores;

  const EmotionExpressionScreen({
    Key? key,
    this.selectedEmotions,
    this.emotionScore,
    this.stageScores,
  }) : super(key: key);

  @override
  State<EmotionExpressionScreen> createState() =>
      _EmotionExpressionScreenState();
}

class _EmotionExpressionScreenState extends State<EmotionExpressionScreen> {
  late TextEditingController _textController;
  bool _hasText = false;

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController();
    _textController.addListener(() {
      setState(() {
        _hasText = _textController.text.isNotEmpty;
      });
    });

    // 전달받은 점수 출력
    print('\n=== EmotionExpressionScreen ===');
    print('전달받은 선택된 감정들: ${widget.selectedEmotions}');
    print('전달받은 감정 점수: ${widget.emotionScore}점');
    print('================================\n');
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 30,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // 제목
                      const Text(
                        '내 감정을 더 표현하고 싶다면\n자유롭게 적어볼까요?',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF2C2C2C),
                          height: 1.4,
                        ),
                      ),
                      const SizedBox(height: 8),
                      // 부제목
                      const Text(
                        '빈 박스를 눌러주세요.',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF999999),
                        ),
                      ),
                      const SizedBox(height: 30),
                      // 텍스트 입력 영역
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: const Color(0xFFFF8B8B),
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: TextField(
                          controller: _textController,
                          maxLines: 15,
                          minLines: 15,
                          keyboardType: TextInputType.multiline,
                          textInputAction: TextInputAction.newline,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide.none,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide.none,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide.none,
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 20,
                            ),
                            hintText: '여기에 자유롭게 작성해주세요...',
                            hintStyle: const TextStyle(
                              color: Color(0xFFCCCCCC),
                              fontSize: 14,
                            ),
                          ),
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF2C2C2C),
                            height: 1.6,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // 하단 버튼들
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 30,
                vertical: 20,
              ),
              child: Row(
                children: [
                  // 건너뛰기 버튼
                  Expanded(
                    child: SizedBox(
                      height: 50,
                      child: OutlinedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EmotionResultScreen(
                                selectedEmotions: widget.selectedEmotions,
                                emotionScore: widget.emotionScore,
                                stageScores: widget.stageScores,
                              ),
                            ),
                          );
                        },
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(
                            color: Color(0xFFE8E8E8),
                            width: 1.5,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                        child: const Text(
                          '건너뛰기',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF2C2C2C),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  // 확인 버튼
                  Expanded(
                    child: SizedBox(
                      height: 50,
                      child: ElevatedButton(
                        onPressed: _hasText
                            ? () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => EmotionResultScreen(
                                      selectedEmotions: widget.selectedEmotions,
                                      expressionText: _textController.text,
                                      emotionScore: widget.emotionScore,
                                      stageScores: widget.stageScores,
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
                          '확인',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
