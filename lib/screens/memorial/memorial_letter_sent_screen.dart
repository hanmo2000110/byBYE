import 'package:flutter/material.dart';

class MemorialLetterSentScreen extends StatelessWidget {
  const MemorialLetterSentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFEDEB),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 왼쪽 위 추모 공간 텍스트
            Padding(
              padding: const EdgeInsets.only(
                left: 35,
                top: 50,
              ),
              child: Text(
                '추모 공간',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF656565),
                ),
              ),
            ),

            // 중앙 하트 아이콘
            Expanded(
              child: Center(
                child: Image.asset(
                  'assets/icons/heart.png',
                  width: 102,
                  height: 83,
                  fit: BoxFit.contain,
                ),
              ),
            ),

            // 하단 홈으로 버튼
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 20,
              ),
              child: Center(
                child: SizedBox(
                  width: 117,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      // 홈 화면으로 이동
                      Navigator.popUntil(context, (route) => route.isFirst);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFF8B8B),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
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
            ),
          ],
        ),
      ),
    );
  }
}
