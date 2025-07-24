// Packages
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

// MyApp
import './app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize Firebase
  await Firebase.initializeApp();
  // print('Firebase initialized');
  runApp(const MyApp());
}
