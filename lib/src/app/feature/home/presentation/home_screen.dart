import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hf_flutter_starter_kit/src/app/feature/home/data/repository/home_repo_impl.dart';
import 'package:hf_flutter_starter_kit/src/app/feature/home/presentation/widgets/home_list_view.dart';

import 'bloc/homebloc_bloc.dart';

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
      body: BlocProvider<HomeblocBloc>(
        create: (context) => HomeblocBloc(homeRepository: HomeRepositoryImpl())
          ..add(HomeblocEvent.started()),
        child: BlocBuilder<HomeblocBloc, HomeblocState>(
          builder: (context, state) {
            return state.when(
              initial: () {
                return SizedBox();
              },
              loading: () {
                return Center(
                  child: CupertinoActivityIndicator(),
                );
              },
              success: (users) {
                return HomeListView(
                  githubUser: users,
                );
              },
              failure: (e) {
                return Center(child: Text(e));
              },
            );
          },
        ),
      ),
    );
  }
}
