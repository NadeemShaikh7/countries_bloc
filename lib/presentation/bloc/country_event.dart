part of 'country_bloc.dart';

@immutable
sealed class CountryEvent {}

final class GetAllCountriesEvent extends CountryEvent{}
class ResetCountriesEvent extends CountryEvent {}
final class GetCountryEvent extends CountryEvent{
  final String countryName;

  GetCountryEvent(this.countryName);
}
