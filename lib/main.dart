import 'package:flutter/material.dart';
import 'package:reskara_skit/reskara_skit.dart';
import 'package:starterkit_tutorial/pages/welcome_page.dart';

void main() async {
  // memanggil shared preferences dari disk sebelum aplikasi dijalankan
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();

  // membuat theme controller baru yang akan diambil oleh shared preferences
  final themeController = ThemeController(prefs);

  runApp(MyApp(themeController: themeController));
}

class MyApp extends StatelessWidget {
  final ThemeController themeController;

  const MyApp({Key key, this.themeController});

  @override
  Widget build(BuildContext context) {
    // memanggil animatebuilder untuk mengubah tema agar lebih halus
    return AnimatedBuilder(
      animation: themeController,
      builder: (context, _) {
        // membungkus app untuk inheritance widget agar tema bisa dibuka di semua halaman
        return ThemeControllerProvider(
          controller: themeController,
          child: MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeConfiguration.switcher(themeController),
            home: WelcomePage(),
          ),
        );
      },
    );
  }
}
