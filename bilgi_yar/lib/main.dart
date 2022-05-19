import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  home: HomePage(),
));

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int puan = 0;

  List sorular = [
    "Soru 1",
    "Soru 2",
    "Soru 3",
    "Soru 4",
    "Soru 5",
  ];

  List<bool>dogruCevaplar = [
    false,
    true,
    false,
    true,
    true,
  ];

  int soruNumarasi = 0;
  soruGoster(bool cevap) {
    if (soruNumarasi < sorular.length-1) {
      if (cevap == dogruCevaplar[soruNumarasi]) {
        setState(() {
          soruNumarasi++;
        });
        puan += 20;
      } else {

      }
    } else{
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => WinPage(
                score: puan,
              )));
    }
  }
  @override

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Center(child: Text(sorular[soruNumarasi])),
                height: 300,
              ),
              Spacer(),
              Align(
                alignment: Alignment.bottomCenter,
                child: Row(children: [
                  Expanded(
                    child: InkWell(
                      onTap: () => soruGoster(true),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.green
                        ),
                        height: 70,
                        child: Center(
                          child: Text(
                            "Doğru",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: InkWell(
                      onTap: () => soruGoster(false),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.red
                        ),
                        height: 70,
                        child: Center(
                          child: Text(
                            "Yanlış",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                  ),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class WinPage extends StatefulWidget {
  var score;
  WinPage({required this.score});

  @override
  State<WinPage> createState() => _WinPageState();
}

class _WinPageState extends State<WinPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Kazandın! Skorun: ${widget.score}")
          ],
        ),
      ),
    );
  }
}
