import 'package:client_portal/provider/auth_provider.dart';
import 'package:client_portal/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool isObscure = true;
  bool isLoading = false;

  TextEditingController usernameController = TextEditingController(text: '');
  TextEditingController passwordController = TextEditingController(text: '');

  void _ObscureTogle() {
    setState(() {
      isObscure = !isObscure;
    });
  }

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    handleSignIn() async {
      setState(() {
        isLoading = true;
      });

      if (await authProvider.login(
          username: usernameController.text,
          password: passwordController.text)) {
        Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.red,
            content: Text(
              'Failed to login',
              textAlign: TextAlign.center,
            ),
          ),
        );
      }
      setState(() {
        isLoading = false;
      });
    }

    Widget headerContent() {
      return Column(
        children: [
          Image.asset(
            "assets/sign_in_image.png",
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "Stay Connected, Stay Informed",
            style: primaryTextStyle.copyWith(
              color: primaryColor,
              fontWeight: bold,
              fontSize: 18,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              "Login to Monitor Your Project Progress with WebCare",
              textAlign: TextAlign.center,
              style: primaryTextStyle.copyWith(
                color: blackColor,
                fontWeight: semibold,
                fontSize: 14,
              ),
            ),
          ),
        ],
      );
    }

    Widget formSignIn() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Username",
            style: primaryTextStyle.copyWith(
              fontSize: 12,
              fontWeight: bold,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: usernameController,
            style: primaryTextStyle.copyWith(
              fontWeight: medium,
              fontSize: 16,
            ),
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 14,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  width: 1.8,
                  color: primaryColor,
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            onChanged: (value) {
              // do something
            },
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            "Password",
            style: primaryTextStyle.copyWith(
              fontSize: 12,
              fontWeight: bold,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: passwordController,
            style: primaryTextStyle.copyWith(
              fontWeight: medium,
              fontSize: 16,
            ),
            obscureText: isObscure,
            decoration: InputDecoration(
              suffixIcon: Padding(
                padding: const EdgeInsets.only(
                  right: 5,
                ),
                child: GestureDetector(
                  onTap: _ObscureTogle,
                  child: isObscure
                      ? const Icon(
                          Icons.visibility,
                        )
                      : const Icon(
                          Icons.visibility_off,
                        ),
                ),
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 14,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  width: 1.8,
                  color: primaryColor,
                ),
              ),
            ),
            onChanged: (value) {
              // do something
            },
          ),
          const SizedBox(
            height: 40,
          ),
          Container(
            decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                      color: Colors.black26,
                      offset: Offset(0, 2),
                      blurRadius: 4.0)
                ],
                gradient: const LinearGradient(
                  begin: Alignment(-1.0, 0.0),
                  end: Alignment(1.0, 0.0),
                  transform: GradientRotation(91 *
                      (3.1415926535 /
                          180)), // Rotasi gradient sesuai dengan sudut 91deg
                  colors: [
                    Color.fromRGBO(0, 20, 198, 0.70),
                    Color.fromRGBO(3, 104, 251, 0.70),
                  ],
                  stops: [0.0402, 1.0],
                ),
                color: isLoading ? Colors.transparent : primaryColor,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: whiteColor,
                  width: 1.5,
                )),
            child: ElevatedButton(
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                minimumSize:
                    MaterialStateProperty.all(const Size(double.infinity, 50)),
                backgroundColor: MaterialStateProperty.all(Colors.transparent),
                // elevation: MaterialStateProperty.all(3),
                shadowColor: MaterialStateProperty.all(Colors.transparent),
              ),
              onPressed: handleSignIn,
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 10,
                  bottom: 10,
                ),
                child: isLoading
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 10),
                            height: 14,
                            width: 14,
                            child: CircularProgressIndicator(
                              strokeWidth: 4,
                              // color: whiteColor,
                            ),
                          ),
                          Text(
                            'LOADING',
                            style: primaryTextStyle.copyWith(
                              fontSize: 18,
                              fontWeight: bold,
                              // color: whiteColor,
                            ),
                          ),
                        ],
                      )
                    : Text(
                        "LOGIN",
                        style: primaryTextStyle.copyWith(
                          fontSize: 18,
                          fontWeight: bold,
                          color: Colors.white,
                        ),
                      ),
              ),
            ),
          ),
        ],
      );
    }

    Widget forgotPassword() {
      return Center(
        widthFactor: double.infinity,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Forgot Password?",
                style: primaryTextStyle.copyWith(
                  color: primaryTextColor.withOpacity(0.7),
                  fontWeight: semibold,
                  fontSize: 12,
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                "Contact Admin",
                style: primaryTextStyle.copyWith(
                  fontWeight: semibold,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      body: Container(
        height: double.infinity,
        margin: const EdgeInsets.symmetric(
          horizontal: 25,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(
              height: 5,
            ),
            Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                headerContent(),
                const SizedBox(
                  height: 33,
                ),
                formSignIn(),
              ],
            ),
            forgotPassword(),
          ],
        ),
      ),
    );
  }
}
