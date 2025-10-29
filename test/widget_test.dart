// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';

import 'package:todak_todak/main.dart';

void main() {
  testWidgets('토닥토닥 앱 기본 테스트', (WidgetTester tester) async {
    // 앱을 빌드하고 프레임을 트리거합니다.
    await tester.pumpWidget(const TodakTodakApp());

    // 온보딩 화면의 "토닥토닥에" 텍스트가 표시되는지 확인합니다.
    expect(find.textContaining('토닥토닥에'), findsOneWidget);
    expect(find.textContaining('환영합니다'), findsOneWidget);
  });
}
