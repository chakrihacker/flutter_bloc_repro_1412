import 'package:bloc_issue/bloc/user_data_source_bloc.dart';
import 'package:bloc_issue/presentation/screens/user_data_source/user_data_source_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserDataSourceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<UserDataSourceBloc>(
        create: (BuildContext context) {
          return UserDataSourceBloc();
        },
        child: UserDataSourceView(),
      ),
    );
  }
}
