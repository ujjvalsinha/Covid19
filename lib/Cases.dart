import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Cases extends StatefulWidget {
  @override
  _CasesState createState() => _CasesState();
}

class _CasesState extends State<Cases> {
  Widget boxes1() {
    return Padding(
      padding: const EdgeInsets.only(left: 18, right: 18),
      child: Container(
        decoration: BoxDecoration(
            color: Color(0xFFB9BDF0), borderRadius: BorderRadius.circular(15)),
        height: 70,
        width: double.infinity,
        child: Center(
          child: Text(
            "1,82,000+",
            style: TextStyle(
                color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  Widget boxes2(txt, color, dth) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Container(
        decoration: BoxDecoration(
            color: Color(color), borderRadius: BorderRadius.circular(15)),
        height: 100,
        width: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              dth,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            Text(
              txt,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  launchURL() async {
    String url = "https://www.worldometers.info/coronavirus/#countries";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).brightness == Brightness.dark?Color(0xFF282828):Colors.white,
        title: Text("COVID 19",style: TextStyle(color:Theme.of(context).brightness == Brightness.dark?Color(0xFFD3D3D3):Colors.black ),),
      ),
      body: Column(
        children: <Widget>[
          Container(
            color: Colors.black,
            height: size.height * .35,
            width: double.infinity,
            child: Image.asset(
              "images/fight.jpg",
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Text(
              "Number of Cases :",
              style: TextStyle(
                  decoration: TextDecoration.underline,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
          ),
          boxes1(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              boxes2("7,100+", 0xFFFA623F, "Death"),
              boxes2("81,080+", 0xFF00D632, "Recover"),
            ],
          ),
          Container(
            margin: EdgeInsets.only(left: 18, right: 18),
            child: MaterialButton(
              height: 70,
              minWidth: double.infinity,
              color: Color(0xFFB9BDF0),
              onPressed: () {
                launchURL();
              },
              child: Text(
                "More Deatails",
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
