import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'dynamic_flight_state.dart';

class DynamicFlightCubit extends Cubit<DynamicFlightState> {
  DynamicFlightCubit() : super(DynamicFlightInitial());
}
