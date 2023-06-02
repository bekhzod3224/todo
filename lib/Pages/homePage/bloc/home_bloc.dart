// import 'package:bloc/bloc.dart';
// import 'package:dio/dio.dart';
// import 'package:meta/meta.dart';

// import 'package:todouser/Service/services.dart';
// import 'package:todouser/model/userModel.dart';

// part 'home_event.dart';
// part 'home_state.dart';

// class HomeBloc extends Bloc<HomeEvent, HomeState> {
//   HomeBloc() : super(HomeInitial()) {
//     on<HomeEvent>((event, emit) async {
//       if (state is HomeEventState) {
//         emit(HomeLoading());
//         await GetService.getUserApi().then((dynamic response) {
//           if (response is Response) {
//             List<UserModel> resData = (response.data as List)
//                 .map((e) => UserModel.fromJson(e))
//                 .toList();
//             emit(HomeSuccess(resData));
//           } else {
//             emit(HomeFailure(response));
//           }
//         });
//       }
//     });
//   }
// }
