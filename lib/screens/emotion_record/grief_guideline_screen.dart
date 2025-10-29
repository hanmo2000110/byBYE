import 'package:flutter/material.dart';
import 'crying_guideline_screen.dart';
import 'anger_guideline_screen.dart';

class GriefGuidelineScreen extends StatefulWidget {
  final String currentStage;

  const GriefGuidelineScreen({
    super.key,
    required this.currentStage,
  });

  @override
  State<GriefGuidelineScreen> createState() => _GriefGuidelineScreenState();
}

class _GriefGuidelineScreenState extends State<GriefGuidelineScreen> {
  String? selectedWorry;

  final List<Map<String, String>> worries = [
    {
      'emoji': '😢',
      'text': '문득 생각나서 울컥할 때',
    },
    {
      'emoji': '💤',
      'text': '아무것도 하기 싫을 때',
    },
    {
      'emoji': '🕊️',
      'text': '누군가 내 슬픔을 이해하지 못할 때',
    },
    {
      'emoji': '🌙',
      'text': '이유 모를 분노에 휩싸일 때',
    },
    {
      'emoji': '😔',
      'text': '죄책감이 들 때',
    },
    {
      'emoji': '😔',
      'text': '남편과 대화하고 싶을 때',
    },
  ];

  @override
  void initState() {
    super.initState();
    selectedWorry = null;
  }

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
                  top: 60,
                  bottom: 30,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 제목
                    const Text(
                      '상실의 순간부터 회복의 과정까지,\n당신이 스스로를 돌볼 수 있도록\n도와주는 마음의 길잡이',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF2C2C2C),
                        height: 1.2,
                        fontFamily: 'Pretendard',
                      ),
                    ),
                    const SizedBox(height: 12),

                    // 부제목
                    Text(
                      '지금의 당신에게 필요한 세션을 선택해보세요.',
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF727272),
                        fontFamily: 'Pretendard',
                      ),
                    ),
                    const SizedBox(height: 300),
                  ],
                ),
              ),
            ),
          ),
          // 흰색 컨테이너
          Align(
            alignment: Alignment.bottomCenter,
            child: Transform.translate(
              offset: const Offset(0, 80),
              child: Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.8,
                padding: const EdgeInsets.only(top: 30, bottom: 50),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(59),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      // 상황 선택 버튼들
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          children: worries.map((worry) {
                            final isSelected = selectedWorry == worry['text'];
                            final isTouchable =
                                worry['text'] == '문득 생각나서 울컥할 때' ||
                                    worry['text'] == '이유 모를 분노에 휩싸일 때';
                            return Column(
                              children: [
                                GestureDetector(
                                  onTap: isTouchable
                                      ? () {
                                          if (worry['text'] ==
                                              '문득 생각나서 울컥할 때') {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    const CryingGuidelineScreen(),
                                              ),
                                            );
                                          } else if (worry['text'] ==
                                              '이유 모를 분노에 휩싸일 때') {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    const AngerGuidelineScreen(),
                                              ),
                                            );
                                          }
                                        }
                                      : null,
                                  child: Container(
                                    width: double.infinity,
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 15),
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 20,
                                      vertical: 12,
                                    ),
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFFFEDEB),
                                      borderRadius: BorderRadius.circular(24),
                                    ),
                                    child: Center(
                                      child: RichText(
                                        textAlign: TextAlign.center,
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text: worry['emoji'] ?? '',
                                              style:
                                                  const TextStyle(fontSize: 20),
                                            ),
                                            const TextSpan(
                                              text: ' ',
                                              style: TextStyle(fontSize: 15),
                                            ),
                                            TextSpan(
                                              text: worry['text'] ?? '',
                                              style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                                color: Color(0xFF656565),
                                                fontFamily: 'Pretendard',
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 16),
                              ],
                            );
                          }).toList(),
                        ),
                      ),

                      const SizedBox(height: 40),

                      // 충고하기 버튼
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: SizedBox(
                          width: 152,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.popUntil(
                                  context, (route) => route.isFirst);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFFF9999),
                              disabledBackgroundColor: const Color(0xFFFFCCCC),
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
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
