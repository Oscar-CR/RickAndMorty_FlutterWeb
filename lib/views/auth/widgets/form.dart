
import 'package:flutter/material.dart';
import 'package:rickandmorty_app/services/api_firebase.dart';
import 'package:rickandmorty_app/widgets/separator.dart';

class FormLoginWidget extends StatefulWidget {
  const FormLoginWidget({super.key});

  @override
  State<FormLoginWidget> createState() => _FormLoginWidgetState();
}

class _FormLoginWidgetState extends State<FormLoginWidget> {
final _formKey = GlobalKey<FormState>();
final TextEditingController _userController = TextEditingController();
final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: SizedBox(
        width: screenSize.width,  
       
        child: Padding(
          padding: const EdgeInsets.all(92),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Log In', style: TextStyle(color: Colors.white, fontSize: 64)),
              Text('Por favor ingresa tu nombre de usuario y contraseña', style: TextStyle(color: Colors.white,fontSize: 24)),
              SeparatorWidget(size: 72),


              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextField(
                      controller: _userController,
                      style: TextStyle(color: Colors.white), 
                      decoration: InputDecoration(
                        hintText: 'Usuario',
                        hintStyle: TextStyle(color: Colors.white60), 
                        contentPadding: const EdgeInsets.symmetric(vertical: 28, horizontal: 20),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40),
                          borderSide: BorderSide(color: Colors.white, width: 2), 
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40),
                          borderSide: BorderSide(color: Colors.white, width: 2), 
                        ),
                      ),
                    ),
                    SeparatorWidget(size: 32),
                    TextField(
                      controller: _passwordController,
                      style: TextStyle(color: Colors.white), 
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: 'Contraseña',
                        hintStyle: TextStyle(color: Colors.white60), 
                        contentPadding: const EdgeInsets.symmetric(vertical: 28, horizontal: 20),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(color: Colors.white, width: 2), 
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(color: Colors.white, width: 2),
                        ),
                      ),
                    ),
                   

                    SeparatorWidget(size: 64),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () async{
                        await loginFirebase(context, _userController.text, _passwordController.text);
                        
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 40),
                        ),
                        child: const Text('Log In', style: TextStyle(fontSize: 32),),
                      ),
                    ),

                  ],
                ),
              ),

              
              SeparatorWidget(size: 32),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    await loginWithGoogleWeb(); 
              
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 40),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      
                      SizedBox(
                        width: 32,
                        child: Image.asset('lib/assets/google.png'), 
                        ),
                        Padding(padding: EdgeInsets.only(left: 16)),
                      const Text(
                        'Sign in with Google',
                        style: TextStyle(fontSize: 32),
                      ),
                    ],
                  ),
                ),
              )

            ],
          ),
        )
      ),
    );
  }
}