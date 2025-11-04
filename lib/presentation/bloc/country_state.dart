part of 'country_bloc.dart';

@immutable
sealed class CountryState {}

final class CountryInitial extends CountryState {}
final class CountryLoading extends CountryState {}
final class CountrySuccess extends CountryState {
  final List<Countries> countries;

  CountrySuccess(this.countries);
}
final class CountryError extends CountryState {
  final String error;

  CountryError(this.error);
}
