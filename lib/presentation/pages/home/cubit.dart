import 'package:bloc/bloc.dart';

import 'state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeState().init());
}
