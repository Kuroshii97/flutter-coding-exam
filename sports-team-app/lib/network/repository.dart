import 'package:untitled2/model/teams.dart';
import 'package:untitled2/network/network_provider.dart';


class Repository {
  final _networkProvider = NetworkProvider();

  Future<List<Teams>> getTeams() async {
    final response = await _networkProvider.getTeams();
    List<Teams> teamList = [];
    for(int i = 0; i < response['teams'].length; i++){
      teamList.add(Teams.fromJson(response['teams'][i]));
    }
    return teamList;
  }
}
