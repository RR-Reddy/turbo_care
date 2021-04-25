import 'package:flutter/material.dart';
import 'package:turbo_care/domain/v_profile.dart';
import 'package:turbo_care/pages/v_class_page/v_class_page.dart';
import 'package:turbo_care/pages/v_fuel_type_page/v_fuel_type_page.dart';
import 'package:turbo_care/pages/v_list_page/v_list_page.dart';
import 'package:turbo_care/pages/v_maker_page/v_maker_page.dart';
import 'package:turbo_care/pages/v_model_page/v_model_page.dart';
import 'package:turbo_care/pages/v_number_page/v_number_page.dart';
import 'package:turbo_care/pages/v_profile_page/v_profile_page.dart';
import 'package:turbo_care/pages/v_transmission_type_page/v_transmission_type_page.dart';

class RoutesUtil {
  /// generates animated route
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) {
        switch (settings.name) {
          case VListPage.routeName:return VListPage();
          case VNumberPage.routeName:return VNumberPage();
          case VClassPage.routeName:return VClassPage();
          case VMakerPage.routeName:return VMakerPage();
          case VModelPage.routeName:return VModelPage();
          case VFuelTypePage.routeName:return VFuelTypePage();
          case VTransmissionTypePage.routeName:return VTransmissionTypePage();
          case VProfilePage.routeName:return VProfilePage(vProfile: settings.arguments as VProfile);
          default:
            throw Exception('unknown route : ${settings.name}');
        }
      },
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(1.0, 0.0);
        var end = Offset.zero;
        var curve = Curves.ease;
        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
}
