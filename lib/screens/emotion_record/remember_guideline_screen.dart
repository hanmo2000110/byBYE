import 'package:flutter/material.dart';

class RememberGuidelineScreen extends StatefulWidget {
  const RememberGuidelineScreen({super.key});

  @override
  State<RememberGuidelineScreen> createState() =>
      _RememberGuidelineScreenState();
}

class _RememberGuidelineScreenState extends State<RememberGuidelineScreen> {
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
                      '앞으로 아이를 어떻게 떠올리고,\n어떤 방식으로 기억해나갈 수 있을까요?',
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
                                  '시간이 지나면 슬픔의 형태는 바뀝니다.\n처음처럼 날카롭지 않지만, 여전히 마음 한편에서 아이의 존재가 느껴질 때가 있습니다.',
                            ),
                            const SizedBox(height: 20),

                            // 섹션 2: 지금 필요한 마음의 동작
                            _buildSection(
                              number: '2',
                              title: '지금 필요한 마음의 동작',
                              content:
                                  '가까운 사람과 아이에 대한 이야기를 나누거나, 글·사진·그림 등으로 표현해보세요.\n나눔은 상실을 개인의 고통에서 공유된 사랑의 이야기로 바꾸어줍니다.',
                            ),
                            const SizedBox(height: 20),

                            // 섹션 3: 회복 루틴
                            _buildSection(
                              number: '3',
                              title: '회복 루틴',
                              content:
                                  '아이를 떠올릴 때 눈물이 아닌 따뜻한 미소가 먼저 떠오른다면, 그 기억은 이미 당신 안에서 사랑의 형태로 자리 잡은 것입니다.',
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
