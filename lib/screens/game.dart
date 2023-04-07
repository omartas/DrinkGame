
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import '../player.dart';

class Game extends StatefulWidget {
  final List <Player> list ;
  const Game({Key? key, required this.list}) : super(key: key);


  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {

  StreamController<int> selected = StreamController<int>();
  @override
  void dispose() {
    selected.close();
    super.dispose();
  }

  late var streamm=selected.stream;
  final List items=[] ;

  List <String> genelSorular=[
      "En güzel olan 2 yudum içsin",
      "Çiçek almak tatlı mı klişe mi ? Azınlık grup 3 yudum lıkırdatsın",
      "En erken kim milli oldu ?",
      "En esmer kişi kimin 2 yudum içeceğini seçiyor."];

    List <String> kisiselSorular=[
      "3 takla atmalısın yapamazsan 3 yudum al.",
      "seçtiğin biriyle 5 edepsiz saniye geçireceksin, yoksa 3 yudum shot",
      "Bu odada yatağa atmak istediğin her kişi için lıkırdat",
      "15 saniye içinde 4 seks pozisyonu say, yoksa 2 yudum al",
      "Bir kural koyabilirsin",
      "E harfiyle başlayan 5 ünlü say",
      "Kimler senden daha büyük? Onlar 3 kez lıkırdatsın"
    ];


  @override
  int sayac =0;
  var a,b;
  Widget build(BuildContext context) {
    var oyuncular = widget.list.forEach((element) {
      if(sayac==0){
        items.add(element.isim);
      }
    });
    sayac++;
    return Scaffold(
      backgroundColor: Colors.purple[600],
      appBar: AppBar(
        title: Text('Flutter Fortune Wheel'),
      ),
      body: GestureDetector(
        onTap: () async {
          setState(() {
            a =Fortune.randomInt(0, items.length);
            b =Fortune.randomInt(0, kisiselSorular.length);
            selected.add(a);
            print(a);

          });
          await Future.delayed(Duration(milliseconds: 5400));
          _showMyDialog(items[a].toString(),kisiselSorular[b].toString());
        },

        child: Column(
          children: [
            Expanded(
              child: FortuneWheel(
                selected: streamm,
                items: [
                  for (var it in items) FortuneItem(child: Text(it)),
                ],
              ),
            ),
          ],
        ),
      ),
    );

  }
  Future<void> _showMyDialog(String secilmis,String gorev) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("$secilmis bu görev sana"),
          content: SingleChildScrollView(
            child: ListBody(
              children:  <Widget>[
                Text(gorev),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Tamamdır.'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}


