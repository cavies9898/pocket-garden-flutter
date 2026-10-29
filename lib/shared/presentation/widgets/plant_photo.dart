import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pocket_garden/core/constants/app_constants.dart';
import 'package:pocket_garden/core/database/database_providers.dart';
import 'package:pocket_garden/core/errors/result.dart';

class PlantPhoto extends ConsumerWidget {
  const PlantPhoto({
    required this.relativePath,
    required this.semanticLabel,
    required this.cacheWidth,
    this.fit = BoxFit.cover,
    super.key,
  });

  final String? relativePath;
  final String semanticLabel;
  final int cacheWidth;
  final BoxFit fit;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final path = relativePath;
    if (path == null) {
      return const _PhotoPlaceholder();
    }

    final resolved = ref.watch(resolvedPhotoPathProvider(path));
    return switch (resolved) {
      AsyncData(:final value) => switch (value) {
        Success(:final value) when value != null => Semantics(
          image: true,
          label: semanticLabel,
          child: ExcludeSemantics(
            child: Image.file(
              File(value),
              fit: fit,
              cacheWidth: cacheWidth,
              errorBuilder: (context, error, stackTrace) =>
                  const _PhotoPlaceholder(),
            ),
          ),
        ),
        _ => const _PhotoPlaceholder(),
      },
      AsyncError() => const _PhotoPlaceholder(),
      _ => const _PhotoPlaceholder(),
    };
  }
}

class _PhotoPlaceholder extends StatelessWidget {
  const _PhotoPlaceholder();

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return ColoredBox(
      color: colorScheme.surfaceContainerHighest,
      child: Center(
        child: Icon(
          Icons.local_florist_outlined,
          color: colorScheme.onSurfaceVariant,
          size: 40,
        ),
      ),
    );
  }
}

/// Displays a just-picked file before it is persisted. Kept out of [PlantPhoto]
/// because that widget resolves app-owned relative paths through the repository
/// layer.
class SelectedPhotoPreview extends StatelessWidget {
  const SelectedPhotoPreview({
    required this.absolutePath,
    required this.semanticLabel,
    super.key,
  });

  final String absolutePath;
  final String semanticLabel;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      image: true,
      label: semanticLabel,
      child: ExcludeSemantics(
        child: Image.file(
          File(absolutePath),
          fit: BoxFit.cover,
          cacheWidth: AppConstants.selectedImageCacheSize,
          errorBuilder: (context, error, stackTrace) =>
              const _PhotoPlaceholder(),
        ),
      ),
    );
  }
}
