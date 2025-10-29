import 'package:flutter/material.dart';
import 'archive_detail_screen.dart';

class ArchiveScreen extends StatefulWidget {
  const ArchiveScreen({Key? key}) : super(key: key);

  @override
  State<ArchiveScreen> createState() => _ArchiveScreenState();
}

class _ArchiveScreenState extends State<ArchiveScreen> {
  // 2025년 10월 달력 데이터
  // -1: 빈 칸(날짜 없음), 0: 미기록, 1: 기록됨
  // 10월은 수요일(W)로 시작, 토요일(S)로 끝남
  final List<int> calendarDays = [
    -1, -1, -1, 1, 1, 1, 0, // 1주차 (빈칸, 빈칸, 빈칸, 1일, 2, 3, 4)
    1, 1, 0, 1, 1, 1, 0, // 2주차 (5-11)
    1, 1, 1, 1, 1, 1, 1, // 3주차 (12-18)
    1, 1, 1, 1, 1, 1, 0, // 4주차 (19-25)
    0, 1, 1, 1, 1, 0, // 5주차 (26-31, 31일은 토요일)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFEDEB),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 30,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // 텍스트 영역
                      Padding(
                        padding: const EdgeInsets.only(left: 40, right: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // 제목
                            const Text(
                              '그동안의 감정들을\n차곡차곡 모았어요.',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: Color(0xFF656565),
                                height: 1,
                                fontFamily: 'Pretendard',
                              ),
                            ),
                            const SizedBox(height: 12),

                            // 부제목
                            const Text(
                              '감정을 되돌아보고 싶은 날짜를 선택해주세요.\n이곳은 그동안 당신의 감정들이 차곡차곡 쌓여 만들어진\n감정 아카이브입니다.',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFFB3B3B3),
                                height: 1,
                                fontFamily: 'Pretendard',
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 40),

                      // 달력 컨테이너
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 30,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Column(
                            children: [
                              // 월 표시
                              const Text(
                                '2025.10',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFFFF9999),
                                  fontFamily: 'Pretendard',
                                ),
                              ),
                              const SizedBox(height: 24),

                              // 요일 헤더
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: const [
                                  _DayOfWeekLabel('S'),
                                  _DayOfWeekLabel('M'),
                                  _DayOfWeekLabel('T'),
                                  _DayOfWeekLabel('W'),
                                  _DayOfWeekLabel('T'),
                                  _DayOfWeekLabel('F'),
                                  _DayOfWeekLabel('S'),
                                ],
                              ),
                              const SizedBox(height: 20),

                              // 달력 그리드
                              GridView.builder(
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 7,
                                  crossAxisSpacing: 8,
                                  mainAxisSpacing: 8,
                                ),
                                itemCount: calendarDays.length,
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) {
                                  final dayValue = calendarDays[index];

                                  // -1: 빈 칸 (날짜가 없는 칸)
                                  if (dayValue == -1) {
                                    return const SizedBox.shrink();
                                  }

                                  final isRecorded = dayValue == 1;

                                  // 기록이 있는 날만 터치 가능
                                  return GestureDetector(
                                    onTap: isRecorded
                                        ? () {
                                            // 날짜 계산 (index 기반)
                                            // 첫 3칸은 빈칸(-1)이므로, 실제 날짜는 index에서 빈칸 개수를 제외
                                            int day = 0;
                                            int emptyCount = 0;
                                            for (int i = 0; i <= index; i++) {
                                              if (calendarDays[i] == -1) {
                                                emptyCount++;
                                              }
                                            }
                                            day = index - emptyCount + 1;

                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    ArchiveDetailScreen(
                                                  date: '2025.10.${day.toString().padLeft(2, '0')}',
                                                  expressionText:
                                                      '오늘은 그냥, 울었다.\n이유를 말하자면 잘 모르겠다.\n아이를 위해 울면 안되지 했던,,,\n그냥 마음속에 쌓였던 것들이 터져버린 것 같다.\n\n울고 나니 조금 후련하면서도\n텅 빈 방 안에 혼자 남은 기분이다.\n그래도 이상하게 마음이 조금은 가벼워졌다.\n\n아마 그동안 참았던 감정들이\n조용히 흘러나온 게 아닐까 싶다.\n오늘은 그걸로 충분한 하루였다.',
                                                ),
                                              ),
                                            );
                                          }
                                        : null,
                                    child: Center(
                                      child: Container(
                                        width: 21.6,
                                        height: 21.6,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: isRecorded
                                              ? const Color(0xFF77CBFF)
                                              : const Color(0xFFCCCCCC),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // 홈으로 버튼
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 30,
              ),
              child: SizedBox(
                width: 150,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    // 홈 화면으로 이동
                    Navigator.popUntil(context, (route) => route.isFirst);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFF8B8B),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    '홈으로',
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
    );
  }
}

class _DayOfWeekLabel extends StatelessWidget {
  final String day;

  const _DayOfWeekLabel(this.day);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 40,
      child: Center(
        child: Text(
          day,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Color(0xFF2C2C2C),
            fontFamily: 'Pretendard',
          ),
        ),
      ),
    );
  }
}
