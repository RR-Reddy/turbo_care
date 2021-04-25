import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:turbo_care/bloc_repos/new_vehicle_data_bloc_repo.dart';
import 'package:turbo_care/pages/v_transmission_type_page/v_transmission_type_page.dart';

class VFuelTypePage extends StatefulWidget {
  static const routeName = '/v_fuel_type_page';

  @override
  _VFuelTypePageState createState() => _VFuelTypePageState();
}

class _VFuelTypePageState extends State<VFuelTypePage> {
  final List<String> fuelTypeList = [
    "Petrol",
    "Diesel",
    "CNG",
    "Petrol+CNG",
    "Electric",
    "Hybrid"
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // clear data when user navigate to back
        context.read<NewVehicleDataBlocRepo>().vProfile.fuelType = null;
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Select Fuel Type'),
        ),
        body: _buildModelListWidget(),
      ),
    );
  }

  Widget _buildModelListWidget() {
    return ListView.builder(
        itemCount: fuelTypeList.length,
        itemBuilder: (context, index) {
          return ListTile(
              title: Text('${fuelTypeList[index]}'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () => _onModelTap(context, fuelTypeList[index]));
        });
  }

  void _onModelTap(BuildContext context, String fuelType) {
    context.read<NewVehicleDataBlocRepo>().vProfile.fuelType = fuelType;
    Navigator.of(context).pushNamed(VTransmissionTypePage.routeName);
  }
}
