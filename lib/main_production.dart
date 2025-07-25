import 'package:flutter/material.dart';
import 'package:flutter_application_1/app.dart';
import 'package:konnek_flutter/konnek_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
  await KonnekFlutter.initKonnek(
    inputClientId: '42f2486e-3870-466c-9d66-143e0417652b', // SprintAsia
    // inputClientId: '61190e21-2e2e-4a01-94d5-7f05c7bbdb5e', // bcadigitaldemo
    inputClientSecret: '1dc8e065-2915-4b4e-8df2-45040e8314bd',
    flavor: Flavor.production,
  );
}
