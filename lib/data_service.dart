import 'dart:convert';
import 'package:bloc_cubit_apicall/model/covid_model.dart';
import 'package:dio/dio.dart';
class DataService {
  final Dio _dio = Dio();
  final String _url = 'https://api.covid19api.com/summary';
  Future<CovidModel> fetchCovidList() async {
    try {
      Response response = await _dio.get(_url);
      return CovidModel.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return CovidModel.withError("Data not found / Connection issue");
    }
  }

}