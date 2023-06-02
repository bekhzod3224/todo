import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todouser/Core/Route/routes.dart';
import 'package:todouser/Pages/CatagoryPage/CatagoryCubit/catagory_cubit.dart';
import 'package:todouser/Pages/ListPost.dart/counter/counter_cubit.dart';
import 'package:todouser/Pages/ListPost.dart/cubit/post_cubit.dart';
import 'package:todouser/Pages/ListPost.dart/widgetPost.dart';
import 'package:todouser/Pages/ShowDialog/DialogCubit/dialog_cubit.dart';
import 'Pages/homePage/cubit/home_cubit.dart';

void main() {
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(create: (context) => HomeCubit()),
      BlocProvider(create: (context) => CounterCubit()),
      BlocProvider(create: (context) => PostCubit()),
      BlocProvider(create: (context) => DialogCubit()),
      BlocProvider(create: (context) => CatagoryCubit()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TestingApp',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      initialRoute: "/",
      onGenerateRoute: RouteGenerator().generateRoute,
      // home: const MyHomePage(),
    );
  }
}
