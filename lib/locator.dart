import 'package:get_it/get_it.dart';
import 'package:pink_flamingo_app/models/userData.dart';

final locator = GetIt.instance;

void setUp() {
  locator.registerLazySingleton(() => UserDetails());
}
