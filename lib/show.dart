import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
class Show extends StatefulWidget {
  @override
  _ShowState createState() => _ShowState();
}

class _ShowState extends State<Show> {

  String CurrentPlaying="none";

  String Durmaxmus="00:00:00";
  String DurActivemus="00:00:00";
  double _startValue = 0.0;

  Duration duration= new Duration();
  Duration postion= new Duration();
  AudioPlayer advanceplayer;
  AudioCache audiocache;
  void initplayer(){
    advanceplayer =new AudioPlayer();
    audiocache =new AudioCache(fixedPlayer:advanceplayer);
    advanceplayer.durationHandler=(d)=> setState((){
      duration=d;
      var Maxm=Duration(seconds: duration.inSeconds.toInt());
    });
    advanceplayer.positionHandler=(p)=>setState(() {
      postion =p;
      _startValue= postion.inSeconds.toDouble();
      var Active=Duration(seconds: postion.inSeconds.toInt());


    });

  }
  String printDur(Duration dura){
    String twodig(int n) {
      if(n>=10)return "$n";
      return"0$n";

    }


  }
  void SeektpSecond(int Second){
    Duration nduration=Duration(seconds: Second);
    advanceplayer.seek(nduration);
  }


@override
  void initState() {
    initplayer();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title:Text("Upload Track",textAlign: TextAlign.center,style: TextStyle(color: Colors.black)),
      ),
      body: Container(
        child: Column(
          children: [
            SizedBox(height:30),
            Container(
              width:MediaQuery.of(context).size.width/3,
              height:MediaQuery.of(context).size.height/3,
              decoration: BoxDecoration(
                color:Colors.grey,
                borderRadius: BorderRadius.circular(10),
              ),
                child:Column(
          children: [
            IconButton(icon: Icon(Icons.music_video_sharp)),
            Text("Audio"),

          ]
      )
            ),

            SizedBox(height:20),
            Center(
              child: IconButton(icon: Icon(Icons.play_circle_outline),onPressed:()=> audiocache.play('music/lov.mp3'),),
            ),
            Center(
              child: IconButton(icon: Icon(Icons.pause),onPressed:()=> advanceplayer.pause(),),
            )
          ],
        )
      ),
    );
  }
}
