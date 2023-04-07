import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:untitled4/screens/playerscreen.dart';
import 'package:untitled4/screens/rules.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var yenistyle = GoogleFonts.aladin(
      fontSize: 45, fontWeight: FontWeight.bold,);
    return Scaffold(
        backgroundColor: Colors.purple[600],
        body: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 70,),
                FlutterLogo(size: 80,),
                SizedBox(height: 50,),
                Text("SHOTLA", style:yenistyle ,),
                SizedBox(height: 30,),
                TextButton(onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => PlayerScreen()));
                }, child: Text("Oyna",style: yenistyle)),
                SizedBox(height: 30,),
                TextButton(onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Kurallar()),
                  );
                }, child: Text("KURALLAR",style: yenistyle)),
              ],
            ),
          ],
        )
    );
  }
}