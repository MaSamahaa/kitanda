import 'package:flutter/material.dart';
import 'package:kitanda/src/auth/components/custom_text_field.dart';
import 'package:kitanda/src/config/custom_colors.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.primaryColor,
      body: Column(
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
          // Forms
          Expanded(
            flex: 2,
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(45)),
              ),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 32, vertical: 24),
                      child: ConstrainedBox(
                        constraints:
                            BoxConstraints(minHeight: constraints.maxHeight),
                        child: IntrinsicHeight(
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      const SizedBox(
                                        height: 30,
                                      ),
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
                                      const CustomTextField(
                                        icon: Icons.phone,
                                        label: 'Celular',
                                      ),
                                      const CustomTextField(
                                        icon: Icons.file_copy_rounded,
                                        label: 'CPF',
                                      ),
                                      const SizedBox(height: 16),
                                      SizedBox(
                                        height: 50,
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                CustomColors.primaryColor,
                                            shape: const RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(18)),
                                            ),
                                          ),
                                          onPressed: () {},
                                          child: const Text(
                                            'Criar conta',
                                            style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ]),
                              ]),
                        ),
                      ));
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
