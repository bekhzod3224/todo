import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todouser/Pages/ListPost.dart/counter/counter_cubit.dart';
import 'package:todouser/Pages/ListPost.dart/counter/counter_cubit.dart';
import 'package:todouser/Pages/ListPost.dart/cubit/post_cubit.dart';
import 'package:todouser/Pages/homePage/cubit/home_cubit.dart';
import 'package:todouser/model/postModel.dart';

class PostPage extends StatefulWidget {
  const PostPage({super.key});

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
   popup() {
    showDialog(context: context, builder: (builder) {
      return AlertDialog(
        content: Text('Success'),
        actions: <Widget>[
          Text('Cancel'),
          InkWell(child: Text('OK'),)
        ],
      );
    });
  }
   ErrorPop(String errorMessage) {
     showDialog(context: context, builder: (builder) {
       return AlertDialog(
         content: Text(errorMessage),
         actions: <Widget>[

           InkWell(child: Text('OK'),onTap: (){
             Navigator.pop(context);
           },)
         ],
       );
     });
   }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Post Information"),
        ),
        body: BlocProvider(
          create: (context) => PostCubit(),
          child: BlocConsumer<PostCubit, PostState>(
            listener: (context , state){
              if (state is PostSuccessState) {
                 Navigator.pushNamedAndRemoveUntil(context, "/dialog", ModalRoute.withName('/dialog'), arguments: "Salom");

              };
              if (state is PostErrorState)
                return ErrorPop(state.error);
            },
            builder: (context, state) {
              if(state is PostLoading)  return Center(
                child: CircularProgressIndicator()
              );



              return widgetPage(context);
            },
          ),
        ));
  }

  widgetPage(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      children: [

        BlocBuilder<PostCubit, PostState>(
  builder: (context, state) {
    return Text("${context.watch<CounterCubit>().counter}");
  },
),

        TextButton(
          // style: ButtonStyle(backgroundColor:Colors.green),
          onPressed: () => {
            context.read<CounterCubit>().update()
          },
              child: Text("Add"),
        ),
        TextButton(
          // style: ButtonStyle(backgroundColor:Colors.green),
          onPressed: () => {
            context.read<CounterCubit>().update()
          },
          child: Text("++++++++++++++++"),
        ),

         BlocBuilder<CounterCubit, CounterState>(
  builder: (context, state) {
    return context.watch<CounterCubit>().isbtn ?  Text("Salom") : Container();
  },
),

        Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(),
          child: TextFormField(
            decoration: InputDecoration(
                hintText: "title",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    borderSide: BorderSide(color: Colors.green.shade500))),
          ),
        ),
        Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(),
          child: TextFormField(
            decoration: InputDecoration(
                hintText: "body",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    borderSide: BorderSide(color: Colors.green.shade500))),
          ),
        ),
        TextButton(
            // style: ButtonStyle(backgroundColor:Colors.green)),
            onPressed: () {
              PostModel data =
                  PostModel(body: "hello", title: "hi", id: 1, userId: 2);

              PostModel post = PostModel(
                id: 1,
                userId: 1,
                title: "hello",
                body: "hello",
              );

              context.read<PostCubit>().postInfo(post);
            },
            child: Text("Add Post"))
      ],
    ));
  }
}
