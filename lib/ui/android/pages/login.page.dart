import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_2/models/authenticate-user.model.dart';
import '../../../blocs/user.bloc.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  var username = '';
  var password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              TextFormField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: "Usuário",
                  labelStyle: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                ),
                style: TextStyle(
                  fontSize: 20,
                  color: Theme.of(context).primaryColor,
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return "Usuário Inválido";
                  }
                  return null;
                },
                onSaved: (val) {
                  username = val;
                },
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                keyboardType: TextInputType.text,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Password",
                  labelStyle: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                ),
                style: TextStyle(
                  fontSize: 20,
                  color: Theme.of(context).primaryColor,
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return "Senha Inválido";
                  }
                  return null;
                },
                onSaved: (val) {
                  password = val;
                },
              ),
              SizedBox(
                height: 25,
              ),
              FlatButton(
                child: Text("Entrar"),
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    _formKey.currentState.save();
                    authenticate(context);
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  authenticate(BuildContext context) async {
    var bloc = Provider.of<UserBloc>(context);
    var user = await bloc.authenticate(
        AuthenticateModel(username: username, password: password));

    if (user != null) {
      Navigator.pop(context);
      return;
    }

    final snackBar = SnackBar(content: Text("Usuário ou Senha inválidos"));
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }
}
