import 'package:flutter/material.dart';

class GuiltGuidelineScreen extends StatefulWidget {
  const GuiltGuidelineScreen({super.key});

  @override
  State<GuiltGuidelineScreen> createState() => _GuiltGuidelineScreenState();
}

class _GuiltGuidelineScreenState extends State<GuiltGuidelineScreen> {
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
                      '죄책감을 어떻게 해소해야 될지\n모르겠어요',
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
                                  '죄책감은 아이를 얼마나 사랑했는지를 보여주는 깊은 감정입니다.\n유산의 원인을 자신에게 돌리려는 마음은, 사실 "그만큼 아이를 지키고 싶었다"는 마음의 다른 표현입니다.',
                            ),
                            const SizedBox(height: 20),

                            // 섹션 2: 지금 필요한 마음의 동작
                            _buildSection(
                              number: '2',
                              title: '지금 필요한 마음의 동작',
                              content:
                                  '마음이 완전히 믿지 못하더라도 괜찮아요.\n그 문장을 조용히 되뇌는 것부터가 회복의 시작입니다.',
                            ),
                            const SizedBox(height: 20),

                            // 섹션 3: 회복 루틴
                            _buildSection(
                              number: '3',
                              title: '회복 루틴',
                              content:
                                  '죄책감은 사라지는 감정이 아니라, 시간이 지나며 \'사랑의 흔적\'으로 변형됩니다. 어느 날 그 감정을 떠올리며 "그만큼 사랑했었지"라고 말할 수 있게 된다면, 그것이 바로 회복의 순간입니다.',
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
