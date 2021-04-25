import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:turbo_care/bloc_repos/new_vehicle_data_bloc_repo.dart';
import 'package:turbo_care/pages/v_number_page/v_number_page.dart';

class VCreateBtnWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () async {
        context.read<NewVehicleDataBlocRepo>().clearData();
        Navigator.of(context).pushNamed(VNumberPage.routeName);
      },
    );
  }
}
