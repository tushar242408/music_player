import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
class playaudio extends StatefulWidget {
  @override
  _playaudioState createState() => _playaudioState();
}

class _playaudioState extends State<playaudio> {
  String DurMax="00:00:00";
  String DurActivrmus="00:00:00";
  Duration dur=new Duration();
  Duration pos= new Duration();
  AudioPlayer advanceplayer;
  AudioCache audiocache;

    void initplayer(){
      advanceplayer=new AudioPlayer();
      audiocache=new AudioCache(fixedPlayer: advanceplayer);
      advanceplayer.durationHandler=(d) =>
          setState(() {
            pos=d;
            var Active=Duration(seconds:pos.inSeconds.toInt());

          });
    }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title:Text("Upload Track",textAlign: TextAlign.center,style: TextStyle(color: Colors.black)),
      ),

    );
  }
}
