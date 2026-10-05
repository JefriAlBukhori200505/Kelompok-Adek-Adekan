import 'package:flutter_test/flutter_test.dart';
import '../lib/main.dart' as app;

void main() {
  testWidgets('MOJEK app berhasil dijalankan', (
    WidgetTester tester,
  ) async {
    app.main();

    await tester.pumpAndSettle();

    expect(find.text('MOJEK'), findsOneWidget);
  });
}