import 'dart:ffi';


import 'dart:io';


import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/show.dart';
import 'package:video_player/video_player.dart';
import 'package:video_trimmer/video_trimmer.dart';
class Playmusic extends StatefulWidget {
  final File fil;
  Playmusic({this.fil}) ;


  @override
  _PlaymusicState createState() => _PlaymusicState();
}

class _PlaymusicState extends State<Playmusic> {
VideoPlayerController _player;




  String CurrentPlaying="none";

  String Durmaxmus="00:00:00";
  String DurActivemus="00:00:00";
  double _startValue = 0.0;

  Duration duration= new Duration();
  Duration postion= new Duration();
  AudioPlayer advanceplayer;
  AudioCache audiocache;
  File fl=File("music/lov.mp3");
  final Trimmer _trimmer = Trimmer();
  void Trim() async {
    if (widget.fil != null) {
      await _trimmer.loadVideo(videoFile: widget.fil);
         TrimmerView(_trimmer);
    }
  }

  Future TrimmerView(Trimmer _trimmer) async {
    String _value;

    await _trimmer
        .saveTrimmedVideo(startValue: _startValue, endValue: _startValue+15)
        .then((value) {
      setState(() {
        _value = value;
      });
    });


  }






  var a;
  @override
  void initState() {
    print(widget.fil);
     a=widget.fil.toString().substring(67, widget.fil.toString().length - 1);
    print(a);

  
    initplayer();
    audiocache.play(a);


    // TODO: implement initState
    super.initState();
  }
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        backgroundColor: Colors.white,
        title:Text("Upload Track",textAlign: TextAlign.center,style: TextStyle(color: Colors.black)),
      ),


      body: Container(
        child:Column(
          children: [
            SizedBox(height:MediaQuery.of(context).size.height*0.03,),
         Text("Crop the selected track to maximum 15 seconds track",style:TextStyle(
           color:Colors.black,
           fontSize:15,
           fontWeight:FontWeight.bold,

         )),
            Text("Use the Slider to adjust the time",textAlign:TextAlign.start),
            SizedBox(height:MediaQuery.of(context).size.height*0.03,),
            Container(
              width: MediaQuery.of(context).size.width,
              height:MediaQuery.of(context).size.height/6,
              decoration: BoxDecoration(
                border: Border.all(),
              ),
              child:Image.asset("image/im.png",
              fit: BoxFit.contain,),
            ),
            SizedBox(height:MediaQuery.of(context).size.height*0.05,),
            Container(
              child: Row(
                children: [
                  IconButton(icon:Icon(Icons.play_circle_outline_outlined),onPressed:()=>audiocache.play('music/lov.mp3') ),
                  Text("Play Cropped track"),
                ],
              ),

            ),
            SizedBox(height:MediaQuery.of(context).size.height*0.03,),
            Container(child: IconButton(icon:Icon(Icons.pause_circle_outline),onPressed:()=>   advanceplayer.pause())),
            SizedBox(height:MediaQuery.of(context).size.height*0.04,),
Container(
  child: Slider(
    activeColor:Colors.white,
    inactiveColor: Colors.orange,
    value: postion.inSeconds.toDouble(),
    min: 0.0,
    max: duration.inSeconds.toDouble(),
    onChanged: (double value){
      setState(() {
        SeektpSecond(value.toInt());
        value=value;
      });
    },
  )
),
            SizedBox(height:MediaQuery.of(context).size.height*0.03,),
            GestureDetector(
              onTap: (){
                Trim();
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>Show()),);
              },

              child: Container(
                

                height: MediaQuery.of(context).size.height/10,
                width: MediaQuery.of(context).size.width/1.2,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.orange,
                ),
                child: Text("upload",style:TextStyle(
                  fontSize: 50,
                ),textAlign: TextAlign.center),


              ),
            )
          ],

        )
      ),

    );
  }
}
