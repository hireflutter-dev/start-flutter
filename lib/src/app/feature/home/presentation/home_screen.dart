import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hf_flutter_starter_kit/src/app/feature/home/data/repository/github_user_repo_impl.dart';
import 'package:hf_flutter_starter_kit/src/app/feature/home/domain/usecase/get_users_usecase.dart';
import 'package:hf_flutter_starter_kit/src/app/feature/home/presentation/widgets/home_list_view.dart';

import 'bloc/home_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Github users',
          style: Theme.of(context).textTheme.headline4,
        ),
      ),
      body: BlocProvider<HomeBloc>(
        create: (context) => HomeBloc(
          getUsersUseCase: GetUsersUseCase(
            githubUserRepo: GithubUserRepoImpl(),
          ),
        ),
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            return state.when(
              initial: () {
                return const SizedBox();
              },
              loading: () {
                return const Center(
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
