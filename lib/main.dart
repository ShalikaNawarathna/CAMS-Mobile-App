import 'package:camps_demo/routers/app_route.dart';

import 'package:camps_demo/view/widget/Map/cubit/map_cubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'cubit/cubit/login_cubit.dart';
import 'login_page.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();

   await dotenv.load();
  String apiKey = dotenv.env['GOOGLE_MAPS_API_KEY']!;

  //HttpOverrides.global = MyHttpOverrides();
  runApp(MyApp(
    appRouter: AppRouter(),
  ));
}

class MyApp extends StatelessWidget {
  final AppRouter? appRouter;

  const MyApp({super.key, this.appRouter});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginCubit>(create: (context) => LoginCubit()),
        BlocProvider<MapCubit>(create: (context) => MapCubit()),
      ],
      child: MaterialApp(
        title: 'CAMPS',
        debugShowCheckedModeBanner: false,
        onGenerateRoute: appRouter!.onGenerateRoute,
        home: const LoginPage(),
      ),
    );
  }
}
