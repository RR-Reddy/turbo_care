import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:turbo_care/pages/v_list_page/widgets/v_create_btn_widget.dart';
import 'package:turbo_care/pages/v_list_page/widgets/v_list_widget.dart';

class VListPage extends StatelessWidget {
  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vehicles'),
        leading: IconButton(
          onPressed: () => SystemNavigator.pop(),
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: VListWidget(),
      floatingActionButton: VCreateBtnWidget(),
    );
  }
}
