import 'package:catbreeds/Infrastructure/Config/Extensions/Persistence/PersistenceRespository.dart';
import 'package:catbreeds/Infrastructure/Config/Extensions/Persistence/PersistenceService.dart';
import 'package:catbreeds/Infrastructure/Config/Extensions/Persistence/PersistenceStore.dart';
import 'package:catbreeds/Presentation/MyApp/MyApp.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  await Hive.initFlutter();

  Box box = await Hive.openBox('catbreed');
  await box.clear();

  PersistenceRepository repository = PersistenceRepository();
  await repository.initRepository();

  PersistenceService service = PersistenceService();
  await service.initService();

  PersistenceStore store = PersistenceStore();
  await store.initStore();

  runApp(const MyApp());
}
