import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_2/blocs/home.bloc.dart';
import 'package:shopping_2/ui/shared/widgets/category/category-list.widget.dart';
import 'package:shopping_2/ui/shared/widgets/product/product-list.widget.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final HomeBloc bloc = Provider.of<HomeBloc>(context);

    return Scaffold(
        body: Padding(
      padding: EdgeInsets.all(10),
      child: ListView(
        children: <Widget>[
          SizedBox(
            height: 60,
          ),
          Text(
            "Categorias",
            style: Theme.of(context).textTheme.headline,
          ),
          SizedBox(
            height: 10,
          ),
          CategoryList(categories: bloc.categories),
          SizedBox(
            height: 20,
          ),
          Text(
            "Mais vendidos",
            style: Theme.of(context).textTheme.headline,
          ),
          SizedBox(
            height: 10,
          ),
          ProductList(
            products: bloc.products,
          ),
        ],
      ),
    ));
  }
}
