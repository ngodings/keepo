import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/transformers.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(SearchInitial()) {
    on<SearchEvent>((event, emit) {});
    on<BeginSearchEvent>((event, emit) => search(emit, event.value),
      transformer: (eventsStream, mapper) => eventsStream
          .debounceTime(const Duration(milliseconds: 200))
          .distinct()
          .switchMap(mapper),
    );
  }

  search(Emitter<SearchState> emit, String value) {
    emit(ResultSearch(value.toLowerCase()));
  }
}
