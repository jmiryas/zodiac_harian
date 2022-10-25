import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'service_locator.dart';
import 'presentation/bloc/zodiac_bloc.dart';
import 'presentation/pages/zodiac_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  initializeServiceLocator().then(
    (_) => runApp(
      MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => serviceLocator.get<ZodiacBloc>()
              ..add(
                GetAllZodiacEvent(),
              ),
          ),
        ],
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Zodiac Harian",
      debugShowCheckedModeBanner: false,
      home: ZodiacPage(),
    );
  }
}
