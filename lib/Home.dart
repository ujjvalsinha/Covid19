import 'package:covod19/Cases.dart';
import 'package:covod19/Safety.dart';
import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
 void changeBrightness() {
    DynamicTheme.of(context).setBrightness(
        Theme.of(context).brightness == Brightness.dark
            ? Brightness.light
            : Brightness.dark);
  }
var a=1;
  Widget design(img, hgt, wdh, id) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: GestureDetector(
        onTap: () {
          perform(id);
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(25),
          child: Image.asset(
            img,
            height: hgt,
            width: wdh,
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }

  Widget design1(
    img,
    hgt,
    wdh,
  ) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: Image.asset(
          img,
          height: hgt,
          width: wdh,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  perform(id) {
    switch (id) {
      case "safety":
        {
          print("safety pressed");
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Safety(),
            ),
          );
          break;
        }

      case "number":
        {
          print("calling");
          launch("tel://01123978046");
          break;
        }
      case "cases":
        {
          print("cases pressed");
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Cases(),
            ),
          );
          break;
        }
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xFF090E14),
      appBar: AppBar(
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: GestureDetector(
              onTap: () {
                print("jvgcfzdfobject");
                    changeBrightness();              },
              child: CircleAvatar(
                backgroundColor: Color(0xFF1C2533),
                child: Icon(
                  Icons.brightness_2,
                  size: 30,
                ),
              ),
            ),
          )
        ],
        
        toolbarOpacity: .6,
        iconTheme: new IconThemeData(color: Colors.white),
        backgroundColor: Color(0xFF1C2533),
        title: Text("COVID 19",style: TextStyle(color: Color(0xFFD3D3D3)),),
      ),
      body: SingleChildScrollView(
        child: Container(
            child: Column(
          children: <Widget>[
            Container(
              height: size.height * .38,
              child: Image.asset(
                "images/earth.png",
                fit: BoxFit.cover,
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 24),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
               color: Theme.of(context).brightness == Brightness.dark?Color(0xFF1C2533):Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  design1("images/goaway.png", 101.0, 402.0),
                  design("images/safety.png", 154.0, 391.0, "safety"),
                  design("images/cases.png", 154.0, 391.0, "cases"),
                  design("images/callus.png", 154.0, 391.0, "number"),
                  design("images/mask.jpg", 291.0, 391.0, "4"),
                  design("images/corona.png", 291.0, 391.0, "5"),
                  SizedBox(
                    height: 18,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Text("COVOD 19",style: TextStyle(decoration: TextDecoration.underline,),),
                  ),
                  Text("Version - 4.0.1"),
                  Padding(
                    padding: const EdgeInsets.only(bottom:18.0,top:4),
                    child: Text("Created by Ujjval Sinha",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                  )
                ],
              ),
            )
          ],
        )),
      ),
    );
  }
}
