import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:todouser/Service/services.dart';
import 'package:todouser/model/postModel.dart';

part 'post_state.dart';

class PostCubit extends Cubit<PostState> {
  PostCubit() : super(PostInitial());

  postInfo(dynamic date) async {

    emit(PostLoading());
    await GetService.postDataApi(date).then((dynamic response) {
      if (response is Response) {
        PostModel resData = (PostModel.fromJson(response.data));
        emit(PostSuccessState(resData));
      } else {
        emit(PostErrorState(response));
      }
    });
  }

  int counter = 0;

  void increment(){
    counter ++;
    emit(PostChangeState());
  }

}
