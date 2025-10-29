import 'package:flutter/material.dart';
import 'dart:async';
import '../emotion_record/emotion_record_screen.dart';
import '../emotion_record/grief_guideline_screen.dart';
import '../archive/archive_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const HomePage();
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Timer? _timer;
  int _seconds = 0;
  bool _isRunning = false;

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    if (!_isRunning) {
      setState(() {
        _isRunning = true;
      });
      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        setState(() {
          _seconds++;
        });
      });
    }
  }

  void _stopTimer() {
    if (_isRunning) {
      setState(() {
        _isRunning = false;
      });
      _timer?.cancel();
    }
  }

  void _resetTimer() {
    _stopTimer();
    setState(() {
      _seconds = 0;
    });
  }

  String _formatTime(int totalSeconds) {
    int hours = totalSeconds ~/ 3600;
    int minutes = (totalSeconds % 3600) ~/ 60;
    int seconds = totalSeconds % 60;
    return '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/backgrounds/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Stack(
            children: [
              // 메인 컨텐츠
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 305),

                  // 중앙 새싹 일러스트 영역
                  SizedBox(
                    height: 150,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 42.5),
                        child: Image.asset(
                          'assets/images/backgrounds/sprout.png',
                          height: 126,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  // 시간 표시
                  Text(
                    _formatTime(_seconds),
                    style: const TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const Text(
                    '흘린 눈물의 시간',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),

                  const SizedBox(height: 30),

                  // 버튼
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 40),
                    width: 247,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const EmotionRecordScreen(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      child: const Text(
                        '오늘의 감정 기록하기',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 40),
                ],
              ),

              // 상단 아이콘들 (절대 위치)
              Positioned(
                top: 20,
                left: 20,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ArchiveScreen(),
                            ),
                          );
                        },
                        child: _buildTopIcon(
                          iconPath: 'assets/icons/archive.png',
                          size: 70,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const GriefGuidelineScreen(
                                currentStage: '부정', // 홈에서는 기본 단계로 설정
                              ),
                            ),
                          );
                        },
                        child: _buildTopIcon(
                          iconPath: 'assets/icons/guideline.png',
                          size: 96,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // 타이머 컨트롤 버튼들
              Positioned(
                bottom: 50,
                left: 30,
                child: GestureDetector(
                  onTap: _startTimer,
                  child: Container(
                    width: 80,
                    height: 80,
                    color: Colors.transparent,
                  ),
                ),
              ),

              Positioned(
                bottom: 50,
                right: 30,
                child: GestureDetector(
                  onTap: _stopTimer,
                  child: Container(
                    width: 80,
                    height: 80,
                    color: Colors.transparent,
                  ),
                ),
              ),

              Positioned(
                top: 50,
                right: 30,
                child: GestureDetector(
                  onTap: _resetTimer,
                  child: Container(
                    width: 80,
                    height: 80,
                    color: Colors.transparent,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTopIcon({
    required String iconPath,
    double size = 96,
  }) {
    return SizedBox(
      width: size,
      height: size,
      child: Image.asset(
        iconPath,
        fit: BoxFit.contain,
      ),
    );
  }
}
