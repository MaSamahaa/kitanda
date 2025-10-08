import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:kitanda/src/pages/auth/components/custom_text_field.dart';
import 'package:kitanda/src/pages/auth/sign_up_screen.dart';
import 'package:kitanda/src/pages/base/base_screen.dart';
import 'package:kitanda/src/config/custom_colors.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.primaryColor,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Column(
                    children: [
                      // Topo
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Nome app
                            const Text.rich(
                              TextSpan(
                                style: TextStyle(fontSize: 40),
                                children: [
                                  TextSpan(
                                    text: 'Ki',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'Tanda',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // Animação
                            Center(
                              child: SizedBox(
                                height: 30,
                                child: DefaultTextStyle(
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w200,
                                    color: Colors.black,
                                  ),
                                  child: AnimatedTextKit(
                                    animatedTexts: [
                                      TypewriterAnimatedText(
                                        'Orgânicos',
                                        speed:
                                            const Duration(milliseconds: 120),
                                      ),
                                      TypewriterAnimatedText(
                                        'Açougue',
                                        speed:
                                            const Duration(milliseconds: 120),
                                      ),
                                      TypewriterAnimatedText(
                                        'Padaria',
                                        speed:
                                            const Duration(milliseconds: 120),
                                      ),
                                      TypewriterAnimatedText(
                                        'Tudo que você precisa :)',
                                        speed:
                                            const Duration(milliseconds: 160),
                                      ),
                                    ],
                                    isRepeatingAnimation: true,
                                    pause: Duration.zero,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Forms
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 32,
                          vertical: 40,
                        ),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(45),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            const CustomTextField(
                              icon: Icons.email,
                              label: 'Email',
                            ),
                            const CustomTextField(
                              icon: Icons.lock,
                              label: 'Senha',
                              isSecret: true,
                            ),
                            const SizedBox(height: 8),
                            SizedBox(
                              height: 50,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: CustomColors.primaryColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18),
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                      builder: (c) {
                                        return const BaseScreen();
                                      },
                                    ),
                                  );
                                },
                                child: const Text(
                                  'Entrar',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: TextButton(
                                onPressed: () {},
                                child: const Text(
                                  'Esqueceu a senha?',
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Divider(
                                      color: Colors.grey.withAlpha(90),
                                      thickness: 2,
                                    ),
                                  ),
                                  const Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 15.0),
                                    child: Text('Ou'),
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
                            SizedBox(
                              height: 50,
                              child: OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18),
                                  ),
                                  side: BorderSide(
                                    width: 2,
                                    color: CustomColors.primaryColor,
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(builder: (c) {
                                      return SignUpScreen();
                                    }),
                                  );
                                },
                                child: const Text(
                                  'Criar conta',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                  ),
                                ),
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
          },
        ),
      ),
    );
  }
}
