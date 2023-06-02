import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todouser/Pages/CatagoryPage/CagtagoryPage.dart';
import 'package:todouser/Pages/CatagoryPage/CatagoryCubit/catagory_cubit.dart';
import 'package:todouser/Pages/ListPost.dart/cubit/post_cubit.dart';
import 'package:todouser/Pages/ListPost.dart/widgetPost.dart';
import 'package:todouser/Pages/ShowDialog/DialogCubit/dialog_cubit.dart';
import 'package:todouser/Pages/ShowDialog/DialogPage.dart';
import 'package:todouser/Pages/homePage/cubit/home_cubit.dart';
import 'package:todouser/Pages/homePage/homepage.dart';
import 'package:todouser/main.dart';
import 'package:todouser/model/userModel.dart';

class RouteGenerator {
  final HomeCubit _homepageBloc = HomeCubit();
  final PostCubit _post_cubit = PostCubit();
  final DialogCubit _dialog_cubit = DialogCubit();
  final CatagoryCubit _catagory_cubit = CatagoryCubit();

  Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => BlocProvider<HomeCubit>.value(
            value: _homepageBloc,
            child: const MyHomePage(),
          ),
        );
      case '/postpage':
        return MaterialPageRoute(
          builder: (_) => BlocProvider<PostCubit>.value(
            value: _post_cubit,
            child: PostPage(),
          ),
        );
      case '/dialog':
        return MaterialPageRoute(
          builder: (_) => BlocProvider<DialogCubit>.value(
            value: _dialog_cubit,
            child: DialogPage(name: args.toString()),
          ),
        );
      case '/category':
        return MaterialPageRoute(
          builder: (_) => BlocProvider<CatagoryCubit>.value(
            value: _catagory_cubit,
            child: CatagoryPage(usersmodel: args as UserModel),
          ),
        );

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
