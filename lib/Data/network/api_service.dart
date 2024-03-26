import 'dart:io';
import 'package:final_exam/Data/app_exception.dart';
import 'package:http/http.dart' as http;
class ApiService {


  Future<dynamic> getApi(url) async{
    http.StreamedResponse? response;
    try{
      var request = http.Request('GET', Uri.parse(url));

      response = await request.send();

      return returnResponse (response);
    } on SocketException {
      throw FectchDataException(response!.reasonPhrase.toString());
    }
  }
  returnResponse(http.StreamedResponse response) async {
    print('Response ${response.reasonPhrase}');
    switch(response.statusCode){
      case 200:
        return await response.stream.bytesToString();
      case 500:
      case 404:
    }
  }
}