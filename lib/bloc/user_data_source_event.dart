part of 'user_data_source_bloc.dart';

abstract class UserDataSourceEvent extends Equatable {
  const UserDataSourceEvent();
}

class LinkUserDataSourceEvent extends UserDataSourceEvent {
  final String linkUserDataSourceDTO;

  LinkUserDataSourceEvent({
    @required this.linkUserDataSourceDTO,
  });

  @override
  List<Object> get props => [linkUserDataSourceDTO];
}

class GetUserDataSourcesEvent extends UserDataSourceEvent {
  GetUserDataSourcesEvent();

  @override
  List<Object> get props => [];
}
