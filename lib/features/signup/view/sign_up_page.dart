import 'package:flutter/material.dart';
import 'package:memoneet_task/constants/app_text_style.dart';
import 'package:memoneet_task/features/signup/provider/sign_up_provider.dart';
import 'package:memoneet_task/utils/input_validator.dart';
import 'package:memoneet_task/widgets/app_password_field.dart';
import 'package:memoneet_task/widgets/app_text_field.dart';
import 'package:memoneet_task/widgets/buttons/primary_button.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 100,
                  ),
                  AppTexts.heading2(text: 'Create Account'),
                  const SizedBox(
                    height: 5,
                  ),
                  AppTexts.heading3(
                      text: 'Create account to inhance knowledge'),
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
                    height: 20,
                  ),
                  AppPasswordField(
                    validator: (value) => InputValidator.confirmPassword(
                        value!, _passwordController.text),
                    prefixIcon: Icons.password_outlined,
                    controller: _confirmPasswordController,
                    hintText: 'Confirm password',
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Consumer<SignUpProvider>(
                    builder: (context, ref, child) => PrimaryButton(
                      size: const Size(double.infinity, 25),
                      child: ref.isLoading
                          ? const CircularProgressIndicator()
                          : const Text('Register'),
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          await ref.registerUser(context, _emailController.text,
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
                      Navigator.pop(context);
                    },
                    child: const Text('Already have account?'),
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
    );
  }
}
