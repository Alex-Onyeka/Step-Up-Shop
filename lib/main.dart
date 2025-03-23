import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/pages/intro_page.dart';
import 'package:shopapp/providerClass/main_provider_class.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProviderClass(),
      builder:
          (context, child) => MaterialApp(
            theme: ThemeData(
              //
              //
              dialogTheme: DialogThemeData(
                backgroundColor: Colors.white,
              ),
              //
              //
              appBarTheme: AppBarTheme(
                backgroundColor: Colors.grey.shade100,
                toolbarHeight: 70,
                actionsPadding: EdgeInsets.all(50),
              ),
              //
              //
              scaffoldBackgroundColor: Colors.grey.shade100,
              //
              //
              drawerTheme: DrawerThemeData(
                backgroundColor: Colors.white,
                shape: LinearBorder.top(alignment: 3),
              ),
            ),
            debugShowCheckedModeBanner: false,
            home: IntroPage(),
          ),
    );
  }
}
