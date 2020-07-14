import 'package:bloc_issue/bloc/user_data_source_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserDataSourceView extends StatefulWidget {
  @override
  _UserDataSourceViewState createState() => _UserDataSourceViewState();
}

class _UserDataSourceViewState extends State<UserDataSourceView> {
  List accounts = ["Gmail", "Facebook", "Twitter"];

  @override
  void initState() {
    super.initState();
    handleGetUserDataSources(context: context);
  }

  void handleGetUserDataSources({@required BuildContext context}) async {
    context.bloc<UserDataSourceBloc>().add(GetUserDataSourcesEvent());
  }

  void handleAccountLinkPressed(int index) {
    context.bloc<UserDataSourceBloc>().add(
          LinkUserDataSourceEvent(
            accountType: accounts[index],
            linkUserDataSourceDTO: "test@gmail.com",
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserDataSourceBloc, UserDataSourceState>(
      listener: (blocContext, state) {
        if (state is LinkUserDataSourceLoaded) {
          Scaffold.of(blocContext).showSnackBar(
            SnackBar(
              content: Text("Account Linked Successfully"),
            ),
          );
        }
      },
      child: BlocBuilder<UserDataSourceBloc, UserDataSourceState>(
        builder: (buildContext, state) {
          return Container(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: accounts.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      height: 30,
                      alignment: Alignment.center,
                      child: FlatButton(
                        onPressed: () => handleAccountLinkPressed(index),
                        child: Text('${accounts[index]}'),
                      ),
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
