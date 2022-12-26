
import 'package:bloc_cubit_apicall/model/covid_model.dart';
import 'package:equatable/equatable.dart';

abstract class CovidPatientState extends Equatable {
  const CovidPatientState();
  @override
  List<Object?> get props => [];
}
class CovidInitial extends CovidPatientState {}
class CovidLoading extends CovidPatientState {}
class CovidLoaded extends CovidPatientState {
  final CovidModel data;
  const CovidLoaded(this.data);
  List<Object?> get props => [data];
}
class CovidError extends CovidPatientState {
  final String? message;
  const CovidError(this.message);
}