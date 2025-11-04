import 'package:countires_bloc/data/repositories/repository_impl.dart';
import 'package:countires_bloc/domain/entity/countries.dart';

class GetSpecificCountry{
  final RepositoryImpl repositoryImpl;

  GetSpecificCountry(this.repositoryImpl);

  // Future<Countries?> call(String country){
  //   return repositoryImpl.getSpecificCountry(country);
  // }
}