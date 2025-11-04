import 'package:countires_bloc/data/repositories/api_service.dart';
import 'package:countires_bloc/domain/entity/countries.dart';
import 'package:countires_bloc/domain/repo/repo.dart';

class RepositoryImpl implements Repo {
  final ApiService apiService;
  RepositoryImpl(this.apiService);
  @override
  Future<List<Countries>> getCountries() async{
    final countries =  await apiService.getCountries();
    return countries?.map((country) => Countries(capital: country.capital,name: country.name,flag: country.flag,currency: country.currencies?.firstOrNull)).toList() ?? [];
  }

  @override
  Future<List<Countries>> getSpecificCountries(String name) async{
    final countries =  await apiService.getSpecificCountry(name);
    return countries?.map((country) => Countries(capital: country.capital,name: country.name,flag: country.flag,currency: country.currencies?.firstOrNull)).toList() ?? [];
  }
}