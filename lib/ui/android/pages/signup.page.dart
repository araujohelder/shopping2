import 'package:flutter/Material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_2/models/create-user.model.dart';
import 'package:shopping_2/ui/shared/widgets/shared/validators/custom.validators.dart';
import '../../../blocs/user.bloc.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldkey = GlobalKey<ScaffoldState>();
  var user = new CreateUserModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldkey,
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
                  labelText: "Nome",
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
                    return "Nome Inválido";
                  }
                  return null;
                },
                onSaved: (val) {
                  user.name = val;
                },
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: "Email",
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
                validator: (value) => CustomValidators.isEmail(value),
                onSaved: (val) {
                  user.email = val;
                },
              ),
              SizedBox(
                height: 10,
              ),
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
                  user.username = val;
                },
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
                    return "Password Inválido";
                  }
                  return null;
                },
                onSaved: (val) {
                  user.password = val;
                },
              ),
              FlatButton(
                child: Text("Cadastrar"),
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    _formKey.currentState.save();
                    create(context);
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  create(BuildContext context) async {
    var bloc = Provider.of<UserBloc>(context);
    var res = await bloc.create(user);

    if (res == null) {
      final snackBar =
          SnackBar(content: Text('Não foi possível realizar seu cadastrado'));
      _scaffoldkey.currentState.showSnackBar(snackBar);
    } else {
      final snackBar = SnackBar(content: Text('Bem vindo! Autentique-se'));
      _scaffoldkey.currentState.showSnackBar(snackBar);
      Navigator.pop(context);
    }
  }
}
