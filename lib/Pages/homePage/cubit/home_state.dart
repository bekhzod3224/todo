part of 'home_cubit.dart';

@immutable
abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<HomeState> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeSuccessState extends HomeState {
  List<UserModel> data;
  HomeSuccessState(this.data);
}

class HomeErrorState extends HomeState {
  String message;
  HomeErrorState(this.message);
}
