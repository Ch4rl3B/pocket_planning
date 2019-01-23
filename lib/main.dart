import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pocket Planning',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: "Papyrus pocket",),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {

  static final List<MaterialColor> bgColors = <MaterialColor>[
    Colors.blue,
    Colors.purple,
    Colors.orange,
    Colors.lime,
    Colors.indigo,
    Colors.red,
    Colors.yellow,
    Colors.green,
  ];
  static final List<Color> textColors = <Color>[
    Colors.white,
    Colors.white,
    Colors.black,
    Colors.black,
    Colors.white,
    Colors.white,
    Colors.black,
    Colors.white,
  ];

  PageController controller = new PageController(initialPage: 2000);

  @override
  Widget build(BuildContext context) {
    return new PageView.builder(
        itemBuilder: (context, i) {
          int posicion = i.abs();
          if(posicion > 6) {
            posicion = posicion % 8;
          }

          TextStyle textStyle = new TextStyle(fontSize: 400.0, color: textColors[posicion]);

          return new Container(
              padding: EdgeInsets.all(24.0),
              color: bgColors[posicion],
              child: widgetList(textStyle, posicion)
          );
        },
    );
  }


  Widget widgetList(textStyle, position){
      switch(position){
        case 1: return Stack(
          children: <Widget>[
            Center(
              child: Text("0", style: textStyle,),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Image.asset("images/cake.png", height: 220.0, width: 215.0,),
            )
          ],
        );
        case 2: return Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Center(
              child: Text("1", style: textStyle,),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Image.asset("images/easy.png", height: 220.0, width: 215.0,),
            )
          ],
        );
        case 3: return Stack(
          children: <Widget>[
            Center(
              child: Text("2", style: textStyle,),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Image.asset("images/work.png", height: 220.0, width: 215.0,),
            )
          ],
        );
        case 4: return Stack(
          children: <Widget>[
            Center(
              child: Text("3", style: textStyle,),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Image.asset("images/hard.png", height: 220.0, width: 215.0,),
            )
          ],
        );
        case 5: return Stack(
          children: <Widget>[
            Center(
              child: Text("5+", style: textStyle,),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Image.asset("images/noway.png", height: 220.0, width: 215.0,),
            )
          ],
        );
        case 6: return Stack(
          children: <Widget>[
            Center(
              child: Text("%", style: textStyle,),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Image.asset("images/split.png", height: 220.0, width: 215.0,),
            )
          ],
        );
        case 7: return Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.topCenter,
              child: Text(
                "Pasteles!!", style: textStyle.copyWith(fontSize: 100.0),),
            ),
            Center(
              child: Image.asset(
                "images/merienda.png", height: 320.0, width: 315.0,),
            )
          ],
        );

        default: return Stack(
          children: <Widget>[
            Center(
              child: Text("No view"),
            )
          ],
        );
      }
  }
}
