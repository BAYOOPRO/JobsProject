import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'screenone_state.dart';

class ScreenoneCubit extends Cubit<ScreenoneState> {
  ScreenoneCubit() : super(ScreenoneInitial());
}
