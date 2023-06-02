import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todouser/Pages/ShowDialog/DialogCubit/dialog_cubit.dart';
import 'package:todouser/Pages/ShowDialog/DialogCubit/dialog_cubit.dart';

class DialogPage extends StatelessWidget {
  final String name;
  const DialogPage({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<DialogCubit, DialogState>(
        listener: (context, state) {
          // TODO: implement listener
          if (state is DialogTimeout){
            Navigator.pushNamedAndRemoveUntil(context, '/', ModalRoute.withName('/') );
          }
        },
        builder: (context, state) {
          return Center(
            child: Text("${name}"),
          );
        },
      ),
    );
  }
}
