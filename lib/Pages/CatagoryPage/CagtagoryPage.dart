import 'package:flutter/material.dart';
import 'package:todouser/model/userModel.dart';


class CatagoryPage extends StatelessWidget {
  final UserModel usersmodel;
  const CatagoryPage({Key? key, required this.usersmodel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("catagory"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
          Center(child: Text(usersmodel.name.toString()))
          ],
        ),
      ),
    );
  }
}
