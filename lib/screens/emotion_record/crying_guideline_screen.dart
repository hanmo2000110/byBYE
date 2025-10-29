import 'package:flutter/material.dart';

class CryingGuidelineScreen extends StatefulWidget {
  const CryingGuidelineScreen({super.key});

  @override
  State<CryingGuidelineScreen> createState() => _CryingGuidelineScreenState();
}

class _CryingGuidelineScreenState extends State<CryingGuidelineScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFEDEB),
      body: Stack(
        children: [
          // 기존 상단 콘텐츠
          SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 35,
                  right: 20,
                  top: 50,
                  bottom: 30,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 제목
                    const Text(
                      '문득 생각나서 울컥할 때\n어떻게 해야 되나요?',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF656565),
                        height: 1,
                        fontFamily: 'Pretendard',
                      ),
                    ),
                    const SizedBox(height: 266),
                  ],
                ),
              ),
            ),
          ),
          // 흰색 컨테이너
          Align(
            alignment: Alignment.bottomCenter,
            child: Transform.translate(
              offset: const Offset(0, -10),
              child: Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.8,
                padding: const EdgeInsets.only(top: 20, bottom: 35),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(59),
                ),
                child: Column(
                  children: [
                    // 일러스트레이션
                    Center(
                      child: Image.asset(
                        'assets/icons/crying.png',
                        height: 100,
                        width: 76,
                        fit: BoxFit.contain,
                      ),
                    ),
                    const SizedBox(height: 26),

                    // 섹션들
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 50, right: 50),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // 섹션 1: 감정 이해
                            _buildSection(
                              number: '1',
                              title: '감정 이해',
                              content:
                                  '당신이 느끼는 ‘울컥함’은 회복이 멈춘 것이 아니라,\n여전히 그만큼 사랑했던 기억이 살아 있다는 신호예요.\n그리움은 사라지는 게 아니라, 조금씩 ‘함께 살아가는\n감정’으로 변합니다.',
                            ),
                            const SizedBox(height: 20),

                            // 섹션 2: 자존 필요한 마음의 동작
                            _buildSection(
                              number: '2',
                              title: '지금 필요한 마음의 동작',
                              content:
                                  '울음은 감정의 정리 과정이에요. 참지 말고 흐르게 두세요. 갑작스러운 감정의 파도에 휩싸이면, "지금 나는 ○○을 떠올리고 있구나"라고 이름 붙여보세요.\n\n감정의 이름을 붙이는 순간, 당신은 이미 그 감정을 \'다루고 있는 중\'이에요.',
                            ),
                            const SizedBox(height: 20),

                            // 섹션 3: 회복 루틴
                            _buildSection(
                              number: '3',
                              title: '회복 루틴',
                              content:
                                  'byBYE 장치를 이용하여 울음을 위한 공간 만들기\n • 방의 조명을 조금 어둡게 하고, 편한 자세로 앉기\n • 눈물이 흐르더라도 닦지 말고 그대로 느끼기\n • 마음이 진정되면, 짧게 메모하기 → "이 순간 내가 그리\n    운 건…"',
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Spacer(),
                    // 버튼 영역
                    Padding(
                      padding: const EdgeInsets.only(left: 50, right: 50),
                      child: Column(
                        children: [
                          // 충고하기 버튼
                          SizedBox(
                            width: double.infinity,
                            height: 50,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFFFF9999),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                elevation: 0,
                              ),
                              child: const Text(
                                '종료하기',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                  fontFamily: 'Pretendard',
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
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSection({
    required String number,
    required String title,
    required String content,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 섹션 번호와 제목
        RichText(
          textAlign: TextAlign.left,
          text: TextSpan(
            children: [
              TextSpan(
                text: number,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF656565),
                  fontFamily: 'Pretendard',
                ),
              ),
              TextSpan(
                text: '. $title',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF656565),
                  fontFamily: 'Pretendard',
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),

        // 섹션 내용
        Text(
          content,
          textAlign: TextAlign.left,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: Color(0xFF666666),
            height: 1.5,
            fontFamily: 'Pretendard',
          ),
        ),
      ],
    );
  }
}
