import 'package:get/get.dart';

class CertificationController extends GetxController {
  RxList<bool> hovers = <bool>[].obs;

  onHover(int index, bool value) {
    while (index >= hovers.length) {
      hovers.add(false);
    }
    hovers[index] = value;
  }
}
