import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled2/viewmodel/list_page_viewmodel.dart';

class TeamDetailsView extends StatefulWidget {
  const TeamDetailsView({super.key});

  @override
  State<TeamDetailsView> createState() => _TeamDetailsViewState();
}

class _TeamDetailsViewState extends State<TeamDetailsView> {
  late ListPageViewModel _listPageViewModelWatcher;

  @override
  Widget build(BuildContext context) {
    _listPageViewModelWatcher = context.watch<ListPageViewModel>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Team Details'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(_listPageViewModelWatcher.team.strTeamBanner!),
            const SizedBox(height: 2,),
            Text(_listPageViewModelWatcher.team.strTeam!),
            const SizedBox(height: 4,),
            Text(_listPageViewModelWatcher.team.strDescriptionEN!),
          ],
        ),
      ),
    );
  }


}
