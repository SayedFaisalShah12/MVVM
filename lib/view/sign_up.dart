import 'package:flutter/material.dart';
import 'package:mvvm/resources/components/round_button.dart';
import 'package:mvvm/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';
import '../utils/routes/routes_names.dart';
import '../utils/utils.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  ValueNotifier<bool> obsecurePassword = ValueNotifier<bool>(true);

  TextEditingController NameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();

    emailFocusNode.dispose();
    passwordFocusNode.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final authViewMode = Provider.of<AuthViewModel>(context);
    final height = MediaQuery.of(context).size.height * 1;
    final width = MediaQuery.of(context).size.width * 1;

    return  Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up', style: TextStyle(color: Colors.white),),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              focusNode: emailFocusNode,
              decoration: const InputDecoration(
                hintText: 'Email',
                labelText: 'Email',
                icon: Icon(Icons.email),
              ),
              onFieldSubmitted: (val){
                Utils.fieldFocusChange(context, emailFocusNode, passwordFocusNode);
              },
            ),
            const SizedBox(height: 30,),
            ValueListenableBuilder(valueListenable: obsecurePassword,
                builder: (context, value, child){
                  return TextFormField(
                    controller: passwordController,
                    focusNode: passwordFocusNode,
                    obscureText: obsecurePassword.value,
                    decoration:  InputDecoration(
                      hintText: 'Password',
                      labelText: 'Password',
                      icon: Icon(Icons.password),
                      suffixIcon: InkWell(
                          onTap: (){
                            obsecurePassword.value = !obsecurePassword.value ;
                          },
                          child: Icon(obsecurePassword.value==true ? Icons.visibility_off_outlined : Icons.visibility)),
                    ),
                  );
                }
            ),
            const SizedBox(height: 30,),
            RoundButton(title: 'Sign Up', onPress: (){
              if(emailController.text.isEmpty || passwordController.text.isEmpty){
                Utils.flushBarErrorMessage('Please Fill the Form Completely', context);
              }
              else{
                Map data = {
                  'email': emailController.text.toString(),
                  'password': passwordController.text.toString(),
                };
                authViewMode.registerApi(data, context);
                print("Api Hit");
              }
            }
            ),
            const SizedBox(height: 30,),
            InkWell(
              onTap: (){
                Navigator.pushNamed(context, RouteName.login);
              },
              child: const Text("Already have an account",),
            ),

          ],
        ),
      ),
    );
  }
}
