import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:turbo_care/blocs/v_profiles_data_cubit.dart';
import 'package:turbo_care/domain/v_profile.dart';
import 'package:turbo_care/domain/v_profiles_data.dart';
import 'package:turbo_care/pages/v_profile_page/v_profile_page.dart';
import 'package:turbo_care/extensions/extensions.dart';

class VListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VProfilesDataBloc, VProfilesData>(
        builder: (context, state) {
      if (state.vProfileList.isEmpty) {
        return Container();
      }

      return ListView.separated(
          separatorBuilder: (context, index) => Divider(indent: 20, color: Colors.black45),
          itemCount: state.vProfileList.length,
          itemBuilder: (context, index) {

            var p = state.vProfileList[index];

            return ListTile(
              title: Text(p.number!, style: context.textTheme.headline6),
              subtitle: Text("${p.maker} ${p.model}", style: context.textTheme.bodyText1),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () => _onVehicleProfileTap(context, p),
            );
          });
    });
  }

  void _onVehicleProfileTap(BuildContext context, VProfile vProfile) {
    Navigator.of(context).pushNamed(
      VProfilePage.routeName,
      arguments: vProfile,
    );
  }
}
