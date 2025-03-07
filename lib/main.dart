import 'package:flutter/material.dart';
import 'package:flutter_application_1/new-guided-hunt.dart';
import 'package:flutter_application_1/scavenger-hunts.dart';
import 'package:provider/provider.dart';
import './models/hunts_model.dart';
import './login.dart';
import './register.dart';
import './my-account.dart';
import './my-hunts.dart';
import './my-created-hunts.dart';
import './hunting.dart';
import './place-checklist.dart';
import './edit-profile.dart';
import './edit-hunt.dart';
import './add-place.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => HuntsModel(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'Namer App',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        ),
        initialRoute: '/',
        onGenerateRoute: (RouteSettings settings) {
          if (settings.name == '/checklist') {
            final String placeName = settings.arguments as String;
            return MaterialPageRoute(
              builder: (context) => PlaceChecklist(placeName: placeName),
            );
          }
          return null;
        },
        routes: {
          '/': (context) => LoginScreen(),
          '/register': (context) => RegisterScreen(),
          '/scavenger-hunts': (context) => ScavengerHunts(),
          '/hunting': (context) => Hunting(),
          '/createHunt': (context) => NewGuidedHunt(),
          '/myAccount': (context) => MyAccount(),
          '/myHunts': (context) => MyHunts(),
          '/myCreatedHunts': (context) => MyCreatedHunts(),
          '/editProfile': (context) => EditProfile(),
          '/editHunt': (context) => const EditHunt(),
          '/addPlace': (context) => AddPlace(),
        },
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {}