import 'package:flutter/material.dart';

class ImageLoginWidget extends StatelessWidget {
  const ImageLoginWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    
    return SizedBox(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(64),
          child: Image.asset(
            width: screenSize.width,
            'lib/assets/LoginContainer.png', 
            fit: BoxFit.contain, 
          ),
        ),
      ),
    );
  }
}