import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopping_2/models/product-detail.model.dart';
import 'package:shopping_2/repositories/product.repository.dart';
import 'package:shopping_2/ui/shared/widgets/shared/progress-indicator.widget.dart';

class ProductPage extends StatelessWidget {
  final String tag;
  final _repository = new ProductRepository();

  ProductPage({@required this.tag});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ProductDetailModel>(
      future: _repository.get(this.tag),
      builder: (context, snapshot) {
        ProductDetailModel product = snapshot.data;
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            return Text('Aguardando...');
          case ConnectionState.active:
          case ConnectionState.waiting:
            return Center(
              child: GenericProgressIndicator(),
            );
          case ConnectionState.done:
            if (snapshot.hasError)
              return Center(
                child: Text("Não foi possivel obter o produto"),
              );
            return content(product);
        }
        return null;
      },
    );
  }

  Widget content(ProductDetailModel product) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: product.images.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            width: 200,
            child: Image.network(
              product.images[index],
            ),
          );
        },
      ),
    );
  }
}
