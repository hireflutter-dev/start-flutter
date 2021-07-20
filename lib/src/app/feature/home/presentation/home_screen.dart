import 'package:flutter/material.dart';
import 'package:hf_flutter_starter_kit/src/app/feature/home/presentation/widgets/home_list_view.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Home screen',
          style: Theme.of(context).textTheme.headline4,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: HomeListView(),
      ),
    );
  }
}
