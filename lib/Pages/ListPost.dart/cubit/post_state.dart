part of 'post_cubit.dart';

@immutable
abstract class PostState extends Equatable {
  const PostState();

  @override
  List<PostState> get props => [];
}

class PostInitial extends PostState {}

// ignore: must_be_immutable
class PostSuccessState extends PostState {
  PostModel post;
  PostSuccessState(this.post);
}

class PostChangeState extends PostState{
  PostChangeState();
}

class PostErrorState extends PostState {
  String error;
  PostErrorState(this.error);
}

class PostLoading extends PostState {}
