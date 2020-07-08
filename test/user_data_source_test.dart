import 'package:bloc_issue/bloc/mock_user_data_source.dart';
import 'package:bloc_issue/bloc/user_data_source_bloc.dart';
import 'package:bloc_issue/presentation/screens/user_data_source/user_data_source_view.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

void main() {
  group("UserDataSource Screen", () {
    MockUserDataSourceBloc mockUserDataSourceBloc;

    setUp(() {
      mockUserDataSourceBloc = MockUserDataSourceBloc();
    });

    tearDown(() {
      mockUserDataSourceBloc.close();
    });

    Future<void> _buildApp(WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        title: "Test App",
        home: Scaffold(
          body: BlocProvider<UserDataSourceBloc>(
            create: (_) => mockUserDataSourceBloc,
            child: UserDataSourceView(),
          ),
        ),
      ));

      await tester.pump(const Duration(minutes: 1));
    }

    testWidgets("Should render initial state", (WidgetTester tester) async {
      when(mockUserDataSourceBloc.state).thenReturn((UserDataSourceInitial()));

      await _buildApp(tester);

      expect(find.text("Gmail"), findsOneWidget);
    });

    testWidgets("Should show snackbar when userdatasource linking succeeds",
        (WidgetTester tester) async {
      String account = "test@gmail.com";
      final expectedStates = [
        LinkUserDataSourceLoading(),
        LinkUserDataSourceLoaded(userDataSource: account)
      ];

      whenListen(mockUserDataSourceBloc, Stream.fromIterable(expectedStates));

      await _buildApp(tester);

      expect(find.text("Gmail"), findsOneWidget);

      await tester.tap(find.text(("Gmail")));

      await tester.pump();
      verify(
        mockUserDataSourceBloc.add(
          LinkUserDataSourceEvent(linkUserDataSourceDTO: account),
        ),
      ).called(1);
      expect(find.text("Account Linked Successfully"), findsOneWidget);
    });
  });
}
