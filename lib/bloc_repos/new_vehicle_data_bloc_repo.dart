import 'package:turbo_care/domain/v_profile.dart';

class NewVehicleDataBlocRepo {
  VProfile vProfile = VProfile();

  void clearData() {
    vProfile = VProfile();
  }
}
