import 'package:flutter/material.dart';

String plantPhotoHeroTag(String plantId) => 'plant-photo-$plantId';

class PlantPhotoHero extends StatelessWidget {
  const PlantPhotoHero({required this.plantId, required this.child, super.key});

  final String plantId;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Hero(tag: plantPhotoHeroTag(plantId), child: child);
  }
}
