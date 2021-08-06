import 'package:flutter/material.dart';
import 'package:hf_flutter_starter_kit/src/app/feature/home/domain/entity/github_user.dart';
import 'package:hf_flutter_starter_kit/src/app/feature/home/presentation/widgets/home_list_tile.dart';

class HomeListView extends StatelessWidget {
  const HomeListView({Key? key, required this.githubUser}) : super(key: key);

  final List<GithubUser> githubUser;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: githubUser.length,
      itemBuilder: (context, index) => HomeListTile(
        githubUser: githubUser[index],
      ),
    );
  }
}
