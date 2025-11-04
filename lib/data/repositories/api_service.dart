import 'dart:convert';

import 'package:countires_bloc/data/model/country_model.dart';
import 'package:http/http.dart' as http;
class ApiService{
  Future<List<CountryModel>?> getCountries(String? name) async{
    late final Uri uri;
    if(name == null){
      uri = Uri.https('apicountries.com','/countries');
    }else{
      uri = Uri.https('apicountries.com','/name/$name');
    }


    final response = await http.get(uri);

    try{
      if(response.statusCode == 200){
        final data = jsonDecode(response.body);
        final countries = (data as List).map((countries) {
          return CountryModel.fromJson(countries);
        }).toList();
        print(countries);
        return countries;
      }
    }catch(e){
      print(e.toString());
      throw Exception("Failed to load countries - ${e.toString()}");
    }
    return [];
  }


  Future<CountryModel?> getSpecificCountry(String country) async{
    final uri = Uri.https('apicountries.com','/name/$country');

    final response = await http.get(uri);


    try{
      if(response.statusCode == 200){
        final data = jsonDecode(response.body);
        print(response.body);
        return CountryModel.fromJson(data);
      }
    }catch(e){
      print(e.toString());
      throw Exception("Failed to load countries - ${e.toString()}");
    }
    return null;
  }
}