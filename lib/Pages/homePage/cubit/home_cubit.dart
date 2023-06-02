import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:todouser/Service/services.dart';
import 'package:todouser/model/userModel.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial()) {
    getUser();
  }
  //Logic for
  getUser() async {
    emit(HomeLoadingState());
    await GetService.getUserApi().then((dynamic response) {
      if (response is Response) {
        List<UserModel> resData =
            (response.data as List).map((e) => UserModel.fromJson(e)).toList();
        emit(HomeSuccessState(resData));
      } else {
        emit(HomeErrorState(response));
      }
    });
  }
}
