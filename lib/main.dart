import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:suitmedia_app/injection.dart' as di;
import 'package:suitmedia_app/presentations/cubit/users_cubit.dart';
import 'package:suitmedia_app/shared/bloc_observer.dart';

import 'presentations/pages/app.dart';

void main() {
  di.init();
  BlocOverrides.runZoned(() {
    runZonedGuarded(() {
      runApp(MultiBlocProvider(providers: [
        BlocProvider(create: (context) => di.locator<UsersCubit>()),
      ], child: MyApp()));
    }, (error, stackTrace) {});
  }, blocObserver: Observer());
}
