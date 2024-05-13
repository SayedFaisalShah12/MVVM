import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart';
import 'package:mvvm/data/app_exception.dart';
import 'package:mvvm/data/network/Base_api_services.dart';
import 'package:http/http.dart' as http;

class NetworkApiServices extends BaseApiServices{
  @override
  Future getGetApiResponse(String url) async {
    dynamic responseJosn;
    try{
        final response = await http.get(Uri.parse(url)).timeout(Duration(seconds: 10));
        responseJosn = returnResponse(response);
    }on SocketException{
        throw FetchDataException("No internet connection");
    }
    return responseJosn;
  }

  @override
  Future getPostApiResponse(String url, dynamic data) async {
    dynamic responseJosn;
    try{
      Response response =  await http.post(Uri.parse('https://reqres.in/api/login')).timeout(Duration(seconds: 10));
      responseJosn = returnResponse(response);
    }on SocketException{
      throw FetchDataException("No internet connection");
    }
    return responseJosn;
  }

  dynamic returnResponse(http.Response response){
    switch(response.statusCode){
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;

      case 400:
        throw BadRequestException(response.body.toString());

      case 404:
        throw UnauthorisedException(response.body.toString());
      case 500:

      default:
      throw FetchDataException("Error Occurred while Communication with server${response.body}");

    }
  }
  
}