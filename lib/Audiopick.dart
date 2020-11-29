

import 'package:fdottedline/fdottedline.dart';
import 'package:file_picker/file_picker.dart';

import 'package:flutter/material.dart';
import 'package:flutter_project/play.dart';
import 'package:image_picker/image_picker.dart';

import 'dart:io';




class Audiopick extends StatefulWidget {
  @override
  _AudiopickState createState() => _AudiopickState();
}

class _AudiopickState extends State<Audiopick> {
File _audio;
File image;
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
       image= File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }
  FilePickerResult res;
   void pick() async{
     FilePickerResult result = await FilePicker.platform.pickFiles(
       type: FileType.custom,
       allowedExtensions: ['mp3'],
     );
     setState(() {
       _audio =File(result.files.single.path);
     });
}

    @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title:Text("Upload Track",textAlign: TextAlign.center,style: TextStyle(color: Colors.black)),
      ),
      body: SingleChildScrollView(
        child: Container(


          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height:MediaQuery.of(context).size.height*0.09),
              Center(
                child: GestureDetector(

           onTap:()=> pick(),

                  child: FDottedLine(
                    color: Colors.black87,
                    height: MediaQuery.of(context).size.height/5,
                    width: MediaQuery.of(context).size.width/1.2,
                    strokeWidth: 2.0,
                    dottedLength: 10.0,
                    space: 2,
                    child: GestureDetector(

                      child: Container(
                          height: MediaQuery.of(context).size.height/5,
                          width: MediaQuery.of(context).size.width/1.2,
                        child:Column(

                          children: [
                         IconButton(icon: Icon(Icons.playlist_add), onPressed:()=> null,color:Colors.orange),
                            Text("Tap here to select track from phone"),
                          ]
                        )
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height:MediaQuery.of(context).size.height*0.06),
              Container(
                  height: MediaQuery.of(context).size.height/4.5,
                  width: MediaQuery.of(context).size.width/2,
                decoration: BoxDecoration(
                  borderRadius: BorderRadiusDirectional.circular(20),
                  color:Colors.grey,
                ),

                child:GestureDetector(
                  onTap: ()=> getImage(),
                  child: Container(
                      height: MediaQuery.of(context).size.height/10,
                      width: MediaQuery.of(context).size.width/2.5,
                    child:Row(
                      children: [
                        IconButton(icon: Icon(Icons.add), onPressed: null ,color:Colors.white),
                        Text("Add cover photo"),

                      ],
                    )

                  ),
                )

              ),

              TextFormField(
                decoration: InputDecoration(
                 labelText: "Enter the Name of the Track ",

                )
              ),
              SizedBox(height:MediaQuery.of(context).size.height*0.08),
              GestureDetector(
                onTap: ()=>Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>Playmusic(fil: _audio)),),

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
      ),

    );
  }
}
