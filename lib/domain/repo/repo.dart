import 'package:countires_bloc/domain/entity/countries.dart';

abstract class Repo{
  Future<List<Countries>> getCountries();
  Future<List<Countries>> getSpecificCountries(String name);
}