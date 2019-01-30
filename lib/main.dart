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

  PageController controller = new PageController(initialPage: 98);

  @override
  Widget build(BuildContext context) {
    return new PageView.builder(
        itemBuilder: (context, i) {
          int posicion = i.abs() % 7;

          TextStyle textStyle = new TextStyle(fontSize: 400.0, color: textColors[posicion]);

          return Material(
            type: MaterialType.transparency,
            textStyle: textStyle,
            child: new Container(
                padding: EdgeInsets.all(24.0),
                color: bgColors[posicion],
                child: widgetList(textStyle, posicion)
            ),
          );
        },
      controller: controller,
    );
  }


  Widget widgetList(textStyle, position){
    print(position);
      switch(position){
        case 0: return Stack(
          children: <Widget>[
            Center(
              child: Text("0"),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Image.asset("images/cake.png", height: 220.0, width: 215.0,),
            )
          ],
        );
        case 1: return Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Center(
              child: Text("1"),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Image.asset("images/easy.png", height: 220.0, width: 215.0,),
            )
          ],
        );
        case 2: return Stack(
          children: <Widget>[
            Center(
              child: Text("2"),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Image.asset("images/work.png", height: 220.0, width: 215.0,),
            )
          ],
        );
        case 3: return Stack(
          children: <Widget>[
            Center(
              child: Text("3"),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Image.asset("images/hard.png", height: 220.0, width: 215.0,),
            )
          ],
        );
        case 4: return Stack(
          children: <Widget>[
            Center(
              child: Text("5+"),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Image.asset("images/noway.png", height: 220.0, width: 215.0,),
            )
          ],
        );
        case 5: return Stack(
          children: <Widget>[
            Center(
              child: Text("%"),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Image.asset("images/split.png", height: 220.0, width: 215.0,),
            )
          ],
        );
        case 6: return Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.topCenter,
              child: Text(
                "Pasteles!!", style: textStyle.copyWith(fontSize: 80.0),),
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
