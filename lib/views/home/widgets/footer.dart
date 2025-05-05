import 'package:flutter/material.dart';
import 'package:rickandmorty_app/utils/constants.dart';

class FooterWidget extends StatefulWidget {
  const FooterWidget({super.key});

  @override
  State<FooterWidget> createState() => _FooterWidgettState();
}

class _FooterWidgettState extends State<FooterWidget> {
 
  @override
  Widget build(BuildContext context) {
    return Container(
      
      color: ColorConstants.darkColorLight,
      child: Column (
        children: [
      
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 200,
                height: 140,
                child:Image.asset('lib/assets/RickaAndMortylogo.png', fit: BoxFit.contain,) ,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(padding: EdgeInsets.only(top: 48)),
                  Text("Email", style: TextStyle(fontSize: 16, color: Colors.white,fontWeight: FontWeight.bold ),),
                  Text("notificaciones.mem@mota-engil.com",  style: TextStyle(fontSize: 16, color: Colors.white,fontWeight: FontWeight.w100 ),)
                ],
              )
            ],
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 32),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("©2024 RickandMorty", style: TextStyle(fontSize: 16, color: Colors.white,fontWeight: FontWeight.bold ),),
                Text("Aviso de Privacidad", style: TextStyle(fontSize: 16, color: Colors.white,fontWeight: FontWeight.bold ),)
              ],
            ),
          ),
          Divider()
         
        ],
      ),
    );
  }
}

