import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class RefreshService extends GetxController {
  final _refreshSignal = RxBool(false);
  RxBool get refreshSignal => _refreshSignal;

  void setRefreshSignal(bool value) {
    _refreshSignal.value = value;
  }
}
