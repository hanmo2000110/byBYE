import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'memorial_letter_sent_screen.dart';

class MemorialSpaceScreen extends StatefulWidget {
  const MemorialSpaceScreen({Key? key}) : super(key: key);

  @override
  State<MemorialSpaceScreen> createState() => _MemorialSpaceScreenState();
}

class _MemorialSpaceScreenState extends State<MemorialSpaceScreen> {
  late TextEditingController _textController;
  bool _hasText = false;
  String? _selectedMode; // 'text' or 'image'
  File? _selectedImage;
  bool _showOptions = false;

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController();
    _textController.addListener(() {
      setState(() {
        _hasText = _textController.text.isNotEmpty;
      });
    });
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  void _showOptionDialog() {
    setState(() {
      _showOptions = true;
    });
  }

  void _hideOptions() {
    setState(() {
      _showOptions = false;
    });
  }

  void _selectTextMode() {
    setState(() {
      _selectedMode = 'text';
      _showOptions = false;
    });
  }

  Future<void> _selectImageMode() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        _selectedMode = 'image';
        _selectedImage = File(image.path);
        _hasText = true; // 이미지가 선택되면 전송 버튼 활성화
        _showOptions = false;
      });
    }
  }

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
                    horizontal: 20,
                    vertical: 30,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // 제목과 설명 텍스트
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            '추모 공간',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF656565),
                            ),
                          ),
                          const SizedBox(width: 20),
                          const Expanded(
                            child: Text(
                              '아이에게 전하고 싶은 말을 적어보세요.\n감정을 숨기지 않아도 괜찮아요.',
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF727272),
                                height: 1.5,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 40),

                      // 텍스트 입력 영역 / 터치 영역
                      Stack(
                        children: [
                          GestureDetector(
                            onTap: _selectedMode == null
                                ? _showOptionDialog
                                : null,
                            child: Container(
                              decoration: BoxDecoration(
                                color: const Color(0xFFFFFFFF),
                                borderRadius: BorderRadius.circular(59),
                                border: Border.all(
                                  color: const Color(0xFFFFDDDD),
                                  width: 1.0,
                                ),
                                image: _selectedMode == 'image' &&
                                        _selectedImage != null
                                    ? DecorationImage(
                                        image: FileImage(_selectedImage!),
                                        fit: BoxFit.cover,
                                      )
                                    : null,
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(58),
                                child: _selectedMode == 'text'
                                    ? TextField(
                                        controller: _textController,
                                        maxLines: 22,
                                        minLines: 22,
                                        decoration: const InputDecoration(
                                          hintText: '',
                                          border: InputBorder.none,
                                          enabledBorder: InputBorder.none,
                                          focusedBorder: InputBorder.none,
                                          errorBorder: InputBorder.none,
                                          disabledBorder: InputBorder.none,
                                          filled: true,
                                          fillColor: Color(0xFFFFFFFF),
                                          contentPadding: EdgeInsets.only(
                                            left: 20,
                                            right: 20,
                                            top: 40,
                                            bottom: 20,
                                          ),
                                        ),
                                        style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xFF2C2C2C),
                                          height: 1.6,
                                        ),
                                      )
                                    : Container(
                                        height: 520,
                                      ),
                              ),
                            ),
                          ),
                          // 선택지 오버레이
                          if (_showOptions)
                            Positioned.fill(
                              child: Center(
                                child: Transform.translate(
                                  offset: const Offset(0, 30),
                                  child: FractionallySizedBox(
                                    heightFactor: 0.67,
                                    widthFactor: 1.0,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: const Color(0xFFF8F8F8),
                                        borderRadius: BorderRadius.circular(59),
                                      ),
                                      child: Center(
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              const SizedBox(height: 20),
                                              // TODO: 사용자가 제공할 선택지 UI
                                              SizedBox(
                                                width: 300,
                                                height: 48,
                                                child: ElevatedButton(
                                                  onPressed: _selectTextMode,
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    backgroundColor:
                                                        const Color(0xFFFFEDEB),
                                                    foregroundColor:
                                                        const Color(0xFF656565),
                                                    elevation: 0,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              59),
                                                    ),
                                                  ),
                                                  child: const Text(
                                                    '텍스트로 작성하기',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(height: 10),
                                              SizedBox(
                                                width: 300,
                                                height: 48,
                                                child: ElevatedButton(
                                                  onPressed: () {
                                                    // TODO: 카메라 기능
                                                  },
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    backgroundColor:
                                                        const Color(0xFFFFEDEB),
                                                    foregroundColor:
                                                        const Color(0xFF656565),
                                                    elevation: 0,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              59),
                                                    ),
                                                  ),
                                                  child: const Text(
                                                    '카메라로 찍어올리기',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(height: 10),
                                              SizedBox(
                                                width: 300,
                                                height: 48,
                                                child: ElevatedButton(
                                                  onPressed: _selectImageMode,
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    backgroundColor:
                                                        const Color(0xFFFFEDEB),
                                                    foregroundColor:
                                                        const Color(0xFF656565),
                                                    elevation: 0,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              59),
                                                    ),
                                                  ),
                                                  child: const Text(
                                                    '앨범에서 선택하기',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(height: 10),
                                              SizedBox(
                                                width: 300,
                                                height: 48,
                                                child: ElevatedButton(
                                                  onPressed: () {
                                                    // TODO: 그림 그리기 기능
                                                  },
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    backgroundColor:
                                                        const Color(0xFFFFEDEB),
                                                    foregroundColor:
                                                        const Color(0xFF656565),
                                                    elevation: 0,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              59),
                                                    ),
                                                  ),
                                                  child: const Text(
                                                    '그림 그려올리기',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(height: 20),
                                              IconButton(
                                                onPressed: _hideOptions,
                                                icon: const Icon(
                                                  Icons.cancel,
                                                  size: 35,
                                                  color: Color(0xFFFF9999),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // 하단 버튼들
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 20,
              ),
              child: Row(
                mainAxisAlignment: _selectedMode == null
                    ? MainAxisAlignment.start
                    : MainAxisAlignment.center,
                children: [
                  // 홈으로 버튼 (선택지를 선택하지 않았을 때만 표시)
                  if (_selectedMode == null)
                    Expanded(
                      child: SizedBox(
                        height: 50,
                        child: OutlinedButton(
                          onPressed: () {
                            // 홈 화면으로 이동
                            Navigator.popUntil(
                                context, (route) => route.isFirst);
                          },
                          style: OutlinedButton.styleFrom(
                            backgroundColor: Colors.white,
                            side: const BorderSide(
                              color: Color(0xFFE8E8E8),
                              width: 1.5,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                          child: const Text(
                            '홈으로',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF2C2C2C),
                            ),
                          ),
                        ),
                      ),
                    ),
                  if (_selectedMode == null) const SizedBox(width: 12),

                  // 편지 보내기 버튼
                  SizedBox(
                    width: 174,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: _hasText
                          ? () {
                              // 편지 보내기 결과 페이지로 이동
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const MemorialLetterSentScreen(),
                                ),
                              );
                            }
                          : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFFF9999),
                        disabledBackgroundColor: const Color(0xFFFFCCCC),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        elevation: 0,
                      ),
                      child: const Text(
                        '편지 보내기',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
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
    );
  }
}
