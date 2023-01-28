import 'package:flutter_test/flutter_test.dart';
import 'package:slide_digital_clock/src/digital_clock.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(DigitalClock());
  });
}
