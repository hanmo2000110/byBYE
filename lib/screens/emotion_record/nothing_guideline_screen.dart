import 'package:flutter/material.dart';

class NothingGuidelineScreen extends StatefulWidget {
  const NothingGuidelineScreen({super.key});

  @override
  State<NothingGuidelineScreen> createState() => _NothingGuidelineScreenState();
}

class _NothingGuidelineScreenState extends State<NothingGuidelineScreen> {
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
                      '아무것도 하기 싫을 때가 있나요?',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
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
                                  '상실 이후에는 신체적·정서적으로 에너지가 고갈되어,\n평소에 즐겁던 일조차 무의미하게 느껴질 수 있습니다.\n\'아무것도 하기 싫다\'는 회복이 멈춘 것이 아니라, 몸과 마음이 회복을 준비하고 있는 신호입니다.',
                            ),
                            const SizedBox(height: 20),

                            // 섹션 2: 지금 필요한 마음의 동작
                            _buildSection(
                              number: '2',
                              title: '지금 필요한 마음의 동작',
                              content:
                                  '아무것도 하지 않는 시간도 회복의 일부입니다.\n억지로 일어나려 하지 말고, "나는 지금 쉬고 있다"고 인식해보세요.',
                            ),
                            const SizedBox(height: 20),

                            // 섹션 3: 회복 루틴
                            _buildSection(
                              number: '3',
                              title: '회복 루틴',
                              content:
                                  '며칠 후, 아주 작게라도 "이건 해볼까?"라는 생각이 들 때가 올 거예요. 그때가 바로 몸과 마음이 회복을 시작했다는 신호입니다.',
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
                          // 종료하기 버튼
                          SizedBox(
                            width: 152,
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
