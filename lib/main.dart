import 'package:flutter/material.dart';
import 'package:share/share.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyCustomeHomePage();
  }
}

class MyCustomeHomePage extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(10),
            // child: Image.asset('assets/images/mixed-berries.jpg',
            //     width: 600, height: 240, fit: BoxFit.cover),
            child: Image( width: 600, height: 240, fit: BoxFit.cover ,
            image: NetworkImage('https://media-cdn.tripadvisor.com/media/photo-s/0f/c9/f4/df/photo5jpg.jpg'),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(32),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: const Text(
                          "Oeschinen Lake Campground",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text(
                        "Kandersteg, Switzerland",
                        style: TextStyle(
                          color: Colors.grey[500],
                        ),
                      ),
                    ],
                  ),
                ),
                FavoriteWidget(),
              ],
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return CallScreen ();
                        }),
                      );
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.call, color: Colors.lightBlue),
                        Container(
                          margin: const EdgeInsets.only(top: 10),
                          child: Text(
                            "CALL",
                            style: TextStyle(
                              fontSize: 12.0,
                              color: Colors.lightBlue,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child:GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return RouteScreen ();
                        }),
                      );
                    },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.near_me, color: Colors.lightBlue),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: Text(
                          "ROUTE",
                          style: TextStyle(
                            fontSize: 12.0,
                            color: Colors.lightBlue,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                ),
                Expanded(
                  child:GestureDetector(
                    // onTap: (){
                    //   Navigator.push(
                    //     context,
                    //     MaterialPageRoute(builder: (context) {
                    //       return ShareScreen ();
                    //     }),
                    //   );
                    // },
                    onTap: () => share(context),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.share, color: Colors.lightBlue),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: Text(
                          "SHARE",
                          style: TextStyle(
                            fontSize: 12.0,
                            color: Colors.lightBlue,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(32.0),
            child: Text(
              'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
              'Alps. Situated 1,578 meters above sea level, it is one of the '
              'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
              'half-hour walk through pastures and pine forest, leads you to the '
              'lake, which warms to 20 degrees Celsius in the summer. Activities '
              'enjoyed here include rowing, and riding the summer toboggan run.',
              style: TextStyle(wordSpacing: 1.5),
            ),
          ),
        ],
      ),
    );
  }
}

class FavoriteWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _FavoriteWidgetState();
  }
}

class _FavoriteWidgetState extends State<FavoriteWidget> {
  bool _isFavorited = false;
  int _favoriteCount = 41;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(0),
          child: IconButton(
            padding: const EdgeInsets.all(0),
            alignment: Alignment.centerRight,
            icon: (_isFavorited
                ? const Icon(Icons.star)
                : const Icon(Icons.star_border)),
            color: Colors.red[500],
            onPressed: _toggleFavorite,
          ),
        ),
        SizedBox(
          width: 18,
          child: SizedBox(
            child: Text('$_favoriteCount'),
          ),
        ),
      ],
    );
  }

  void _toggleFavorite() {
    setState(() {
      if (_isFavorited) {
        _favoriteCount -= 1;
        _isFavorited = false;
      } else {
        _favoriteCount += 1;
        _isFavorited = true;
      }
    });
  }
}

class CallScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar:  AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        title: Text("Call"),
      ),
      body: Center(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Call Me!", textAlign: TextAlign.center),
          ),
          decoration: BoxDecoration(
            color:  Colors.deepOrangeAccent,
              borderRadius:
              BorderRadius.all(Radius.circular(5.0))),
        ),
      ),
    );
  }
}

class RouteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar:  AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        title: Text("Route"),
      ),
      body: Center(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Route!", textAlign: TextAlign.center),
          ),
          decoration: BoxDecoration(
              color:  Colors.deepOrangeAccent,
              borderRadius:
              BorderRadius.all(Radius.circular(5.0))),
        ),
      ),
    );
  }
}

// class ShareScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return Scaffold(
//       appBar:  AppBar(
//         backgroundColor: Colors.deepOrangeAccent,
//         title: Text("Share"),
//       ),
//       body:
//       ListView(
//         children: [
//           Card(
//             child: ListTile(
//               onTap: () => share(context),
//               title: Text("WhatsApp"),
//               leading: Icon(Icons.whatsapp,color: Colors.green),
//               trailing: Icon(Icons.share,color: Colors.lightBlue),
//             ),
//           ),
//           Card(
//             child: ListTile(
//               title: Text("Telegram"),
//               leading: Icon(Icons.telegram,color: Colors.lightBlue),
//               trailing: Icon(Icons.share,color: Colors.lightBlue),
//             ),
//           ),
//           Card(
//             child: ListTile(
//               title: Text("Copy to file manager"),
//               leading: Icon(Icons.file_copy_outlined,color:Colors.blue),
//               trailing: Icon(Icons.share,color: Colors.lightBlue),
//             ),
//           ),
//           Card(
//             child: ListTile(
//               title: Text("Email"),
//               leading: Icon(Icons.email_outlined,color:Colors.red),
//               trailing: Icon(Icons.share,color: Colors.lightBlue),
//             ),
//           ),
//           Card(
//             child: ListTile(
//               title: Text("Instagram"),
//               // leading: Icon(Icons.share,color: Colors.pinkAccent),
//               trailing: Icon(Icons.share,color: Colors.lightBlue,),
//             ),
//           ),
//           Card(
//             child: ListTile(
//               title: Text("Zender"),
//               // leading: Icon(Icons.share,color: Colors.lightBlueAccent),
//               trailing:Icon(Icons.share,color: Colors.lightBlue),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

void share(BuildContext context){
  Share.share("hp.com/callme");
}
