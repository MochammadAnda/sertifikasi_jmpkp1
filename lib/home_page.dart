import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _x = 0.0;
  double _y = 0.0;
  double _z = 0.0;

  @override
  void initState() {
    super.initState();
    accelerometerEvents.listen((AccelerometerEvent event) {
      setState(() {
        _x = event.x;
        _y = event.y;
        _z = event.z;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home Page')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Akselerometer Sensor',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            Text('X: $_x', style: TextStyle(fontSize: 18)),
            Center(
              child: Text(
                'Kegunaan: Menunjukkan kemiringan perangkat dari kiri ke kanan.',
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 10),
            Text('Y: $_y', style: TextStyle(fontSize: 18)),
            Center(
              child: Text(
                'Kegunaan: Menunjukkan kemiringan perangkat dari depan ke belakang.',
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 10),
            Text('Z: $_z', style: TextStyle(fontSize: 18)),
            Center(
              child: Text(
                'Kegunaan: Menunjukkan percepatan vertikal perangkat, termasuk efek gravitasi.',
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 20),
            Icon(
              Icons.phone_iphone,
              size: 100,
              color: _x.abs() > 1 || _y.abs() > 1 ? Colors.red : Colors.green,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigasi kembali ke halaman login
                Navigator.pushReplacementNamed(context, '/');
              },
              child: Text('Keluar'),
            ),
          ],
        ),
      ),
    );
  }
}
