import 'package:bloc_cubit_apicall/ui/covid_patients_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/post_cubit.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Covid Global Data',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
        home: BlocProvider<CovidPatientsCubit>(
            create: (context) => CovidPatientsCubit()..getCovidData(), child: CovidPatientsListPage()));
  }
}

