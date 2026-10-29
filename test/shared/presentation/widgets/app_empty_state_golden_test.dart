@Tags(['golden'])
library;

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pocket_garden/shared/presentation/widgets/app_states.dart';

import '../../../helpers/test_app.dart';

void main() {
  testWidgets('AppEmptyState matches its golden', (tester) async {
    tester.view
      ..physicalSize = const Size(420, 620)
      ..devicePixelRatio = 1;
    addTearDown(tester.view.reset);

    await tester.pumpWidget(
      buildTestApp(
        home: Scaffold(
          body: AppEmptyState(
            icon: Icons.local_florist_outlined,
            title: 'Your garden is waiting',
            message: 'Add your first plant and keep its care routine close.',
            actionLabel: 'Add my first plant',
            onAction: () {},
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();

    await expectLater(
      find.byType(Scaffold),
      matchesGoldenFile('goldens/app_empty_state.png'),
    );
  });
}
