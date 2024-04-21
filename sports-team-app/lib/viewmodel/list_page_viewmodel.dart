import 'package:flutter/cupertino.dart';
import 'package:untitled2/model/teams.dart';
import 'package:untitled2/network/repository.dart';

class ListPageViewModel extends ChangeNotifier {
  List<Teams> storedList = [];
  List<Teams> teamsList = [];
  Teams team = Teams();
  final Repository _repository = Repository();

  void getTeamListToStore() async {
    try {
      storedList = await _repository.getTeams();
      getTeamListForView();
      notifyListeners();
    } catch (error) {
      throw error.toString();
    }
  }

  void getTeamListForView() async {
    try {
      if(storedList != teamsList){
        int length = teamsList.length;
        if(storedList.length - teamsList.length <= 5){
          for(length; length <= storedList.length; length++){
            teamsList.add(storedList[length]);
          }
        } else {
          for(length; length <= teamsList.length+5; length++){
            teamsList.add(storedList[length]);
          }
        }
      }
      notifyListeners();
    } catch (error) {
      throw error.toString();
    }
  }

  void selectTeam(Teams team){
    this.team = team;
    notifyListeners();
  }

}