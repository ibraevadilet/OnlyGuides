// ignore_for_file: use_build_context_synchronously, use_key_in_widget_constructors

// import 'package:apphud/apphud.dart';
import 'package:apphud/apphud.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:only_guides/feature/auth/splash_screen.dart';
import 'services/notification_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Apphud.start(apiKey: AppLinks.apphudKey);

  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: AppLinks.firebaseApiKey,
      appId: AppLinks.firebaseAppId,
      messagingSenderId: AppLinks.firebaseMessagingSenderId,
      projectId: AppLinks.firebaseProjectId,
      storageBucket: AppLinks.firebaseStorageBucket,
    ),
  );

  runApp(MyApp());

  NotificationService notificationService = NotificationService();
  notificationService.activate();

  await Future.delayed(const Duration(seconds: 8));
  try {
    final InAppReview inAppReview = InAppReview.instance;

    if (await inAppReview.isAvailable()) {
      inAppReview.requestReview();
    } else {
      inAppReview.openStoreListing(
        appStoreId: AppLinks.appStoreIdentifier,
      );
    }
  } catch (e) {
    throw Exception(e);
  }
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'OnlyGuides',
      theme: ThemeData(
        splashColor: Colors.transparent,
        splashFactory: NoSplash.splashFactory,
        highlightColor: Colors.transparent,
      ),
      home: SplashScreen(),
    );
  }
}

class AppLinks {
  static const String appStoreIdentifier = '1671925193';
  static const String apphudKey = 'app_bcbWL1h5yAXJYQDrSY3uKQf6Xq7AL8';
  static const String privacyPolicy =
      'https://docs.google.com/document/d/1Y-WYTg-5d7yykd0ttWFp3A0qWLOcozik7IVRVMdX8wM/edit?usp=sharing';
  static const String termOfUse =
      'https://docs.google.com/document/d/13psrnVU4DvX4S6YC21fmtD7ABG_Z57yDwTKNyhalqrE/edit?usp=sharing';
  static const String supportForm =
      'https://sites.google.com/view/travlin/support-form';
  static const String databaseRoot = 'json_root';
  static const String baseUrl1 = 'travlin';
  static const String baseUrl2 = 'app';
  static const String url11key = 'travel';
  static const String url12key = 'premium';
  static const String url21key = 'posts';
  static const String url22key = 'publicate';
  static const String firebaseApiKey =
      'AIzaSyBJhvyIqoV6pGrpKKVbozIA_VMRvqprQSg';
  static const String firebaseAppId =
      '1:450416071665:ios:d6e03249744180e508ea50';
  static const String firebaseMessagingSenderId = '450416071665';
  static const String firebaseProjectId = 'only-guides';
  static const String firebaseStorageBucket = 'only-guides.appspot.com';
}
