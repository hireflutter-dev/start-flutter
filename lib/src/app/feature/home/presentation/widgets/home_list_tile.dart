import 'package:constant/constant.dart';
import 'package:flutter/material.dart';

import 'package:hf_flutter_starter_kit/src/app/feature/home/domain/entity/github_user.dart';

class HomeListTile extends StatelessWidget {
  const HomeListTile({Key? key, required this.githubUser}) : super(key: key);

  final GithubUser githubUser;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(githubUser.login ?? ''),
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(32.0),
        child: FadeInImage(
          placeholder: const AssetImage(ImageConstant.logo),
          image: NetworkImage(githubUser.avatar_url ?? ''),
        ),
      ),
      subtitle: Text(githubUser.organizations_url ?? ''),
    );
  }
}
