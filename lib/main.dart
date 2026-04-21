import 'package:flutter/material.dart';
import 'package:flutter_money_tracking_app/views/splashscreenui.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:intl/date_symbol_data_local.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: "https://uyykiohqrqanfxodmywm.supabase.co",
    anonKey:
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InV5eWtpb2hxcnFhbmZ4b2RteXdtIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzM3ODcyMzAsImV4cCI6MjA4OTM2MzIzMH0.euIeYI3B22e3_BmA8ciZiUCL2DQ_CChlCp_2n_HE1q8",
  );

  await initializeDateFormatting('th', null);

  runApp(MoneyTrack());
}

class MoneyTrack extends StatefulWidget {
  const MoneyTrack({super.key});

  @override
  State<MoneyTrack> createState() => _MoneyTrackState();
}

class _MoneyTrackState extends State<MoneyTrack> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
      ),
    );
  }
}
