import 'package:flutter/material.dart';
import 'package:memoneet_task/constants/app_text_style.dart';
import 'package:memoneet_task/features/signup/view/sign_up_page.dart';
import 'package:memoneet_task/utils/input_validator.dart';
import 'package:memoneet_task/widgets/app_password_field.dart';
import 'package:memoneet_task/widgets/app_text_field.dart';
import 'package:memoneet_task/widgets/buttons/primary_button.dart';
import 'package:provider/provider.dart';

import '../provider/sigin_in_provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 100,
                    ),
                    AppTexts.heading2(text: 'Login'),
                    const SizedBox(
                      height: 5,
                    ),
                    AppTexts.heading3(text: 'Login to enhance knowledge'),
                    const SizedBox(
                      height: 30,
                    ),
                    AppTextFormField(
                      prefixIcon: Icons.email,
                      controller: _emailController,
                      hintText: 'Enter email',
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    AppPasswordField(
                      validator: (value) =>
                          InputValidator.validatePassword(value!),
                      prefixIcon: Icons.password_outlined,
                      controller: _passwordController,
                      hintText: 'Enter password',
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Consumer<SignInProvider>(
                      builder: (context, ref, child) => PrimaryButton(
                        size: const Size(double.infinity, 25),
                        child: ref.isLoading
                            ? const CircularProgressIndicator()
                            : const Text('Login'),
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            await ref.loginUser(context, _emailController.text,
                                _passwordController.text);
                          }
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignUpPage(),
                          ),
                        );
                      },
                      child: const Text("Don't have account?"),
                    ),
                    AppTexts.heading4(text: 'or continue with'),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                            onPressed: () {}, icon: const Icon(Icons.facebook)),
                        IconButton(
                            onPressed: () {}, icon: const Icon(Icons.apple)),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
