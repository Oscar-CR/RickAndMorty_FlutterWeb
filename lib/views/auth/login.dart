import 'package:flutter/material.dart';
import 'package:rickandmorty_app/utils/constants.dart';
import 'package:rickandmorty_app/views/auth/widgets/form.dart';
import 'package:rickandmorty_app/widgets/web/web_image_login.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  LoginState createState() => LoginState();
}

class LoginState extends State<LoginPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: ColorConstants.darkColor,
        width: double.infinity,
        child: 
        Row(
          children: [
            Expanded(
              flex: 1,  
              child:ImageLoginWidget()
            ),
            Expanded(
              flex: 1, 
              child: FormLoginWidget()
            ),
          ],
        )
      ),
    );
  }

}

