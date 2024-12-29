import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'db/db_helper.dart';
import 'ui/pages/get_started.dart';
import 'ui/pages/home_page.dart';
import 'ui/widgets/setting_group/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DBHelper.initDb();
  await GetStorage.init();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool hasStarted = prefs.getBool('hasStarted') ?? false;

  runApp(MyApp(hasStarted: hasStarted));
}

class MyApp extends StatelessWidget {
  final bool hasStarted;

  const MyApp({super.key, required this.hasStarted});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: Themes.light,
      darkTheme: Themes.light,
      debugShowCheckedModeBanner: false,
      title: 'BTS Meeting Planner',
      home: hasStarted ? const HomePage() : const GetStartedPage(),
    );
  }
}
