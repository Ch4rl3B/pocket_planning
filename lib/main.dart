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
      debugShowCheckedModeBanner: false,
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
    Colors.grey,
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
    Colors.black,
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
          int posicion = i.abs() % 8;

          TextStyle textStyle = new TextStyle(fontSize: MediaQuery.of(context).size.width/1.5, color: textColors[posicion]);

          return Material(
            type: MaterialType.transparency,
            textStyle: textStyle,
            child: new Container(
                padding: EdgeInsets.all(14.0),
                color: bgColors[posicion],
                child: widgetList(textStyle, posicion)
            ),
          );
        },
      controller: controller,
    );
  }


  Widget widgetList(textStyle, position){
    double height = MediaQuery.of(context).size.height * 0.25;
    double widht = MediaQuery.of(context).size.width * 0.27;

    print(position);
      switch(position){
        case 0: return Stack(
          children: <Widget>[
            Center(
              child: Text("0"),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Image.asset("images/cake.png", height: height, width: widht,),
            )
          ],
        );
        case 1: return Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Center(
              child: Text("1/2", style: textStyle.copyWith(fontSize: MediaQuery.of(context).size.width/2.1),),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Image.asset("images/firework.png", height: height * 1.5, width: widht * 1.5,),
            )
          ],
        );
        case 2: return Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Center(
              child: Text("1"),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Image.asset("images/easy.png", height: height * 1.5, width: widht * 1.5,),
            )
          ],
        );
        case 3: return Stack(
          children: <Widget>[
            Center(
              child: Text("2"),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Image.asset("images/work.png", height: height * 1.2, width: widht * 1.2,),
            )
          ],
        );
        case 4: return Stack(
          children: <Widget>[
            Center(
              child: Text("3"),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Image.asset("images/hard.png", height: height * 1.3, width: widht * 1.3,),
            )
          ],
        );
        case 5: return Stack(
          children: <Widget>[
            Center(
              child: Text("5+"),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Image.asset("images/noway.png", height: height * 1.08, width: widht * 1.08,),
            )
          ],
        );
        case 6: return Stack(
          children: <Widget>[
            Center(
              child: Text("%"),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Image.asset("images/split.png", height: height - 15.5, width: widht - 15.5,),
            )
          ],
        );
        case 7: return Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.topCenter,
              child: Text(
                "Pasteles", style: textStyle.copyWith(fontSize: 80.0),),
            ),
            Center(
              child: Image.asset(
                "images/merienda.png", height: height * 2, width: widht * 2,),
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
