import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:turbo_care/bloc_repos/new_vehicle_data_bloc_repo.dart';
import 'package:turbo_care/extensions/extensions.dart';
import 'package:turbo_care/pages/v_model_page/v_model_page.dart';
import 'package:turbo_care/services/api_client_service.dart';
import 'package:turbo_care/utils/app_utils.dart';

class VMakerPage extends StatefulWidget {
  static const routeName = '/v_maker_page';

  @override
  _VMakerPageState createState() => _VMakerPageState();
}

class _VMakerPageState extends State<VMakerPage> {
  List<String> makerList = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _init();
  }

  void _init() async {
    var classType = context.read<NewVehicleDataBlocRepo>().vProfile.classType!;
    var res = await ApiClientService().getMakersList(classType);

    if (res.success && mounted) {
      setState(() {
        makerList = res.data!;
        _isLoading = false;
      });
    }else{
      AppUtils.logMsg(this, "api error : ${res.error}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // clear data when user navigate to back
        context.read<NewVehicleDataBlocRepo>().vProfile.maker = null;
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Select Make'),
        ),
        body: _isLoading
            ? Center(child: CircularProgressIndicator())
            : _buildMakerListWidget(),
      ),
    );
  }

  Widget _buildMakerListWidget() {
    return ListView.builder(
        itemCount: makerList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('${makerList[index]}'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () => _onMakerTap(context, makerList[index]),
          );
        });
  }

  void _onMakerTap(BuildContext context, String maker) {
    context.read<NewVehicleDataBlocRepo>().vProfile.maker = maker;

    if (context.isNotConnected) {
      var snackBar = SnackBar(
        duration: Duration(seconds: 2),
        content: Text('Please connect to Internet'),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return;
    }

    Navigator.of(context).pushNamed(VModelPage.routeName);
  }
}
