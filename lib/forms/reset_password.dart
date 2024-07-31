import 'package:flutter/material.dart';

import '../components/global.dart';
import '../components/login_field.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final formskey=GlobalKey<FormState>();
  bool validator(){
    return formskey.currentState!.validate();

  }

  TextEditingController email=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
              maxWidth: 500,
              maxHeight: 300
          ),
          child: Card(
            elevation: 1,
            child: Container(
              color: Colors.white70,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: formskey,
                  child: ListView(
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("Reset Password",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      const Text("Enter your registered email address"),
                      const SizedBox(height: 30,),
                      LoginField(hintText: 'Email',controller: email,textInputType: TextInputType.name,obscure: false, labelText: 'Email', enabled: true,),
                      const SizedBox(height: 20,),
                      Container(
                        decoration: BoxDecoration(
                            color: Global.mainColor,
                            borderRadius: BorderRadius.circular(7)
                        ),
                        child: ElevatedButton(
                          onPressed: () {
                            validator() ;
                          },
                          style: ElevatedButton.styleFrom(
                            fixedSize: const Size(395, 50),
                            backgroundColor: Colors.transparent,
                            shadowColor: Colors.transparent,
                          ),
                          child: const Text(
                            'Reset Password',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 17,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
