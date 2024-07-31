import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:africanstraw/widgets/route.dart';
import 'package:provider/provider.dart';
import '../components/forgot_password.dart';
import '../components/global.dart';
import '../components/login_field.dart';
import '../components/social_button.dart';
import '../constanst.dart';
import '../controller/controller.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final formskey=GlobalKey<FormState>();
  bool validator(){
    return formskey.currentState!.validate();

  }
  TextEditingController email=TextEditingController();
  TextEditingController password=TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Consumer<Ecom>(
        builder: (BuildContext context, Ecom value, Widget? child){
          return Scaffold(
            body: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(
                    maxWidth: 550,
                    maxHeight: 600
                ),
                child: Card(
                  elevation: 2,
                  child: Container(
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Form(
                        key: formskey,
                        child: ListView(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(Companydata.companyname,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 50,),
                            LoginField(hintText: 'Email',controller: email,textInputType: TextInputType.name,obscure: false, labelText: 'Email', enabled: true,),
                            const SizedBox(height: 15,),
                            LoginField(hintText: 'Password',controller:password ,textInputType: TextInputType.visiblePassword,obscure: false, labelText: 'Password', enabled: true,),
                            const SizedBox(height: 15,),
                            const ForgotPasText(),
                            const SizedBox(height: 20,),
                            Container(
                              decoration: BoxDecoration(
                                  color: Global.borderColor,
                                  borderRadius: BorderRadius.circular(7)
                              ),
                              child: ElevatedButton(
                                onPressed: () async{
                                  validator() ;

                                  String email_txt=email.text.trim();
                                  String password_txt=password.text.trim();
                                  final progress=ProgressHUD.of(context);
                                  progress!.show();
                                  await value.loginwithemail(email_txt, password_txt);
                                  print(value.error);
                                  progress!.dismiss();
                                  Navigator.pop(context);

                                },
                                style: ElevatedButton.styleFrom(
                                  fixedSize: const Size(395, 55),
                                  backgroundColor: Colors.transparent,
                                  shadowColor: Colors.transparent,
                                ),
                                child: const Text(
                                  'Sign in',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 17,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 15,),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '- Or continue with -',
                                  style: TextStyle(
                                    fontSize: 17,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 15),
                            FittedBox(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [

                                  Container(
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                    ),
                                    width: 360,
                                    child: SocialButton(
                                        iconPath: 'assets/svg/glogo.svg',
                                        label: 'Google Login', horizontalPadding: 20,
                                        onPressed: ()async{
                                          final hh=await value.signInWithGoogles(context: context);
                                          if(hh!=null){
                                            SnackBar snackbar=SnackBar(content: Text("Hello,${hh.displayName}, Login Success"));
                                            ScaffoldMessenger.of(context).showSnackBar(snackbar);
                                          }
                                          // print(hh);
                                        }
                                    ),
                                  ),

                                ],
                              )

                            ),
                            const SizedBox(height: 15),
                            ConstrainedBox(
                              constraints: const BoxConstraints(
                                maxWidth: 400,
                              ),
                              child:  Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    'Don\'t have an account?',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),
                                  InkWell(
                                    onTap: (){
                                      Navigator.pushNamed(context, Routes.signup);
                                    },
                                    child: const Text(
                                      ' Sign Up',
                                      style: TextStyle(
                                        color: Global.gradient3,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
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
    );
  }
}
