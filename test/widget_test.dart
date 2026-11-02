import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:trying_flutter/main.dart';
import 'package:trying_flutter/screens/profile_page.dart';

void main() {
  testWidgets(
    'L’accueil affiche les rubriques et les boutons',
    (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());
      await tester.pumpAndSettle();

      expect(find.text('EMSI Connect'), findsOneWidget);
      expect(find.text('Mes cours'), findsOneWidget);
      expect(find.text('Planning'), findsOneWidget);
      expect(find.text('Mon profil'), findsOneWidget);
      expect(find.text('Mes tâches'), findsOneWidget);

      expect(find.byIcon(Icons.notifications), findsOneWidget);
      expect(find.byType(FloatingActionButton), findsOneWidget);

      await tester.tap(find.byIcon(Icons.notifications));
      await tester.pump();

      await tester.tap(find.byType(FloatingActionButton));
      await tester.pump();

      expect(tester.takeException(), isNull);
    },
  );

  testWidgets(
    'Le profil affiche les informations et la carte',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: ProfilePage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Mon profil'), findsOneWidget);
      expect(find.text('Informations personnelles'), findsOneWidget);
      expect(find.text('sara@example.com'), findsOneWidget);
      expect(find.text('Carte étudiant'), findsOneWidget);

      final contacter = find.widgetWithText(
        OutlinedButton,
        'Contacter',
      );

      await tester.ensureVisible(contacter);
      await tester.pumpAndSettle();
      await tester.tap(contacter);
      await tester.pump();

      expect(tester.takeException(), isNull);
    },
  );
}