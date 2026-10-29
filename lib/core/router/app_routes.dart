abstract final class AppRoutes {
  static const plants = '/plants';
  static const newPlant = '/plants/new';
  static const settings = '/settings';

  static String plantDetails(String id) => '/plants/$id';

  static String editPlant(String id) => '/plants/$id/edit';
}
