import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:turbo_care/bloc_repos/new_vehicle_data_bloc_repo.dart';
import 'package:turbo_care/pages/v_fuel_type_page/v_fuel_type_page.dart';
import 'package:turbo_care/services/api_client_service.dart';

class VModelPage extends StatefulWidget {
  static const routeName = '/v_model_page';

  @override
  _VModelPageState createState() => _VModelPageState();
}

class _VModelPageState extends State<VModelPage> {
  List<String> modelList = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _init();
  }

  void _init() async {
    var vProfile = context.read<NewVehicleDataBlocRepo>().vProfile;
    var res = await ApiClientService()
        .getModelsList(vProfile.classType!, vProfile.maker!);

    if (res.success && mounted) {
      setState(() {
        modelList = res.data!;
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // clear data when user navigate to back
        context.read<NewVehicleDataBlocRepo>().vProfile.model = null;
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Select Model'),
        ),
        body: _isLoading
            ? Center(child: CircularProgressIndicator())
            : _buildModelListWidget(),
      ),
    );
  }

  Widget _buildModelListWidget() {
    return ListView.builder(
        itemCount: modelList.length,
        itemBuilder: (context, index) {
          return ListTile(
              title: Text('${modelList[index]}'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () => _onModelTap(context, modelList[index]));
        });
  }

  void _onModelTap(BuildContext context, String model) {
    context.read<NewVehicleDataBlocRepo>().vProfile.model = model;
    Navigator.of(context).pushNamed(VFuelTypePage.routeName);
  }
}
