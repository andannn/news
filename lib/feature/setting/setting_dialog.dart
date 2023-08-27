import 'package:flutter/material.dart';
import 'package:news/app/local/nia_localizations.dart';
import 'package:news/core/data/repository/topics_repository.dart';
import 'package:news/core/data/repository/user_data_repository.dart';
import 'package:news/core/usecase/get_followable_topic_by_id_use_case.dart';

class SettingDialog extends StatefulWidget {
  const SettingDialog({super.key});

  @override
  State<SettingDialog> createState() => _SettingDialogState();
}

class _SettingDialogState extends State<SettingDialog> {
  late GetFollowableTopicByIdUseCase getFollowableTopicByIdUseCase;

  @override
  void initState() {
    super.initState();
    getFollowableTopicByIdUseCase =
        GetFollowableTopicByIdUseCase(topicsRepository, userDataRepository);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(NiaLocalizations.of(context).settingsTitle),
      content: const Wrap(
        direction: Axis.vertical,
        children: [
          Text('Implement later')
          //
        ],
      ),
    );
  }
}
