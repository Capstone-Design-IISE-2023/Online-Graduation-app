import 'package:flutter/material.dart';
import 'package:online_graduation/utils/color_constant.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  var _isLoading = false;

  void _onSubmit() {
    setState(() => _isLoading = true);
    if (_formKey.currentState!.validate()) {
      Future.delayed(const Duration(milliseconds: 1000), () {
        print('Logged In');
      }).then((value) => Navigator.pushNamed(context, "/"));
    } else {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Widget inputField({
    required String hint,
    required IconData iconData,
    required TextInputType inputType,
    required TextEditingController controller,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 36,
        vertical: 8,
      ),
      child: SizedBox(
        height: 50,
        child: Material(
          elevation: 3,
          shadowColor: SHADOW_BLACK,
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(30),
          child: TextFormField(
            controller: controller,
            validator: (value) {
              if (inputType == TextInputType.emailAddress) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                } else if (!value.contains('@')) {
                  return 'Please enter your email correctly';
                }
              } else if (inputType == TextInputType.name) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                }
              } else if (inputType == TextInputType.text) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your password';
                } else if (value.length < 4) {
                  return 'Please enter your password correctly';
                }
              }
              return null;
            },
            textAlignVertical: TextAlignVertical.bottom,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: WHITE,
              hintText: hint,
              prefixIcon: Icon(iconData),
            ),
            keyboardType: TextInputType.emailAddress,
            obscureText: inputType == TextInputType.text ? true : false,
          ),
        ),
      ),
    );
  }

  Widget loginButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 16,
      ),
      child: ElevatedButton.icon(
        onPressed: _isLoading ? null : _onSubmit,
        style: ElevatedButton.styleFrom(
          backgroundColor: BLACK,
          shape: const StadiumBorder(),
          elevation: 3,
          shadowColor: SHADOW_BLACK,
        ),
        icon: _isLoading
            ? Container(
                width: 24,
                height: 24,
                padding: const EdgeInsets.all(2.0),
                child: const CircularProgressIndicator(
                  color: WHITE,
                  strokeWidth: 3,
                ),
              )
            : const Icon(
                Icons.login,
                color: WHITE,
              ),
        label: const Text(
          "Login",
          style: TextStyle(
            fontSize: 16,
            color: WHITE,
          ),
        ),
      ),
    );
  }

  Widget orDivider() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 130,
        vertical: 50,
      ),
      child: Row(
        children: [
          Flexible(
            child: Container(
              height: 0.3,
              color: SHADOW_BLACK,
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              'or',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w200,
                color: SHADOW_BLACK,
              ),
            ),
          ),
          Flexible(
            child: Container(
              height: 0.3,
              color: SHADOW_BLACK,
            ),
          )
        ],
      ),
    );
  }

  Widget appTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 60,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              fontFamily: 'PyeongChangPeace',
            ),
          ),
          const Text(
            "Get Your Own Album",
            style: TextStyle(
              fontSize: 14,
              fontFamily: 'PyeongChangPeace',
            ),
          )
        ],
      ),
    );
  }

  Widget googleLoginButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 36,
        vertical: 8,
      ),
      child: SizedBox(
        height: 50,
        child: Material(
          elevation: 3,
          shadowColor: SHADOW_BLACK,
          color: WHITE,
          borderRadius: BorderRadius.circular(30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/google_logo.png',
                height: 25,
                width: 25,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  'Login With Google',
                  style: TextStyle(
                    color: SHADOW_BLACK,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          appTitle("랜선 졸업식"),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 30,
            ),
            child: Form(
              key: _formKey,
              child: Column(children: [
                inputField(
                    hint: 'Email',
                    iconData: Icons.mail_outline,
                    inputType: TextInputType.emailAddress,
                    controller: emailController),
                inputField(
                    hint: 'Password',
                    iconData: Icons.lock_outline,
                    inputType: TextInputType.text,
                    controller: passwordController),
                loginButton(context),
                orDivider(),
                googleLoginButton(),
              ]),
            ),
          )
        ],
      ),
    );
  }
}
