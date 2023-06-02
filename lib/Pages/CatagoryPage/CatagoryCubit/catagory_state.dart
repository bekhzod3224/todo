part of 'catagory_cubit.dart';

@immutable
abstract class CatagoryState {}

class CatagoryInitial extends CatagoryState {}


class CatagoryLoading extends CatagoryState {}


class CatagorySuccess extends CatagoryState {
  List<UserModel> usersdata;
  CatagorySuccess(this.usersdata);
}

class CatagoryFailure  extends CatagoryState {
  String errorMessage;
  CatagoryFailure(this.errorMessage);
}
