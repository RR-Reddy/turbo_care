import 'package:flutter/material.dart';
import 'package:turbo_care/bloc_repos/new_vehicle_data_bloc_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:turbo_care/extensions/extensions.dart';
import 'package:turbo_care/pages/v_maker_page/v_maker_page.dart';

class VClassPage extends StatelessWidget {
  static const routeName = '/v_class_page';

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // clear data when user navigate to back
        context.read<NewVehicleDataBlocRepo>().vProfile.classType = null;
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Select Class'),
        ),
        body: Builder(builder: (context){


          var trailingWidget=Icon(Icons.arrow_forward_ios);

          return ListView(children: [
            ListTile(title: Text('Car'),trailing: trailingWidget,onTap: ()=>_onClassTap(context,'4w')),
            ListTile(title: Text('Bike'),trailing: trailingWidget,onTap: ()=>_onClassTap(context,'2w')),
          ],);
        }),
      ),
    );
  }

  void _onClassTap(BuildContext context,String classType){
    context.read<NewVehicleDataBlocRepo>().vProfile.classType = classType;

    if(context.isNotConnected){
      var snackBar = SnackBar(
        duration: Duration(seconds: 2),
        content: Text('Please connect to Internet'),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return;
    }

    Navigator.of(context).pushNamed(VMakerPage.routeName);

  }
}
