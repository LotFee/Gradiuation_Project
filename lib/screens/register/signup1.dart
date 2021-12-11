import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sakkeny/screens/start_screen.dart';

class SignUp1 extends StatelessWidget {
  const SignUp1({Key? key}) : super(key: key);

  static const String routeName= "sign-up1";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        backwardsCompatibility: false,
        // automaticallyImplyLeading: false,
        leading: IconButton(icon: Icon(Icons.arrow_back_sharp,size: 25,) , onPressed: (){
          Navigator.pop(context);
        }, color:Color(0xff1f95a1) , ),
        systemOverlayStyle: SystemUiOverlayStyle(statusBarColor:Color(0xff1f95a1) ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  "Sign Up",
                  style: TextStyle(
                      color: Color(0xff1f95a1),
                      fontSize: 25,
                      fontWeight: FontWeight.w800),
                ),
              ),
              Center(
                child: Text(
                  "First Step",
                  style: TextStyle(
                      fontSize: 15,
                      ),

                ),
              ),
              SizedBox(height: 15,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 10.0,
                          offset: Offset(0.0, 7),
                          //  spreadRadius: 50.0,
                        )
                      ],
                    ),

                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(40),
                      child: Container(
                        height: 40,
                        width: 40,

                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xff1f95a1)
                        ),
                        child: Icon(Icons.done , color: Colors.white, size: 30,) ,


                      ),
                    ),
                  ),
                  Icon(Icons.arrow_right_alt_outlined, color: Colors.grey,size: 30,),
                  Container(
                    decoration: BoxDecoration(
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 10.0,
                          offset: Offset(0.0, 7),
                          //  spreadRadius: 50.0,
                        )
                      ],
                    ),

                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(40),
                      child: Container(
                        height: 40,
                        width: 40,

                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xff1f95a1)
                        ),
                        child: Icon(Icons.done , color: Colors.white, size: 30,) ,


                      ),
                    ),
                  ),
                  Icon(Icons.arrow_right_alt_outlined, color: Colors.grey,size: 30,),
                  Container(
                    decoration: BoxDecoration(
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 10.0,
                          offset: Offset(0.0, 7),
                          //  spreadRadius: 50.0,
                        )
                      ],
                    ),

                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(40),
                      child: Container(
                        height: 40,
                        width: 40,

                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xff1f95a1)
                        ),
                        child: Icon(Icons.done , color: Colors.white, size: 30,) ,


                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15,),
              Text("Upload your Image", style: TextStyle(fontWeight: FontWeight.bold),),
              SizedBox(height: 15,),
              Stack(
                 children: [
                   CircleAvatar(
                     backgroundColor: Colors.grey,
                        radius: 70,

                   ),
                   Positioned(
                       top: 90,
                       left: 95,
                       child:  Container(
                         decoration: BoxDecoration(
                           boxShadow: <BoxShadow>[
                             BoxShadow(
                               color: Colors.black26,
                               blurRadius: 10.0,
                               offset: Offset(0.0, 7),
                               //  spreadRadius: 50.0,
                             )
                           ],
                         ),

                         child: ClipRRect(
                           borderRadius: BorderRadius.circular(40),
                           child: Container(
                             height: 40,
                             width: 40,

                             decoration: BoxDecoration(
                                 shape: BoxShape.circle,
                                 color: Colors.white
                             ),
                             child: IconButton(icon: Icon(Icons.add_a_photo), color: Color(0xff1f95a1), onPressed: (){},) ,



                           ),
                         ),
                       ),



                   ),

                 ],
              ),

              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Form(child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("First Name",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,letterSpacing: 2),),
                        Container(
                          decoration: BoxDecoration(
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 20.0,
                                offset: Offset(0.0, 7),
                                //  spreadRadius: 50.0,
                              )
                            ],
                          ),

                          child: Container(
                            color: Colors.white,
                            child: TextFormField(
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                enabledBorder: InputBorder.none,
                                prefixIcon: Icon( Icons.person,color: Color(0xff1f95a1),),
                                //  labelText: "Enter Your  First Name",
                                labelStyle: TextStyle(color: Color(0xff1f95a1)),
                                focusedBorder: OutlineInputBorder(

                                  // borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: Colors.white ),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: Colors.grey  ),
                                ),
                                hintText: "First Name",

                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 30,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Last Name",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,letterSpacing: 2),),
                        Container(
                          decoration: BoxDecoration(
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 20.0,
                                offset: Offset(0.0, 7),
                                //  spreadRadius: 50.0,
                              )
                            ],
                          ),

                          child: Container(
                            color: Colors.white,
                            child: TextFormField(
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                enabledBorder: InputBorder.none,
                                prefixIcon: Icon( Icons.person,color: Color(0xff1f95a1),),
                                //  labelText: "Enter Your  First Name",
                                labelStyle: TextStyle(color: Color(0xff1f95a1)),
                                focusedBorder: OutlineInputBorder(

                                  // borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: Colors.white ),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: Colors.grey  ),
                                ),
                                hintText: "Last Name",

                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                  ],
                )),
              ),
             Padding(
               padding: const EdgeInsets.all(30.0),
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.end,
                 children: [
                   RaisedButton(

                     color: Color(0xff1f95a1), // background
                     shape: RoundedRectangleBorder(
                         borderRadius: BorderRadius.circular(10)), // foreground
                     onPressed: () {

                     },
                     child: Text("Next",style: TextStyle(color: Colors.white ,fontSize: 25),),
                     padding: EdgeInsets.only(top: 8,bottom: 8),
                   ),
                 ],
               ),
             ),
            ],
          ),
        ),
      ),
    );
  }
}
