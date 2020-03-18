import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Safety extends StatefulWidget {
  @override
  _SafetyState createState() => _SafetyState();
}

class _SafetyState extends State<Safety> {
  String maskURL =
      "https://www.who.int/emergencies/diseases/novel-coronavirus-2019/advice-for-public/when-and-how-to-use-masks";
  String mythURL =
      "https://www.who.int/emergencies/diseases/novel-coronavirus-2019/advice-for-public/myth-busters";
  String worker =
      "https://www.who.int/emergencies/diseases/novel-coronavirus-2019/advice-for-public";
  String ready = "https://time.com/5801507/coronavirus-india/";
  launchURL(lounch) async {
    String url = lounch;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Widget topics(txt, lounch) {
    return GestureDetector(
      onTap: () {
        launchURL(lounch);
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 18, left: 18, right: 18),
        child: Container(
            decoration: BoxDecoration(
                border: Border.all(color: Theme.of(context).brightness == Brightness.dark?Color(0xFFD3D3D3):Color(0xFF282828),),
                borderRadius: BorderRadius.circular(15)),
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: CircleAvatar(
                    radius: 8,
                    backgroundColor: Colors.black,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    txt,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                
              ],
            )),
      ),
    );
  }

  Widget circle() {
    return CircleAvatar(
      radius: 20,
      backgroundColor: Colors.black,
    );
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
              "images/doctor.png",
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Text(
              "Safety  And Health Tips",
              style: TextStyle(
                  decoration: TextDecoration.underline,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                topics("When and how to use mask  ---->", maskURL),
                topics("Myth-buster   ---->", mythURL),
                topics("Advice for health workers.  ---->", worker),
                topics("Getting workplace ready  ---->", ready),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
