import 'package:flutter/material.dart';
import 'package:reskara_skit/reskara_skit.dart';

class Setting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Theme Setting"),
      ),
      body: SettingBody(),
    );
  }
}

class SettingBody extends StatefulWidget {
  @override
  _SettingBodyState createState() => _SettingBodyState();
}

class _SettingBodyState extends State<SettingBody> {
  String _theme;

  @override
  void initState() {
    super.initState();
    getTheme();
  }

  getTheme() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();

    setState(() {
      //merubah state dan mengambil tema awal yang sudah di simpan di shared preferences
      _theme = _prefs.getString("theme") ?? "light";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20, top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(_theme ?? "light"),
          Switch(
            value: _theme == "dark" ? true : false,
            onChanged: (value) {
              setState(() {
                _theme = _theme == "dark" ? "light" : "dark";
                ThemeController.of(context).setTheme(_theme);
              });
            },
          )
        ],
      ),
    );
  }
}
