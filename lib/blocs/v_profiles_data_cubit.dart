import 'package:bloc/bloc.dart';
import 'package:turbo_care/domain/v_profiles_data.dart';
import 'package:turbo_care/services/local_storage_service.dart';

class VProfilesDataBloc extends Cubit<VProfilesData> {
  VProfilesDataBloc() : super(VProfilesData( vProfileList: [])) {
    _init();
  }

  void _init() async{
   VProfilesData data= await LocalStorageService().getSharedPrefData();
   emit(data);
  }

  void doUpdateState(VProfilesData newData)async{
    emit(newData);
    LocalStorageService().saveSharedPrefData(newData);
  }
}
