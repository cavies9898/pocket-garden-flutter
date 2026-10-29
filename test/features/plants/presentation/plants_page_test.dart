import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pocket_garden/core/errors/failure.dart';
import 'package:pocket_garden/core/errors/result.dart';
import 'package:pocket_garden/features/plants/domain/entities/plant.dart';
import 'package:pocket_garden/features/plants/presentation/pages/plants_page.dart';
import 'package:pocket_garden/features/plants/presentation/providers/plant_providers.dart';
import 'package:pocket_garden/features/plants/presentation/widgets/plants_skeleton.dart';

import '../../../helpers/fixtures.dart';
import '../../../helpers/test_app.dart';

void main() {
  group('PlantsPage', () {
    testWidgets('shows the empty state and the add action', (tester) async {
      await tester.pumpWidget(
        buildTestApp(
          home: const PlantsPage(),
          overrides: [
            plantsProvider.overrideWith(
              (ref) => Stream.value(const Success(<Plant>[])),
            ),
          ],
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Your garden is waiting'), findsOneWidget);
      expect(
        find.text('Add your first plant and keep its care routine close.'),
        findsOneWidget,
      );
      expect(find.text('Add my first plant'), findsOneWidget);
      expect(find.text('Add plant'), findsOneWidget);
    });

    testWidgets('renders localized empty state in Spanish', (tester) async {
      await tester.pumpWidget(
        buildTestApp(
          locale: const Locale('es'),
          home: const PlantsPage(),
          overrides: [
            plantsProvider.overrideWith(
              (ref) => Stream.value(const Success(<Plant>[])),
            ),
          ],
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Tu jardín te espera'), findsOneWidget);
      expect(find.text('Añadir mi primera planta'), findsOneWidget);
      expect(find.text('Añadir planta'), findsOneWidget);
    });

    testWidgets('renders plant cards from the stream', (tester) async {
      final plant = buildPlant(photoPath: null);

      await tester.pumpWidget(
        buildTestApp(
          home: const PlantsPage(),
          overrides: [
            plantsProvider.overrideWith(
              (ref) => Stream.value(Success([plant])),
            ),
          ],
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Monstera'), findsOneWidget);
      expect(find.text('Monstera · Monstera deliciosa'), findsOneWidget);
      expect(find.text('Every 7 days'), findsOneWidget);
      expect(find.text('Indoor'), findsOneWidget);
      expect(find.text('Your garden is waiting'), findsNothing);
    });

    testWidgets('shows a localized error and retry action', (tester) async {
      const failure = DatabaseFailure(
        cause: 'unavailable',
        stackTrace: StackTrace.empty,
      );

      await tester.pumpWidget(
        buildTestApp(
          home: const PlantsPage(),
          overrides: [
            plantsProvider.overrideWith(
              (ref) => Stream.value(const FailureResult(failure)),
            ),
          ],
        ),
      );
      await tester.pumpAndSettle();

      expect(
        find.text("We couldn't access your local garden data."),
        findsOneWidget,
      );
      expect(find.text('Retry'), findsOneWidget);
    });

    testWidgets('shows a skeleton while the first value is pending', (
      tester,
    ) async {
      final controller = StreamController<Result<List<Plant>>>();
      addTearDown(controller.close);

      await tester.pumpWidget(
        buildTestApp(
          home: const PlantsPage(),
          overrides: [
            plantsProvider.overrideWith((ref) => controller.stream),
          ],
        ),
      );
      await tester.pump();

      expect(find.byType(PlantsSkeleton), findsOneWidget);
    });
  });
}
