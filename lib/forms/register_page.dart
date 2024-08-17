import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:africanstraw/widgets/route.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:provider/provider.dart';

import '../components/global.dart';
import '../components/login_field.dart';
import '../constanst.dart';
import '../controller/controller.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final formskey=GlobalKey<FormState>();
  bool validator(){
    return formskey.currentState!.validate();

  }
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController firstname = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController contact = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return ProgressHUD(
          child: Scaffold(
            body: Consumer<Ecom>(
                builder: (context,value, Widget? child){
                  bool emailedit=true;
                  bool fnameedit=true;
                  bool lnameedit=true;
                  bool passwordedit=true;
                  if(value.auth.currentUser!=null){
                    email.text=value.auth.currentUser!.email!;
                    firstname.text=value.user_firstname!;
                    lastname.text=value.user_lastname!;
                    username.text=value.auth.currentUser!.displayName!;
                    emailedit=false;
                    fnameedit=false;
                    lnameedit=false;
                    passwordedit=false;
                  }
                  return Center(
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(
                          maxWidth: 550,
                          maxHeight: 700
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
                                  const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("SIGN UP",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 25,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 30,),
                                  LoginField(
                                    hintText: 'First Name',
                                    controller: firstname,
                                    textInputType: TextInputType.name,
                                    obscure: false,
                                    labelText: 'First Name', enabled: true,

                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  LoginField(
                                    hintText: 'Last Name',
                                    controller: lastname,
                                    textInputType: TextInputType.name,
                                    obscure: false,
                                    labelText: 'Last Name', enabled: true,
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  LoginField(
                                    hintText: 'User Name',
                                    controller: username,
                                    textInputType: TextInputType.name,
                                    obscure: false,
                                    labelText: 'UserName', enabled: true,
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  LoginField(
                                    hintText: 'Email',
                                    controller: email,
                                    textInputType: TextInputType.emailAddress,
                                    obscure: false,
                                    labelText: 'Email', enabled: emailedit,
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  LoginField(
                                    hintText: 'Phone',
                                    controller: contact,
                                    textInputType: TextInputType.phone,
                                    obscure: false,
                                    labelText: 'Phone', enabled: true,
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Visibility(
                                    visible: passwordedit,
                                    child: LoginField(
                                      hintText: 'Password',
                                      controller: password,
                                      textInputType: TextInputType.visiblePassword,
                                      obscure: true,
                                      labelText: 'Password', enabled: true,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  InkWell(
                                    onTap: ()async{
                                      try{
                                        if(validator())
                                        {
                                          final progress=ProgressHUD.of(context);
                                          progress!.show();
                                          String email_txt = email.text.trim();
                                          String password_txt = password.text.trim();
                                          String firstnname_txt = firstname.text.trim();
                                          String lastname_txt = lastname.text.trim();
                                          String username_txt = username.text.trim();
                                          String contact_txt = contact.text.trim();
                                          String sex = "Male";
                                          await value.signupwithemail(firstnname_txt, lastname_txt, username_txt, contact_txt, sex, email_txt, password_txt,context);
                                          progress.dismiss();

                                        }

                                      }catch(e){
                                        print(e);

                                      }
                                    },
                                    child: Container(
                                      height: 40,
                                      decoration: BoxDecoration(
                                          color: Global.borderColor,
                                          borderRadius: BorderRadius.circular(6)
                                      ),
                                      child: Center(
                                        child: const Text(
                                          'Create Account',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 15,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Text(
                                        'Already have an account?',
                                        style: TextStyle(
                                            fontSize: 14, fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(width: 4),
                                      InkWell(
                                        onTap: () {
                                          Navigator.pushNamed(context, Routes.login);
                                        },
                                        child: const Text(
                                          ' Sign In',
                                          style: TextStyle(
                                            color: Global.gradient3,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }
            ),
          ),
        );
      }
    );
  }
}
