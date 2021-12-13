import 'package:app_map/src/blocs/app_bloc/app_bloc.dart';
import 'package:app_map/src/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return  ChangeNotifierProvider(
      create: (context) => ApplicationBloc(),
      child: const MaterialApp(
        home: HomeScreen(),
        debugShowCheckedModeBanner: false,
        title: "App Maps",
      ),
    );
  }
}
