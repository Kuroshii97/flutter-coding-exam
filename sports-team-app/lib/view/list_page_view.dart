import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled2/model/teams.dart';
import 'package:untitled2/view/team_details_view.dart';
import 'package:untitled2/viewmodel/list_page_viewmodel.dart';

class ListPageView extends StatefulWidget {
  const ListPageView({super.key});

  @override
  State<ListPageView> createState() => _ListPageViewState();
}

class _ListPageViewState extends State<ListPageView> {
  late ListPageViewModel _listPageViewModelReader;
  late ListPageViewModel _listPageViewModelWatcher;
  final _controller = ScrollController();
  Timer? _debounce;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _listPageViewModelReader.getTeamListToStore();
      _controller.addListener(() {
        if (_controller.position.atEdge) {
          bool isTop = _controller.position.pixels == 0;
          if (!isTop) {
            if (_debounce?.isActive ?? false) _debounce?.cancel();
            _debounce = Timer(const Duration(milliseconds: 1000), () {
              _listPageViewModelReader.getTeamListForView();
            });
          }
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    _listPageViewModelReader = context.read<ListPageViewModel>();
    _listPageViewModelWatcher = context.watch<ListPageViewModel>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Teams List'),
      ),
      body: ListView.builder(
          controller: _controller,
          itemCount: _listPageViewModelWatcher.teamsList.length,
          itemBuilder: (BuildContext context, int index) {
            return _teamCard(_listPageViewModelWatcher.teamsList[index]);
          }),
    );
  }

  Widget _teamCard(Teams team) {
    return InkWell(
      onTap: () {
        _listPageViewModelReader.selectTeam(team);
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const TeamDetailsView()));
      },
      child: Card(
          child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(team.strTeam!),
            Text(team.strTeamShort.toString()),
          ],
        ),
      )),
    );
  }
}
