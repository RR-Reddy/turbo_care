import 'package:flutter/material.dart';
import 'package:turbo_care/blocs/connectivity_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

extension BuildContextX on BuildContext {
  ThemeData get theme => Theme.of(this.rootContext);
  TextTheme get textTheme => this.theme.textTheme;

  BuildContext get rootContext =>
      Navigator.of(this, rootNavigator: true).context;

  Size get dSize =>MediaQuery.of(this.rootContext).size;

  bool get isConnected => this.read<ConnectivityBloc>().state;
  bool get isNotConnected => !this.isConnected;


}
