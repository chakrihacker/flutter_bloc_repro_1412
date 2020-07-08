import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'user_data_source_event.dart';
part 'user_data_source_state.dart';

class UserDataSourceBloc
    extends Bloc<UserDataSourceEvent, UserDataSourceState> {
  UserDataSourceBloc() : super(UserDataSourceInitial());

  @override
  Stream<UserDataSourceState> mapEventToState(
    UserDataSourceEvent event,
  ) async* {
    if (event is LinkUserDataSourceEvent) {
      try {
        yield LinkUserDataSourceLoading();

        final dataSource = "Gmail";

        yield LinkUserDataSourceLoaded(userDataSource: dataSource);
      } on Error {
        yield LinkUserDataSourceError(message: "Account Linking Failed");
      }
    }
    if (event is GetUserDataSourcesEvent) {
      // fetch linked data sources
    }
  }
}
