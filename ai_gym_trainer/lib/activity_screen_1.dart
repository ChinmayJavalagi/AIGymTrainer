import 'package:ai_gym_trainer/size_config.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'activity_screen_2.dart';
import 'main.dart';
import 'package:tflite/tflite.dart';

class ActivityScreen1 extends StatefulWidget {
  const ActivityScreen1({Key? key}) : super(key: key);

  @override
  State<ActivityScreen1> createState() => _ActivityScreen1State();
}

class _ActivityScreen1State extends State<ActivityScreen1> {
  CameraImage? cameraImage;
  CameraController? cameraController;
  String output = '';


  @override
  void initState(){
    super.initState();
    loadCamera();
    loadmodel();
  }

  loadCamera(){
    cameraController = CameraController(cameras![0], ResolutionPreset.medium);
    cameraController!.initialize().then((value) {
      if(!mounted){
        return;
      }
      else{
        setState(() {
          cameraController!.startImageStream((imageStream) {
            cameraImage = imageStream;
            runModel();
          });
        });
      }
    });
  }

  runModel()async{
    if(cameraImage!=null){
      var predictions = await Tflite.runModelOnFrame(bytesList: cameraImage!.planes.map((plane) {
        return plane.bytes;
      }).toList(),
      imageHeight: cameraImage!.height,
      imageWidth: cameraImage!.width,
      imageMean: 127.5,
      imageStd: 127.5,
      rotation: 90,
      numResults: 2,
      threshold: 0.1,
      asynch: true);
      predictions!.forEach((element) {
        setState(() {
          output = element['label'];
        });
      });
    }
  }
  
  loadmodel()async{
    await Tflite.loadModel(model: "assets/model.tflite", labels: "assets/labels.txt");
  }
  
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double width = SizeConfig.screenW!;
    double height = SizeConfig.screenH!;
    return Scaffold(
      backgroundColor: Color(0xffFFE5DE),
      appBar: AppBar(
        title: const Text(
          "Live Pose Detection",
        style: TextStyle(
            fontFamily: "Mulish",
            fontWeight: FontWeight.w600,
          color: Colors.black
        ),),
        iconTheme: const IconThemeData(

          color: Colors.black, //change your color here
        ),
        centerTitle: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
        backgroundColor: Color(0xffFFE5DE),),
      body: Column(
        children: [
          Padding(padding: EdgeInsets.all(20),
          child: Container(
            height: MediaQuery.of(context).size.height*0.7,
            width : MediaQuery.of(context).size.width,
            child: !cameraController!.value.isInitialized?
            Container():
            AspectRatio(aspectRatio: cameraController!.value.aspectRatio,
              child: CameraPreview(cameraController!),),
          ),
          ),
          Text(output,
          style: TextStyle(
              fontFamily: "Mulish",
              fontWeight: FontWeight.w600,
            fontSize: 20
          ),
          ),
            Padding(
              padding: const EdgeInsets.all(30),
              child: ElevatedButton(
                onPressed:() {
                  _navigateToNextScreen(context);
                  },
              child: Text("STOP"),
                style: ElevatedButton.styleFrom(
                  primary: Color(0xff7B0930),
                  shape: new RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
              padding: (width <= 550)
              ? EdgeInsets.symmetric(
              horizontal: 100, vertical: 20)
                  : EdgeInsets.symmetric(
              horizontal: width * 0.2, vertical: 25),
              textStyle:
              TextStyle(fontSize: (width <= 550) ? 13 : 17),
              ),
              ),
              )

        ],

      )
    );
  }
  void _navigateToNextScreen(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => ActivityScreen2()));
  }
}
