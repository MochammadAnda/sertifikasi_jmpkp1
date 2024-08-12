import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sertifikasi_jpm_kp1/auth_provider.dart';
import 'package:sertifikasi_jpm_kp1/home_page.dart';
import 'package:sertifikasi_jpm_kp1/login_page.dart';

void main() {
  runApp(SertifikasiJMPKP1());
}

class SertifikasiJMPKP1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AuthProvider(),
      child: MaterialApp(
        title: 'Aplikasi Sensor Accelerometer',
        initialRoute: '/',
        routes: {
          '/': (context) => LoginPage(),
          '/home': (context) => HomePage(),
        },
      ),
    );
  }
}
