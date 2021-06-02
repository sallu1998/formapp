import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
    home: MyForm()
      )
      );
    }
    
class MyForm extends StatefulWidget{
  @override
  // State<StatefulWidget> createState() {
  //   return MyFormState();
  MyFormState createState() => MyFormState();
  }
// }
class MyFormState extends State<MyForm>{
  var _myFormKey = GlobalKey<FormState>();
  DateTime date =DateTime.now();
  Future<Null> selectTimePicker(BuildContext context) async {
    // ignore: unused_local_variable
    final DateTime? picked = await showDatePicker(context: context,
                                                 initialDate: date, 
                                                 firstDate: DateTime(1940), 
                                                 lastDate: DateTime(2030)
                                                 );
    if(picked == null && picked == date){
      setState(() {
        date = picked!;
        print(date.toString());
      });
    }
  }
  @override
  Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(title: Text("Employee Form"),),
     body: Container(
       padding: EdgeInsets.symmetric(vertical:25.0 ,horizontal:25.0),
       child: Form(
         key: _myFormKey,
         child: Column(
           children: <Widget>[
             
             Padding(
                padding: EdgeInsets.all(10.0),
                child: TextFormField(
                validator:(msg){
                  if(msg!.isEmpty){
                    return "Please Enter Name";
                  }if(msg.length<3){
                    return "Name is Less than 3 character";
                  }
        //           if (!RegExp(
        //         r"(/^[A-Za-z]+$/)")
        //     .hasMatch(msg)) {
        //   return 'Name Should be characeter';
        // }
                  return null;
                },
                decoration: InputDecoration(
                  // labelText: "Name"
                  hintText: "Enter Your Name",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0)
                  )
                ),
              ),
                ),
                Padding(
                padding: EdgeInsets.all(10.0),
                child: TextFormField(
                validator:(msg){
                  if(msg!.isEmpty){
                    return "Please Enter Email";
                  }if (!RegExp(
                r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
            .hasMatch(msg)) {
          return 'Please enter a valid email Address';
        }
                  return null;
                },
                decoration: InputDecoration(
                  // labelText: "Name"
                  hintText: "Enter Your Email",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0)
                  )
                ),
                ),
                ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: TextFormField(
                  validator:(msg){
                  if(msg!.isEmpty){
                    return "Please Enter Number";
                  }if(msg.length!=10){
                    return "Please Enter 10 digit Number";
                  }if (!RegExp(
                r"(^[0-9]{10}$)")
            .hasMatch(msg)) {
          return 'Phone Number Should be Number';
        }
                  return null;
                },
                  keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  // labelText: "Name"
                  hintText: "Enter Your Mobile Number",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0)
                  )
                ),
              ),
                ),
                Padding(
                padding: EdgeInsets.all(10.0),
                child: TextFormField(
                validator:(msg){
                  if(msg!.isEmpty){
                    return "Please Enter Company Name";
                  }if(msg.length<3){
                    return "Name is Less than 3 character";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  // labelText: "Name"
                  hintText: "Enter Your Company Name",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0)
                  )
                ),
              ),
             
                ),
                // ignore: deprecated_member_use
             FlatButton(
                child: Text("Show Time Picker"),
                color: Colors.blue,
                textColor: Colors.white, 
                onPressed: (){
                  selectTimePicker(context);
                },
              ),
              Text(date.toString())  
           ],
           ),
       ),
     ),
      
     floatingActionButton: FloatingActionButton(
          child: Icon(Icons.done),
          onPressed: (){
          _myFormKey.currentState!.validate();
          }
        ),
  );
  }
  
}

