import 'package:flutter/material.dart';
import 'package:kitanda/src/auth/components/custom_text_field.dart';
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
                        children: [
                          const Expanded(
                            child: Center(
                              child: Text(
                                'Cadastro',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 35,
                                ),
                              ),
                            ),
                          ),
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
