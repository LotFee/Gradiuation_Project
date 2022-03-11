import 'package:flutter/material.dart';
import 'package:sakkeny/screens/addPost/addOne.dart';
import 'package:sakkeny/widget/bottomBar.dart';
import 'package:sakkeny/widget/drawer.dart';
import 'package:sakkeny/homeScreens/Home.dart';
class Complaint extends StatelessWidget {
  static const String routeName = 'complaint';
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool validate() {
    if (formKey.currentState!.validate()) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(

        appBar: AppBar(
          foregroundColor: Color(0xff1f95a1),
          backgroundColor: Colors.white,
          backwardsCompatibility: false,
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(
                  Icons.menu,
                  color: Color(0xff1f95a1),
                  size: 37, // Changing Drawer Icon Size
                ),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                //tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              );
            },
          ),
          title: Center(child: Text("Complaints", style: TextStyle(color:Color(0xff1f95a1),fontWeight: FontWeight.bold ),)),
          actions: [
            GestureDetector(onTap: (){},child: Icon(Icons.search,color: Color(0xff1f95a1),size: 35)),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("E-Mail Address",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,letterSpacing: 2),),
                        SizedBox(height: 10,),
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
                              keyboardType: TextInputType.emailAddress,
                              textInputAction: TextInputAction.next,

                              decoration: InputDecoration(
                                errorBorder: new OutlineInputBorder(
                                  borderSide: new BorderSide(
                                      color: Colors.white, width: 0.0),
                                ),
                                focusedErrorBorder: new OutlineInputBorder(
                                  borderSide: new BorderSide(
                                      color: Colors.white, width: 0.0),
                                ),
                                enabledBorder: InputBorder.none,
                                prefixIcon: Icon( Icons.email,color: Color(0xff1f95a1),),
                                labelStyle: TextStyle(color: Color(0xff1f95a1)),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white ),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: Colors.grey  ),
                                ),
                                hintText: "Enter Your Email",

                              ),
                              validator: (val) {
                                if (val!.length == 0)
                                  return "Please enter email";
                                else if (!val.contains("@"))
                                  return "Please enter valid email";
                                else
                                  return null;
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Your complaint",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,letterSpacing: 2),),
                        SizedBox(height: 10,),
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
                              keyboardType: TextInputType.multiline,
                              textInputAction: TextInputAction.done,
                              maxLines:7,
                              decoration: InputDecoration(
                                errorBorder: new OutlineInputBorder(
                                  borderSide: new BorderSide(
                                      color: Colors.white, width: 0.0),
                                ),
                                focusedErrorBorder: new OutlineInputBorder(
                                  borderSide: new BorderSide(
                                      color: Colors.white, width: 0.0),
                                ),
                                enabledBorder: InputBorder.none,
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.only(bottom: 110.0),
                                  child: Icon( Icons.multiple_stop_rounded,color: Color(0xff1f95a1),),
                                ),
                                labelStyle: TextStyle(color: Color(0xff1f95a1)),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white ),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: Colors.grey  ),
                                ),
                                hintText: "Enter Your Complaint........",

                              ),
                              validator: (value){
                                if(value!.isEmpty){
                                  return 'please enter a complaint';
                                }
                                if(value.length<7){
                                  return 'should be at least 7 characters long';
                                }
                                return null;
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 70.0),
                      child: Material(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Color(0xff1f95a1),
                        child: MaterialButton(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 50.0),
                            child: Text(
                              'Send',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          onPressed: () {
                            if(validate())
                            {
                              showDialog(
                                  context: context,
                                  barrierDismissible: false,
                                  builder: (context) => Dialog(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15)),
                                    elevation: 16,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(5),
                                      child: Container(
                                        width: 600,
                                        height: 450,
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 40.0,
                                                  right: 40,
                                                  bottom: 20,
                                                  top: 20),
                                              child: Image.asset(
                                                "images/complaint.png",
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                             Text(
                                                "Your Complaint has been ",
                                                style: TextStyle(
                                                    fontSize: 19,
                                                    fontWeight: FontWeight.bold),
                                              ),

                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Text(
                                                "sent successfully ",
                                                style: TextStyle(
                                                    fontSize: 19,
                                                    fontWeight: FontWeight.bold),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 15.0),
                                              child: Text(
                                                "You will be answered soon",
                                                style: TextStyle(
                                                    fontSize: 19,
                                                    fontWeight: FontWeight.bold),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                              const EdgeInsets.only(top: 15.0),
                                              child: RaisedButton(
                                                color:
                                                Color(0xff1f95a1), // background
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                    BorderRadius.circular(
                                                        10)), // foreground
                                                onPressed: () {
                                                  Navigator.pushNamed(context,
                                                      Home.routeName);
                                                },
                                                child: Padding(
                                                  padding:
                                                  const EdgeInsets.all(10.0),
                                                  child: Text(
                                                    "Home",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 25),
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ));
                            }
                          },
                        ),
                      ),
                    ),
                  ],
                ),
            ),
          ),
        ),
        drawer: myDrawer(),
        floatingActionButton:FloatingActionButton(
          onPressed: (){
            Navigator.pushReplacement(context,PageRouteBuilder(
              pageBuilder: (context, animation1, animation2) => AddOne(),
              transitionDuration: Duration.zero,
            ),);
          },
          backgroundColor: Color(0xff1f95a1),
          child: Icon(Icons.add), //icon inside button
        ),

        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,


        bottomNavigationBar: myBottomBar(index: 10,),

      ),
    );
  }
}
