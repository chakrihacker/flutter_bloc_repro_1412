part of 'user_data_source_bloc.dart';

abstract class UserDataSourceEvent extends Equatable {
  const UserDataSourceEvent();
}

class LinkUserDataSourceEvent extends UserDataSourceEvent {
  final String accountType;
  final String linkUserDataSourceDTO;

  LinkUserDataSourceEvent({
    @required this.accountType,
    @required this.linkUserDataSourceDTO,
  });

  @override
  List<Object> get props => [accountType, linkUserDataSourceDTO];
}

class GetUserDataSourcesEvent extends UserDataSourceEvent {
  GetUserDataSourcesEvent();

  @override
  List<Object> get props => [];
}
