import 'package:flutter_cache_manager/flutter_cache_manager.dart';
class CustomCacheManager extends CacheManager {
  static const key = "customCacheKey";

  static CustomCacheManager _instance = CustomCacheManager._();

  factory CustomCacheManager() {
    return _instance;
  }

  CustomCacheManager._() : super(
    Config(
      key,
      stalePeriod: const Duration(days: 7), // Cache duration
      maxNrOfCacheObjects: 100, // Maximum number of cached objects
    ),
  );
}
