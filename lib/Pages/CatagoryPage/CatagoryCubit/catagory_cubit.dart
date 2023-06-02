import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:todouser/model/userModel.dart';

part 'catagory_state.dart';

class CatagoryCubit extends Cubit<CatagoryState> {
  CatagoryCubit() : super(CatagoryInitial());

  void getUser(List<UserModel> user) {

    if (state is List<UserModel>){
      emit(CatagorySuccess(user));
    }else{
      emit(CatagoryFailure(user.toString()));
    }
  }


}
