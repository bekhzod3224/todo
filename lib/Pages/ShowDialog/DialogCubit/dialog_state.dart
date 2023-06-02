part of 'dialog_cubit.dart';

@immutable
abstract class DialogState {}

class DialogInitial extends DialogState {}

class DialogTimeout extends DialogState {
  DialogTimeout();
}

class DialogError extends DialogState {}

class DialogLoading extends DialogState {}

