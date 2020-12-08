import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeController extends ChangeNotifier {
  static const themePrefKey = 'theme';

  /// menampilkan tema default anda
  ThemeController(this._prefs) {
    // mengambil tema untuk inisialisasi shared preferences
    _currentTheme = _prefs.getString(themePrefKey) ?? 'light';
  }

  final SharedPreferences _prefs;
  String _currentTheme;

  /// mengambil tema yang ada pada shared_preferences
  String get currentTheme => _currentTheme;

  /// Mengubah tema anda dan menyimpan pada shared_preferences
  void setTheme(String theme) {
    _currentTheme = theme;

    // memberitahukan ke aplikasi jika tema berubah
    notifyListeners();

    // menyimpan tema yang terpilih ke shared_preferences
    _prefs.setString(themePrefKey, theme);
  }

  /// mengambil controller dari halaman apapun di aplikasimu
  /// [context] merupakan widget tree pada saat kalian memanggil controller ini.
  /// jadi mohon untuk tidak salah mengirim [context]
  static ThemeController of(BuildContext context) {
    final provider =
        context.dependOnInheritedWidgetOfExactType<ThemeControllerProvider>();
    return provider.controller;
  }
}

/// menyediakan tema pada aplikasimu
class ThemeControllerProvider extends InheritedWidget {
  const ThemeControllerProvider({Key key, this.controller, Widget child})
      : super(key: key, child: child);

  final ThemeController controller;

  @override
  bool updateShouldNotify(ThemeControllerProvider old) =>
      controller != old.controller;
}
