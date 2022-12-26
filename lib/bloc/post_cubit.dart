import 'package:bloc_cubit_apicall/bloc/covid_state.dart';
import 'package:bloc_cubit_apicall/data_service.dart';
import 'package:bloc_cubit_apicall/model/covid_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CovidPatientsCubit extends Cubit<CovidPatientState> {
  final _dataService = DataService();
  CovidPatientsCubit() : super(CovidInitial()) {}

  void getCovidData() async {
   emit(CovidLoading());
   CovidModel response= await _dataService.fetchCovidList();
   emit(CovidLoaded(response));
  }
}