import 'package:flutter/material.dart';
import 'package:untitled4/player.dart';
import 'package:untitled4/screens/game.dart';

class PlayerScreen extends StatefulWidget {
  const PlayerScreen({Key? key}) : super(key: key);

  @override
  State<PlayerScreen> createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
  @override
  var _isimControler = TextEditingController();
  var cinsiyet;
  List<Player> liste = [];
  Color renk = Colors.blue;

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[600],
      appBar: AppBar(
        title: Text("Oyuncuları Belirleyelim !.."),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15), color: Colors.amber[800]),
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: TextField(
                        controller: _isimControler,
                        decoration:
                            InputDecoration(hintText: "Oyuncu adı giriniz"),
                      ),
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        setState(() {
                          if (renk == Colors.pink) {
                            renk = Colors.blue;
                          } else if (renk == Colors.blue) {
                            renk = Colors.pink;
                          }
                        });
                      },
                      icon: Icon(
                        Icons.transgender,
                        color: renk,
                      )),
                  SizedBox(
                    width: 8,
                  ),
                  IconButton(
                    onPressed: () {
                      if (_isimControler.text.isNotEmpty) {
                        renk == Colors.blue
                            ? cinsiyet = "erkek"
                            : cinsiyet = "kadin";
                        setState(() {
                          Player gec =
                              Player(_isimControler.text.toString(), cinsiyet);
                          liste.add(gec);
                        });
                      } else {}
                    },
                    icon: Icon(Icons.add),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              child: ListView.builder(
                  itemCount: liste.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Card(
                        elevation: 8,
                        child: ListTile(
                          title: Text(liste[index].isim.toString()),
                          tileColor: liste[index].cinsiyet == "erkek"
                              ? Colors.blue
                              : Colors.pink,
                          trailing: IconButton(
                              onPressed: () {
                                setState(() {
                                  liste.remove(liste[index]);
                                });
                              },
                              icon: Icon(Icons.remove_circle_outline)),
                        ),
                      ),
                    );
                  }),
            ),
          ),
          TextButton(
              onPressed: () {
                if (liste.length>=2) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Game(
                                list: liste,
                              )));
                }else{
                  _showMyDialog("Daha fazla arkadaşla daha eğlenceli olacak..");
                }
              },
              child: Text(
                "Başla",
                style: TextStyle(fontSize: 33, fontWeight: FontWeight.bold),
              )),
          SizedBox(
            height: 6,
          )
        ],
      ),
    );
  }
  Future<void> _showMyDialog(String a) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Bir şeyler eksik kaldı"),
          content: SingleChildScrollView(
            child: ListBody(
              children:  <Widget>[
                Text(a),
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
