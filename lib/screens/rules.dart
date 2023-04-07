import 'package:flutter/material.dart';

class Kurallar extends StatelessWidget {
  const Kurallar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: Container(
         color: Colors.red,
         child: Center(child: Text("CİDDİ OLAMAZSIN BURADA KURAL FALAN YOK.. OYUNA BAŞLA VE EĞLENMENE BAK ! !",style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold,),textWidthBasis: TextWidthBasis.longestLine,),),)
    );
  }
}
