import 'package:bloc_issue/bloc/user_data_source_bloc.dart';
import "package:bloc_test/bloc_test.dart";

class MockUserDataSourceBloc
    extends MockBloc<UserDataSourceEvent, UserDataSourceState>
    implements UserDataSourceBloc {}
