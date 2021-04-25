import 'package:flutter/material.dart';
import 'package:turbo_care/extensions/extensions.dart';

class VTypeWidget extends StatelessWidget {
  final String typeKey;
  final String typeValue;

  const VTypeWidget({Key? key, required this.typeKey, required this.typeValue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(typeKey, style: context.textTheme.bodyText1),
          Text(typeValue, style: context.textTheme.headline6),
        ],
      ),
    );
  }
}
