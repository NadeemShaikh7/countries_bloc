import 'package:countires_bloc/domain/usecase/get_specific_country.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:countires_bloc/domain/entity/countries.dart';
import 'package:countires_bloc/domain/usecase/get_countries.dart';
import 'package:meta/meta.dart';

part 'country_event.dart';
part 'country_state.dart';

class CountryBloc extends Bloc<CountryEvent, CountryState> {
  final GetCountries getCountries;
  final GetSpecificCountry getSpecificCountry;
  CountryBloc(this.getCountries,this.getSpecificCountry) : super(CountryInitial()) {
    on<GetAllCountriesEvent>((event, emit) async{
      emit(CountryLoading());
      try{
        final countries  = await getCountries();
        emit(CountrySuccess(countries));
      }catch(e){
        emit(CountryError(e.toString()));
      }
    });
    on<GetCountryEvent>((event, emit) async{
      emit(CountryLoading());
      try{
        final countries  = await getSpecificCountry(event.countryName);
        emit(SpecificCountrySuccess(countries));
      }catch(e){
        emit(CountryError(e.toString()));
      }
    });
    on<ResetCountriesEvent>((event, emit) {
      emit(CountryInitial());
    });

  }
}
