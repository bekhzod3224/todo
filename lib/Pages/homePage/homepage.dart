import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';
import 'package:todouser/Core/ShowDialog/error_message.dart';
import 'package:todouser/Pages/ListPost.dart/counter/counter_cubit.dart';

import 'cubit/home_cubit.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var result = "";


  @override
  Widget build(BuildContext context) {
    return _scaffold();
  }

  Scaffold _scaffold() {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.pushNamed(context, '/postpage');
          }),
      appBar: AppBar(
        title: Text("${result}"),
        actions: [
          TextButton(
              onPressed: () {
                context.read<CounterCubit>().update();
              },
              child: Icon(Icons.add)),
          TextButton(
              onPressed: () async {
                var res = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SimpleBarcodeScannerPage(),
                    ));
                setState(() {
                  if (res is String) {
                    result = res;

                  }
                });
              },
              child: Icon(Icons.barcode_reader)),
        ],
        centerTitle: false,
      ),
      body: RefreshIndicator(
        triggerMode: RefreshIndicatorTriggerMode.anywhere,
        onRefresh: () async {
          context.read<HomeCubit>().getUser();
        },
        child: BlocConsumer<HomeCubit, HomeState>(
          listener: (context, state) {
            if (state is HomeErrorState) {
              return ErrorPop(context, state.message);
            }
          },
          builder: (context, state) {
            return Builder(builder: (context) {
              if (state is HomeLoadingState)
                return Center(child: CircularProgressIndicator());
              if (state is HomeErrorState)
                return Center(
                  child: Column(
                    children: [
                      Text("${state.message}"),
                      TextButton(
                          onPressed: () {
                            context.read<HomeCubit>().getUser();
                          },
                          child: Text("Refresh Page"))
                    ],
                  ),
                );
              if (state is HomeSuccessState) {
                return ListView.builder(
                  itemCount: state.data.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/category',
                            arguments: state.data[index]);
                      },
                      child: Card(
                        child: ListTile(
                          title: Text(state.data[index].name.toString()),
                        ),
                      ),
                    );
                  },
                );
              } else {
                return Text("data");
              }
            });
          },
        ),
      ),
    );
  }
}
