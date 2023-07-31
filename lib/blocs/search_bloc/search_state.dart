part of 'search_bloc.dart';

@immutable
abstract class SearchState {}

class SearchInitial extends SearchState {}

class ResultSearch extends SearchState {
  final String result;

  ResultSearch(this.result);
}