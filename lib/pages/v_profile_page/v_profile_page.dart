import 'package:flutter/material.dart';
import 'package:turbo_care/domain/v_profile.dart';
import 'package:turbo_care/pages/v_profile_page/widgets/v_profile_body_widget.dart';
import 'package:turbo_care/extensions/extensions.dart';

class VProfilePage extends StatelessWidget {
  static const routeName = '/v_profile_page';

  final VProfile vProfile;

  const VProfilePage({Key? key, required this.vProfile}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(250),
        child: Container(
          child: AppBar(
              bottom: PreferredSize(
            preferredSize: Size(double.infinity, 150),
            child: Container(
              padding: const EdgeInsets.only(left: 16, bottom: 16),
              width: context.dSize.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${vProfile.model} ${vProfile.fuelType}",
                    style: context.textTheme.headline4!
                        .copyWith(color: Colors.white),
                  ),
                  Text(
                    "${vProfile.number}",
                    style: context.textTheme.bodyText1!
                        .copyWith(color: Colors.white),
                  )
                ],
              ),
            ),
          )),
        ),
      ),
      body: VProfileBodyWidget(vProfile: vProfile),
    );
  }
}
