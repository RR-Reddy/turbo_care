import 'package:flutter/material.dart';
import 'package:turbo_care/domain/v_profile.dart';
import 'package:turbo_care/pages/v_profile_page/widgets/v_type_widget.dart';

class VProfileBodyWidget extends StatelessWidget {
  final VProfile vProfile;

  const VProfileBodyWidget({Key? key, required this.vProfile})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          Container(height: 24),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  flex: 1,
                  child:
                      VTypeWidget(typeKey: "MAKE", typeValue: vProfile.maker!)),
              Expanded(
                  flex: 1,
                  child:
                      VTypeWidget(typeKey: "MODEL", typeValue: vProfile.model!))
            ],
          ),
          Container(height: 32),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 1,
                child: VTypeWidget(
                    typeKey: "FUEL TYPE", typeValue: vProfile.fuelType!),
              ),
              Expanded(
                flex: 1,
                child: VTypeWidget(
                    typeKey: "TRANSMISSION",
                    typeValue: vProfile.transmissionType!),
              )
            ],
          ),
        ],
      ),
    );
  }
}
