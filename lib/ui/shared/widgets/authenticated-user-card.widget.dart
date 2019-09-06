import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../blocs/user.bloc.dart';

class AuthenticatedUserCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var bloc = Provider.of<UserBloc>(context);

    return Container(
      child: Center(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(bloc.user.image),
                ),
                color: Theme.of(context).primaryColor,
                border: Border.all(
                  width: 4.0,
                  color: Color(0xFFFFFFFF),
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(200),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text("Bem-Vindo ${bloc.user.name}"),
            SizedBox(
              height: 20,
            ),
            FlatButton(
              child: Text("Sair"),
              onPressed: () {
                bloc.logout();
              },
            )
          ],
        ),
      ),
    );
  }
}
