import 'package:countires_bloc/data/repositories/api_service.dart';
import 'package:countires_bloc/data/repositories/repository_impl.dart';
import 'package:countires_bloc/domain/usecase/get_countries.dart';
import 'package:countires_bloc/domain/usecase/get_specific_country.dart';
import 'package:countires_bloc/presentation/bloc/country_bloc.dart';
import 'package:countires_bloc/presentation/screen/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final ApiService apiService = ApiService();
    final RepositoryImpl repositoryImpl = RepositoryImpl(apiService);
    final GetCountries getCountries = GetCountries(repositoryImpl);
    final GetSpecificCountry getSpecificCountry = GetSpecificCountry(repositoryImpl);
    return BlocProvider(
      create: (context) => CountryBloc(getCountries,getSpecificCountry),
      child: MaterialApp(
        navigatorObservers: [],
        title: 'Countries',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const HomePage(title: ' All Countries'),
      ),
    );
  }
}
