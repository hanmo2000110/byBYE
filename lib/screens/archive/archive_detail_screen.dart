import 'package:flutter/material.dart';

class ArchiveDetailScreen extends StatelessWidget {
  final String date; // 선택한 날짜 (예: "2025년 10월 15일")
  final String? expressionText; // 기록된 감정 표현 텍스트

  const ArchiveDetailScreen({
    Key? key,
    required this.date,
    this.expressionText,
  }) : super(key: key);

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
                      // 날짜 제목
                      RichText(
                        text: TextSpan(
                          style: const TextStyle(
                            fontFamily: 'Pretendard',
                          ),
                          children: [
                            TextSpan(
                              text: '$date\n',
                              style: const TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF2C2C2C),
                                height: 1.4,
                              ),
                            ),
                            const TextSpan(
                              text: '나의 기록',
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF2C2C2C),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 50),
                      // 기록된 텍스트 표시 영역
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 80,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: const Color(0xFFFF8B8B),
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          expressionText ?? '기록된 내용이 없습니다.',
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF808080),
                            height: 1.4,
                            fontFamily: 'Pretendard',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // 하단 버튼
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 30,
                vertical: 20,
              ),
              child: SizedBox(
                width: 117,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFF8B8B),
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
