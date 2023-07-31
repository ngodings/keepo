part of 'search_bloc.dart';

@immutable
abstract class SearchEvent {}

class BeginSearchEvent extends SearchEvent {
  final String value;

  BeginSearchEvent(this.value);
}