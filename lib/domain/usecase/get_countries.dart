import 'package:countires_bloc/data/repositories/repository_impl.dart';
import 'package:countires_bloc/domain/entity/countries.dart';

class GetCountries{
  final RepositoryImpl repositoryImpl;

  GetCountries(this.repositoryImpl);

  Future<List<Countries>> call(){
    return repositoryImpl.getCountries();
  }
}