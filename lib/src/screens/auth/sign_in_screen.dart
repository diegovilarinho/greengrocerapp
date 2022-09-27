import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:greengrocer/src/screens/auth/components/custom_text_field.dart';
import 'package:greengrocer/src/screens/auth/sign_up_screen.dart';
import 'package:greengrocer/src/screens/base/base_screen.dart';
import 'package:greengrocer/src/config/custom_colors.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final animatedCategories = [
      FadeAnimatedText('Frutas'),
      FadeAnimatedText('Verduras'),
      FadeAnimatedText('Legumes'),
      FadeAnimatedText('Carnes'),
      FadeAnimatedText('Cereais'),
      FadeAnimatedText('Laticíneos'),
    ];

    return Scaffold(
      backgroundColor: CustomColors.customSwatchColor,
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // AppName
                    Text.rich(
                      TextSpan(
                          style: const TextStyle(
                            fontSize: 40,
                          ),
                          children: [
                            const TextSpan(
                              text: 'Green',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                              text: 'grocer',
                              style: TextStyle(
                                color: CustomColors.customContrastColor,
                              ),
                            ),
                          ]),
                    ),

                    // Categories
                    SizedBox(
                      height: 30,
                      child: DefaultTextStyle(
                        style: const TextStyle(
                          fontSize: 25,
                        ),
                        child: AnimatedTextKit(
                          pause: Duration.zero,
                          repeatForever: true,
                          animatedTexts: animatedCategories,
                        ),
                      ),
                    )
                  ],
                ),
              ),

              // Auth Form
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 40),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(35))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Email Input
                    const CustomTextField(
                      icon: Icons.email,
                      label: 'E-mail',
                    ),

                    // Password Input
                    const CustomTextField(
                      icon: Icons.lock,
                      label: 'Senha',
                      isSecret: true,
                      distance: 0,
                    ),

                    // Forgot Password Link
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          print('Esqueci a Senha!!');
                        },
                        child: Text('Esqueceu a senha?',
                            style: TextStyle(
                              color: CustomColors.customContrastColor,
                            )),
                      ),
                    ),

                    // Signin Submit Button
                    SizedBox(
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context)
                              .pushReplacement(MaterialPageRoute(builder: (c) {
                            return BaseScreen();
                          }));
                        },
                        child: const Text(
                          'Entrar',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),

                    // Divider
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 18),
                      child: Row(
                        children: [
                          Expanded(
                            child: Divider(
                              color: Colors.grey.withAlpha(90),
                              thickness: 2,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 15,
                            ),
                            child: Text('ou'),
                          ),
                          Expanded(
                            child: Divider(
                              color: Colors.grey.withAlpha(90),
                              thickness: 2,
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Signup Button
                    SizedBox(
                      height: 50,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          side: const BorderSide(
                            width: 1.5,
                            color: Colors.green,
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (c) {
                            return SignUpScreen();
                          }));
                        },
                        child: const Text('Criar conta'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
