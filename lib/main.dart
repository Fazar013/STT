import 'package:flutter/material.dart';
import 'package:alan_voice/alan_voice.dart';



void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "stt Basic Example",
      theme: ThemeData(
         
        primarySwatch: Colors.yellow,
      ),
      home: MyHomePage(title: 'Flutter stt my projec'),
    );
  }
}


class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  _MyHomePageState() {
      _initAlanButton();
  }

  get backgroundColor => Colors.purple;
  void _initAlanButton() {


    AlanVoice.addButton(
        "02c928ef41848e918efab694f76ffbc82e956eca572e1d8b807a3e2338fdd0dc/stage", 
    );

    AlanVoice.onCommand.add((command) {
        debugPrint("got new command ${command.toString()}");
        var commandName = command.data["command"] ?? "";
        if (commandName == "showAlert") {
            /// handle command "showAlert"
        }
    });

    AlanVoice.onEvent.add((event) {
        debugPrint("got new event ${event.data.toString()}");
    });

    AlanVoice.onButtonState.add((state) {
        debugPrint("got new button state ${state.name}");
    });
  }

  @override
  Widget build(BuildContext context) {

    
    return Scaffold(
       backgroundColor: backgroundColor,
       
        appBar: AppBar(
        
       
        title: Text(widget.title),
      ),
      
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('asset/satnusap.jpg'),
            fit: BoxFit.cover,
       
          ),
        ),
        
        child: Column(
         
        ),
      ),
    );
  }
}

