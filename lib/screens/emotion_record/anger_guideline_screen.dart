import 'package:flutter/material.dart';

class AngerGuidelineScreen extends StatefulWidget {
  const AngerGuidelineScreen({super.key});

  @override
  State<AngerGuidelineScreen> createState() => _AngerGuidelineScreenState();
}

class _AngerGuidelineScreenState extends State<AngerGuidelineScreen> {
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
                      '이유 모를 분노에\n휩싸일 때가 있나요?',
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
                        'assets/icons/anger.png',
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
                                  '분노는 상실의 또 다른 얼굴이에요.\n\'왜 이런 일이 내게 생겼을까\'라는 질문 안에는 슬픔과 억울함이 숨어 있습니다.',
                            ),
                            const SizedBox(height: 20),

                            // 섹션 2: 지금 필요한 마음의 동작
                            _buildSection(
                              number: '2',
                              title: '지금 필요한 마음의 동작',
                              content:
                                  '\'분노가 틀린 감정\'이 아님을 기억하세요.\n다만 그 분노를 표출할 수 있는 안전한 공간이 필요해요.',
                            ),
                            const SizedBox(height: 20),

                            // 섹션 3: 회복 루틴
                            _buildSection(
                              number: '3',
                              title: '회복 루틴',
                              content:
                                  '안전한 분노 표현 연습\n • 감정 기록에 현재 마음을 그대로 써내려가기 (ex. "나는\n   화가 난다…"로 시작)\n • 찢거나, 구겨버리는 행위로 감정의 에너지를 \'끝\'내기\n • 감정이 정리되면, \'진짜 화난 이유\'를 짧게 적기',
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
