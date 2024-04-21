import 'package:dio/dio.dart';
import 'package:untitled2/flavors.dart';
import 'package:untitled2/network/dio_manager.dart';
import 'package:untitled2/util/custom_exception.dart';

class NetworkProvider {
  dynamic _handleResponse(Response response) {
    return response.data;
  }

  _handleError(dynamic error) {
    if (error is DioException) {
      if (error.response == null) {
        throw FetchDataException(error.message!);
      } else {
        throw BadRequestException(error.response!.data['message']);
      }
    } else {
      throw FetchDataException(error.message);
    }
  }

  Future<dynamic> getTeams() async {
    dynamic responseJson;
    try {
      final response = await DioManager.getDio().get('api/v1/json/3/search_all_teams.php?l=${F.title}');

      responseJson = _handleResponse(response);
    } catch (error) {
      _handleError(error);
    }

    return responseJson;
  }


}