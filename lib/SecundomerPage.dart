import 'package:flutter/material.dart';
import 'dart:async';


class SecundomerPage extends StatefulWidget {


  @override
  _SecundomerPageState createState() => _SecundomerPageState();
}

class _SecundomerPageState extends State<SecundomerPage>{


  bool startispressed = true;
  bool stopispressed = true;
  bool resetispressed = true;
  String stoptimedispley = '00:00:00';
  var swatch = Stopwatch();
  final duration = const Duration(seconds: 1);

  void starttimer(){
    Timer(duration, keepcallback);
  }
  void keepcallback(){
    if(swatch.isRunning){
      starttimer();
    }
    setState(() {
      stoptimedispley = swatch.elapsed.inMinutes.toString().padLeft(2, "0") + ":" +
          (swatch.elapsed.inSeconds%60).toString().padLeft(2,"0") + ':'
          +  (swatch.elapsed.inMilliseconds%60).toString().padLeft(2,"0");

    });

  }


  void startstopwatch(){
    setState(() {
      stopispressed = false;
      startispressed = false;
    });
    swatch.start();
    starttimer();
  }

  void stopstopwatch(){
    setState(() {
      stopispressed = true;
      resetispressed = false;
    });
    swatch.stop();
  }

  void resetstopwatch(){
    setState(() {
      resetispressed = true;
      startispressed = true;
    });
    swatch.reset();
  }



  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text('Secundomer'),
        ),
        body: Container(
          child: Column(
            children: <Widget>[

              Expanded(
                flex:6,
                child: Container(
                  alignment: Alignment.center,
                  child: Text(stoptimedispley ,
                    style: TextStyle(
                        fontSize: 50.0,
                        fontWeight: FontWeight.w700
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          RaisedButton(
                            onPressed: (){stopispressed ?  null : stopstopwatch();}  ,
                            color: Colors.red,
                            padding: EdgeInsets.symmetric(
                              horizontal: 40.0,
                              vertical: 15.0,
                            ),
                            child: Text('Stop',
                              style: TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.white
                              ),),
                          ),
                          RaisedButton(
                            onPressed:(){ resetispressed ? null : resetstopwatch();} ,
                            color: Colors.blue,
                            padding: EdgeInsets.symmetric(
                              horizontal: 40.0,
                              vertical: 15.0,
                            ),
                            child: Text('Reset',
                              style: TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.white
                              ),),
                          )
                        ],
                      ),
                      RaisedButton(
                        onPressed: (){startispressed ? startstopwatch() : null;} ,
                        color: Colors.green,
                        padding: EdgeInsets.symmetric(
                          horizontal: 80.0,
                          vertical: 20.0,
                        ),
                        child: Text('Start',
                          style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.white,
                              fontWeight: FontWeight.bold
                          ),),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        )
    );
  }
}

