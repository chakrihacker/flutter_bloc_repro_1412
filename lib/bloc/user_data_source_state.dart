part of 'user_data_source_bloc.dart';

abstract class UserDataSourceState extends Equatable {
  const UserDataSourceState();
}

class UserDataSourceInitial extends UserDataSourceState {
  @override
  List<Object> get props => [];
}

class LinkUserDataSourceLoading extends UserDataSourceState {
  const LinkUserDataSourceLoading();

  @override
  List<Object> get props => [];
}

class LinkUserDataSourceLoaded extends UserDataSourceState {
  final String userDataSource;
  const LinkUserDataSourceLoaded({@required this.userDataSource});

  @override
  List<Object> get props => [this.userDataSource];
}

class LinkUserDataSourceError extends UserDataSourceState {
  final String message;

  const LinkUserDataSourceError({@required this.message});

  @override
  List<Object> get props => [this.message];
}
