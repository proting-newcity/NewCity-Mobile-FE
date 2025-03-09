import 'package:flutter_test/flutter_test.dart';
import 'package:my_app/main.dart';
import 'package:my_app/app/modules/beranda/views/beranda_view.dart';

void main() {
  testWidgets('BerandaView widget test', (WidgetTester tester) async {
    // Render the BerandaView widget
    await tester.pumpWidget(MyApp());

    // Verify the presence of key UI elements
    expect(find.text('Beranda'), findsOneWidget);
    expect(find.byIcon(Icons.home), findsOneWidget);

    // Interaction test: tap on navigation bar items and verify navigation behavior
    await tester.tap(find.byIcon(Icons.search));
    await tester.pumpAndSettle();
    expect(find.text('Search'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.notifications));
    await tester.pumpAndSettle();
    expect(find.text('Notifications'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.person));
    await tester.pumpAndSettle();
    expect(find.text('Profile'), findsOneWidget);
  });
}
