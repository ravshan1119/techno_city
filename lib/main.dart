import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:techno_city/app/app.dart';
import 'package:techno_city/data/firebase/auth_service.dart';
import 'package:techno_city/providers/auth_provider.dart';
import 'package:techno_city/providers/profile_provider.dart';
import 'package:techno_city/providers/tab_box_provider.dart';
import 'package:techno_city/utils/theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthProvider(authService: AuthService()),
          lazy: true,
        ),
        ChangeNotifierProvider(
          create: (context) => TabBoxProvider(),
          lazy: true,
        ),
        ChangeNotifierProvider(
          create: (context) => ProfileProvider(),
          lazy: true,
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: ThemeMode.light,
          home: child,
        );
      },
      child: const App(),
    );
  }
}
