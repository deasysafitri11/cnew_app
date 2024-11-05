import 'package:cnew_app/constant/theme.dart';
import 'package:cnew_app/pages/on_boarding_page.dart';
import 'package:cnew_app/providers/ekonomi_new_provider.dart';
import 'package:cnew_app/providers/nasional_new_provider.dart';
import 'package:cnew_app/providers/news_update_provider.dart';
import 'package:cnew_app/providers/tech_new_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/date_symbol_data_local.dart' as intl;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Inisialisasi locale Indonesia
  await intl.initializeDateFormatting('id_ID', null);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => NewsUpdateProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => TechNewsProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => EkonomiNewProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => NasionalNewProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primaryColor: primaryColor,
          useMaterial3: true,
        ),
        home: const OnBoardingPage(),
      ),
    );
  }
}
