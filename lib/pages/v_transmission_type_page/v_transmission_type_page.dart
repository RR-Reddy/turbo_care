import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:turbo_care/bloc_repos/new_vehicle_data_bloc_repo.dart';
import 'package:turbo_care/blocs/v_profiles_data_cubit.dart';

class VTransmissionTypePage extends StatefulWidget {
  static const routeName = '/v_transmission_type_page';

  @override
  _VTransmissionTypePageState createState() => _VTransmissionTypePageState();
}

class _VTransmissionTypePageState extends State<VTransmissionTypePage> {
  final List<String> transmissionTypeList = [
    "Manual",
    "Automatic",
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // clear data when user navigate to back
        context.read<NewVehicleDataBlocRepo>().vProfile.transmissionType = null;
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Select Transmission'),
        ),
        body: _buildModelListWidget(),
      ),
    );
  }

  Widget _buildModelListWidget() {
    return ListView.builder(
        itemCount: transmissionTypeList.length,
        itemBuilder: (context, index) {
          return ListTile(
              title: Text('${transmissionTypeList[index]}'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () => _onModelTap(context, transmissionTypeList[index]));
        });
  }

  void _onModelTap(BuildContext context, String transmissionType) {

    var repo=context.read<NewVehicleDataBlocRepo>();
    repo.vProfile.transmissionType = transmissionType;

    var bloc=context.read<VProfilesDataBloc>();
    bloc.state.vProfileList.add(repo.vProfile);
    var updatedList=bloc.state.vProfileList;

    var newState=bloc.state.copyWith(vProfileList: updatedList);
    bloc.doUpdateState(newState);

    Navigator.popUntil(context, (route) => route.isFirst);
  }
}
