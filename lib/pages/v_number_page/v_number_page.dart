import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:turbo_care/bloc_repos/new_vehicle_data_bloc_repo.dart';
import 'package:turbo_care/pages/v_class_page/v_class_page.dart';
import 'package:turbo_care/extensions/extensions.dart';

class VNumberPage extends StatefulWidget {
  static const routeName = '/v_number_page';

  @override
  _VNumberPageState createState() => _VNumberPageState();
}

class _VNumberPageState extends State<VNumberPage> {
  TextEditingController _vNumber = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // clear data when user navigate to back
        context.read<NewVehicleDataBlocRepo>().vProfile.number = null;
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Create new vehicle profile'),
        ),
        body: _buildBodyWidget(),
        floatingActionButton: _buildNextBtnWidget(),
      ),
    );
  }

  Widget _buildBodyWidget() {
    return Padding(
      padding: const EdgeInsets.only(right: 16, left: 16, top: 16),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Text('VEHICLE NUMBER',style: context.textTheme.bodyText1,),
            alignment: Alignment.centerLeft,
          ),
          TextFormField(
            controller: _vNumber,
            decoration: InputDecoration(
              labelText: '',
              border: OutlineInputBorder(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNextBtnWidget() {
    return Builder(builder: (context) {
      return FloatingActionButton(
        child: Icon(Icons.arrow_forward_ios),
        onPressed: () => _onNextTap(context),
      );
    });
  }

  void _onNextTap(BuildContext context) {
    // close keyboard
    FocusScope.of(context).unfocus();

    // validations
    var vNumber = _vNumber.text.trim().toString();

    String? errorMsg;

    if (vNumber.isEmpty) {
      errorMsg = "VEHICLE NUMBER should not be empty";
    }

    if (errorMsg != null) {
      // show error msg
      var snackBar = SnackBar(
        duration: Duration(seconds: 2),
        content: Text(errorMsg),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return;
    }

    // set valid vehicle number
    context.read<NewVehicleDataBlocRepo>().vProfile.number = vNumber;
    // navigate to next
    Navigator.of(context).pushNamed(VClassPage.routeName);

  }
}
