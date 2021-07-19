import 'package:flutter/material.dart';
import 'package:hf_flutter_starter_kit/src/app/feature/home/domain/entity/product.dart';

class HomeListTile extends StatelessWidget {
  const HomeListTile({Key? key, required this.product}) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(product.name ?? ''),
    );
  }
}
