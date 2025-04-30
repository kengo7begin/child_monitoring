import 'package:amplify_authenticator/amplify_authenticator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:new_project/api/amplify/amplify.dart';
import 'package:new_project/pages/main_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureAmplify();
  runApp(
    Authenticator(
      authenticatorBuilder: (context, state) {
        switch (state.currentStep) {
          case AuthenticatorStep.signIn:
            return Scaffold(
              body: Padding(
                padding: EdgeInsets.fromLTRB(
                  MediaQuery.of(context).size.width / 10,
                  MediaQuery.of(context).size.height / 10,
                  MediaQuery.of(context).size.width / 10,
                  0,
                ),
                child: Column(
                  children: [
                    const Text(
                      "Sign in your account",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                    SignInForm(),
                  ],
                ),
              ),
            );
          default:
            return null;
        }
      },
      child: const ProviderScope(child: MyApp()),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Child monitoring app',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black54),
        useMaterial3: true,
      ),
      builder: Authenticator.builder(),
      home: const MainScreen(),
    );
  }
}
