import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../blocs/theme.bloc.dart';
import '../../../settings.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<ThemeBloc>(context);

    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: <Widget>[
          Text(
            "Tema atual ${Settings.theme}",
            textAlign: TextAlign.center,
          ),
          FlatButton(
            child: Text("Light"),
            onPressed: () {
              save("light");
              bloc.change('light');
            },
          ),
          FlatButton(
            child: Text("dark"),
            onPressed: () {
              save("dark");
              bloc.change('dark');
            },
          ),
          FlatButton(
            child: Text("dark-yellow"),
            onPressed: () {
              save("dark-yellow");
              bloc.change('dark-yellow');
            },
          )
        ],
      ),
    );
  }

  save(theme) async {
    var prefs = await SharedPreferences.getInstance();
    await prefs.setString('theme', theme);
  }
}
