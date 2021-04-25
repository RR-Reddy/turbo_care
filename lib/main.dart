import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:turbo_care/bloc_repos/new_vehicle_data_bloc_repo.dart';
import 'package:turbo_care/blocs/v_profiles_data_cubit.dart';
import 'package:turbo_care/routes/routes_util.dart';

import 'blocs/connectivity_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// setting for mobile orientation
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  var app = MultiBlocProvider(
      providers: [
        BlocProvider<ConnectivityBloc>(
            lazy: false, create: (BuildContext context) => ConnectivityBloc()),
        BlocProvider<VProfilesDataBloc>(
            lazy: false, create: (BuildContext context) => VProfilesDataBloc()),
      ],
      child: MultiRepositoryProvider(providers: [
        RepositoryProvider<NewVehicleDataBlocRepo>(
          lazy: false,
          create: (context) => NewVehicleDataBlocRepo(),
        ),
      ], child: App()));

  runApp(app);
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Turbo Care',
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RoutesUtil.onGenerateRoute,
    );
  }
}
