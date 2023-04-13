import 'package:ai_gym_trainer/size_config.dart';
import 'package:flutter/material.dart';

import 'mailScreen.dart';

class ActivityScreen2 extends StatefulWidget{
  const ActivityScreen2({Key? key}) : super(key: key);

  @override
  State<ActivityScreen2> createState() => _ActivityScreen2State();
}

class _ActivityScreen2State extends State<ActivityScreen2> {
  bool isLoading = false;

  String get urlImage =>
      'https://images.unsplash.com/photo-1526506118085-60ce8714f8c5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8Z3ltfGVufDB8fDB8fA%3D%3D&w=1000&q=80';

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double width = SizeConfig.screenW!;
    double height = SizeConfig.screenH!;
    return Scaffold(
      backgroundColor: Color(0xffFFE5DE),
      body: Container(
        // decoration: BoxDecoration(
        //   image: DecorationImage(
        //     image: const AssetImage("assets/images/gymphoto.jpg"),
        //     fit: BoxFit.cover,
        //     colorFilter: ColorFilter.mode(
        //       Colors.black.withOpacity(0.7),
        //       // shaderCallback: (bounds) => LinearGradient(
        //       //     colors: [Colors.black87, Colors.black87],
        //       //     begin: Alignment.center,
        //       //     end: Alignment.bottomCenter,
        //       // ).createShader(bounds),
        //       BlendMode.darken,
        //     ),
        //   ),
        // ),
        alignment: Alignment.center,
        padding: EdgeInsets.all(60),
        height: 900,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Color(0xff7B0930),
                  textStyle: TextStyle(fontSize: 18),
                  minimumSize: Size.fromHeight(52),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                ), child: const Text('Mail the report'),
                onPressed: () {
                  _navigateToNextScreen(context);
                }),


            // ElevatedButton(
            //     style: ElevatedButton.styleFrom(primary: Colors.deepPurple,
            //     textStyle: TextStyle(fontSize: 24),
            //     minimumSize: Size.fromHeight(52),
            //     shape: RoundedRectangleBorder(
            //         borderRadius: BorderRadius.circular(10)),
            //   ) , child: isLoading
            //           ? Row(
            //               mainAxisAlignment: MainAxisAlignment.center,
            //               children: [
            //                  CircularProgressIndicator(color: Colors.white),
            //                  const SizedBox(width: 24),
            //                  Text('Please Wait..')
            //                          ],
            //                 )
            //
            //            :Text('Show the result'),
            //           onPressed: () async{
            //             if (isLoading) return;
            //
            //             setState(() => isLoading = true);
            //             await Future.delayed(Duration(seconds: 5));
            //             setState(() => isLoading = false);},
            //   ),
            SizedBox(
              //Use of SizedBox
              height: 70,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Color(0xff7B0930),
                  textStyle: TextStyle(fontSize: 18,
                  color: Colors.black),
                  minimumSize: Size.fromHeight(52),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                ), child: Text('Show the report!!'),
                onPressed: () {}),
          ],
        ),
      ),
    );
  }
  void _navigateToNextScreen(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => MyCustomForm()));
  }
}