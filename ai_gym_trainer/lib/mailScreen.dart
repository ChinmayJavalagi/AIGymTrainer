import 'package:flutter/material.dart';


// Define a custom Form widget.
class MyCustomForm extends StatefulWidget {
  const MyCustomForm({Key? key}) : super(key: key);
  // const MyCustomForm({super.key});
  @override
  State<MyCustomForm> createState() => _MyCustomFormState();
}

// Define a corresponding State class.
// This class holds the data related to the Form.
class _MyCustomFormState extends State<MyCustomForm> {
  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  final myController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFE5DE),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          TextField(
            decoration: InputDecoration(
              hintText: 'Enter your mail',
              border: OutlineInputBorder(),
              suffixIcon: IconButton(
                onPressed: (){
                  myController.clear();
                },
                icon: const Icon(Icons.clear),
              )
            ),
            controller: myController,
          ),
            SizedBox(
              height: 70,
            ),
            SizedBox(
              //Use of SizedBox
              height: 50,
              width: 150,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Color(0xff7B0930),
                    textStyle: TextStyle(fontSize: 18),
                    minimumSize: Size.fromHeight(52),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                  ), child: const Text('Send'),
                  onPressed: () {}),
            ),

          ],
        ),

        ),
    );
  }
}