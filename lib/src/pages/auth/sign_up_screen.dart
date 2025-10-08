import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:kitanda/src/pages/auth/components/custom_text_field.dart';
import 'package:kitanda/src/config/custom_colors.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final cpfFormatter = MaskTextInputFormatter(
    mask: '###.###.###-##',
    filter: {
      '#': RegExp(r'[0-9]'),
    },
  );
  final celFormatter = MaskTextInputFormatter(
    mask: '## # ####-####',
    filter: {
      '#': RegExp(r'[0-9]'),
    },
  );

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
                  child: Stack(
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const SizedBox(
                            height: 150,
                          ),
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
                                )
                              ],
                            ),
                          ),
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
                                    TyperAnimatedText(
                                      'Economize mais.',
                                      speed: const Duration(milliseconds: 160),
                                    ),
                                    TyperAnimatedText(
                                      'Cadastre - se...',
                                      speed: const Duration(milliseconds: 160),
                                    ),
                                  ],
                                  pause: Durations.extralong1,
                                  isRepeatingAnimation: false,
                                ),
                              ),
                            ),
                          ),
                          const Spacer(),
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
                                const CustomTextField(
                                  icon: Icons.person,
                                  label: 'Nome',
                                ),
                                CustomTextField(
                                  inputFormatters: [celFormatter],
                                  icon: Icons.phone,
                                  label: 'celular',
                                ),
                                CustomTextField(
                                  inputFormatters: [cpfFormatter],
                                  icon: Icons.file_copy,
                                  label: 'CPF',
                                ),
                                const SizedBox(height: 16),
                                SizedBox(
                                  height: 50,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                          CustomColors.primaryColor,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(18),
                                      ),
                                    ),
                                    onPressed: () {},
                                    child: const Text(
                                      'Cadastrar usuário',
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      Positioned(
                        left: 10,
                        top: 10,
                        child: SafeArea(
                          child: IconButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            icon: const Icon(
                              Icons.arrow_back_ios,
                              color: Colors.white,
                            ),
                          ),
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
