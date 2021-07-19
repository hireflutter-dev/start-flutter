import 'package:flutter/material.dart';
import 'package:hf_flutter_starter_kit/src/app/feature/home/data/resources/dummy_product.dart';
import 'package:hf_flutter_starter_kit/src/app/feature/home/presentation/widgets/home_list_tile.dart';

class HomeListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => HomeListTile(
        product: product[index],
      ),
      itemCount: product.length,
    );
  }
}
