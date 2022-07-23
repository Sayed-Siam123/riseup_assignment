import 'package:dio/dio.dart';
import 'package:riseup_assignment/shared/constant/ConstantFunctions.dart';

import '../shared/constant/constant_data.dart';

class ApiProvider {

  final Dio dioWeather = Dio(BaseOptions(
    baseUrl: ConstantData.weatherUrl,
    connectTimeout: 50000,
    receiveTimeout: 50000,
    // headers: {
    //   "X-Authorization" : "1y8eGr8r75OOp2D4aMtbsDe6RJbONQL6iIOdH67COieqflQUBu52xTMFgBa6VJdE"
    // }
  ));

  static Dio api = Dio(BaseOptions(
    baseUrl: ConstantData.apiUrl,
    connectTimeout: 50000,
    receiveTimeout: 50000,
    // headers: {
    //   "X-Authorization" : "1y8eGr8r75OOp2D4aMtbsDe6RJbONQL6iIOdH67COieqflQUBu52xTMFgBa6VJdE"
    // }
  ));


  /*..interceptors.add(RetryInterceptor(
    dio: api,
    retries: 3, // retry count
    retryDelays: const [
      Duration(seconds: 1), // wait 1 sec before first retry
      Duration(seconds: 2), // wait 2 sec before second retry
      Duration(seconds: 3), // wait 3 sec before third retry
    ],
  ));*/

  login({email,pass}) async{
    try {
      var response = await api.post("/token",data: {
        "address": email,
        "password": pass,
      });
      return response;
    } on DioError catch (e) {
      return e.response;
    }
  }

  signup({email,pass}) async{
    try {
      var response = await api.post("/accounts",data: {
        "address": email,
        "password": pass,
      });
      return response;
    } on DioError catch (e) {
      return e.response;
    }
  }

  availableDomains() async{
    try {
      var response = await api.get("/domains");
      return response;
    } on DioError catch (e) {
      return e.response;
    }
  }

  getInbox() async{
    try {
      var response = await api.get("/messages",options: Options(
        headers: {
        'Authorization': 'Bearer ${FunctionsConstant.getUserToken()}',
        })
      );
      return response;
    } on DioError catch (e) {
      return e.response;
    }
  }

}