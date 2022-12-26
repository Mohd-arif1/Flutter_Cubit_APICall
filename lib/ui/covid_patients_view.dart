import 'package:bloc_cubit_apicall/bloc/covid_state.dart';
import 'package:bloc_cubit_apicall/bloc/post_cubit.dart';
import 'package:bloc_cubit_apicall/model/covid_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class CovidPatientsListPage extends StatelessWidget {
  CovidModel? covidModels;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Covid Patients Countries'),
      ),
      body: BlocBuilder<CovidPatientsCubit, CovidPatientState>(
        builder: (context, state) {
          if(state is CovidLoading){
           return const Center(
              child: CircularProgressIndicator(),);
          }
          else if(state is CovidLoaded){
            covidModels=state.data;
            return  ListView.builder(
                itemCount:covidModels!.countries!.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(covidModels!.countries![index].country!),
                      subtitle:Text( 'Total Deaths '+ covidModels!.countries![index].totalDeaths!.toString()),
                      trailing:Text( 'New case '+ covidModels!.countries![index].newConfirmed!.toString()),
                    ),
                  );
                });
          }
          else{
            return Container();
          }
        },
      ),
    );
  }
}