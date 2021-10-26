import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rhinopizzaria/providers/auth_provider.dart';
import 'package:rhinopizzaria/screens/product_screen/product_screen.dart';

class SignUpBody extends StatelessWidget {
  String _password = '';
  String _email = '';
  bool _sucre = true;

  void getPassword(String password) {
    _password = password;
  }

  void getEmail(String email) {
    _email = email;
  }

  @override
  Widget build(BuildContext context) {
    var isLoading = context.watch<AuthProvider>().isLoading;
    return isLoading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : SafeArea(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Form(
                //   key: _globalKey,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    emailTextField(),
                    const SizedBox(
                      height: 10,
                    ),
                    passwordTextField(),
                    const SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          context
                              .read<AuthProvider>()
                              .signUpUser(_email, _password, true);

                          Navigator.pushNamed(context, ProductScreen.namedRout);
                        },
                        child: Text(" SIGN UP"))
                  ],
                ),
              ),
            ),
          );
  }

  Widget passwordTextField() {
    return TextFormField(
      onChanged: getPassword,
      obscureText: _sucre,
      validator: (value) {
        if (value!.isEmpty) {
          return " please enter a password";
        } else if (value.length < 4) {
          return "please enter valid password";
        } else {
          return null;
        }
      },
      // onSaved: (value) => setState(() => _password = value!),
      decoration: InputDecoration(
        suffixIcon: IconButton(
          onPressed: () {
            // setState(() {
            //   _sucre = !_sucre;
            // });
          },
          icon: Icon(_sucre ? Icons.visibility : Icons.visibility_off),
        ),
        labelText: "Enter password",
        filled: false,
        fillColor: Colors.grey[300],
        prefixIcon: Icon(Icons.lock),
        // enabledBorder: OutlineInputBorder(
        //   borderSide: BorderSide(color: Colors.transparent),
        //   borderRadius: BorderRadius.circular(10.0),
        // ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue),
          borderRadius: BorderRadius.circular(10.0),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(10.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  } //password Widget

  Widget emailTextField() {
    return TextFormField(
      onChanged: getEmail,
      validator: (value) {
        if (value!.isEmpty) {
          return " please enter a email";
        } else if (value.length < 4) {
          return "please enter valid email";
        } else {
          return null;
        }
      },
      onSaved: (value) => getEmail,
      decoration: InputDecoration(
        labelText: " Email",
        filled: false,
        fillColor: Colors.grey[300],
        prefixIcon: Icon(Icons.email_outlined),
        // enabledBorder: OutlineInputBorder(
        //   borderSide: BorderSide(color: Colors.transparent),
        //   borderRadius: BorderRadius.circular(10.0),
        // ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue),
          borderRadius: BorderRadius.circular(10.0),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(10.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  } // Email Text Field
}
