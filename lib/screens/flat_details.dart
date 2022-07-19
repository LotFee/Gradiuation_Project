import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:provider/provider.dart';
import 'package:sakkeny/provider/flat.dart';
import 'package:sakkeny/provider/Flats.dart';
import 'package:sakkeny/screens/data_about_student.dart';
import 'package:sakkeny/screens/flatMap.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:url_launcher/url_launcher.dart';

class FlatDetails extends StatefulWidget {
  const FlatDetails({Key? key}) : super(key: key);
  static const routeName = 'falt_details';

  @override
  _FlatDetailsState createState() => _FlatDetailsState();
}

class _FlatDetailsState extends State<FlatDetails> {
  int _currentIndex = 0;
  double? _ratingValue;
  @override
  Widget build(BuildContext context) {
    final flatId = ModalRoute.of(context)!.settings.arguments as String;
    final flatItem =
        Provider.of<Flats>(context, listen: false).findById(flatId);
    Future launcApp(int index, String phone)async {
      if(index == 0)
      {
        var whatsappUrl =
            "whatsapp://send?phone=+20${phone}&text=مرحبا ...كيف حالك؟";
        var url = Uri.parse(whatsappUrl);
        await launchUrl(url);
      }
      if(index==1)
      {
        await launchUrl(Uri.parse("tel://+20${phone}"));
      }

    }


    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 200,
        foregroundColor: Color(0xff1f95a1),
        backgroundColor: Colors.black38,
        elevation: 0,
        automaticallyImplyLeading: false,
        flexibleSpace: SafeArea(
          child: Stack(
            children:[
              CarouselSlider(
                  items: flatItem.images
                      .map((e) => Card(
                        elevation: 6.0,
                        shadowColor: Color(0xff1f95a1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        child: Image.network(
                          e,
                          fit: BoxFit.fill,
                          width: double.infinity,
                        ),
                      ))
                      .toList(),
                  options: CarouselOptions(
                      autoPlay: true,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _currentIndex = index;
                          //  print(_currentIndex);
                        });
                      })),
              Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: flatItem.images.map((urlOfItem) {
                    int index = flatItem.images.indexOf(urlOfItem);
                    return Container(
                      width: 10.0,
                      height: 10.0,
                      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _currentIndex == index
                            ? Color(0xff1f95a1)
                            : Colors.white,
                      ),
                    );
                  }).toList(),
                ),
              ),
              Align(
                alignment: Alignment(-1,-.7),
                child: TextButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  child:ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Container(
                      color: Color(0xff1f95a1),
                      width: 35,
                      height: 35,
                      child:  Icon(Icons.arrow_back_sharp,color: Colors.white,),
                    ),
                  ) ,
                ),
              ),
             // Align(
             //   alignment: Alignment(-.9,-.7),
             //   child: Material(
             //     borderRadius: BorderRadius.circular(10.0),
             //     color: Color(0xff1f95a1),
             //     child: MaterialButton(
             //       minWidth: 3,
             //       child: Icon(Icons.arrow_back,color: Colors.white,),
             //       onPressed: () {
             //
             //       },
             //     ),
             //   ),
             // ),

            ],
          ),
        ) ,

      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Container(
                  color: Colors.white,
                  child:Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0,right:8 ,left: 8),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  backgroundColor: Colors.white,
                                  foregroundImage: NetworkImage(flatItem.userImage),

                                  radius: 25,
                                ),
                                SizedBox(
                                  width: 3,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      flatItem.userName.split(' ').first+' '+flatItem.userName.split(' ').last,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 13),
                                    ),
                                    Text(
                                      "Owner",
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              if (true) {
                                showDialog(
                                    context: context,
                                    barrierDismissible: true,
                                    builder: (context) => Container(
                                      child: Dialog(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                            BorderRadius.circular(15)),
                                        elevation: 16,
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(5),
                                          child: Container(
                                            width: 100,
                                            height: 150,
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Text('Pleaze review this flat',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                                                Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                                  children: [
                                                    RatingBar(
                                                        initialRating: 0,
                                                        direction: Axis.horizontal,
                                                        allowHalfRating: true,
                                                        itemCount: 5,
                                                        ratingWidget: RatingWidget(
                                                            full: const Icon(Icons.star, color: Color(0xff1f95a1)),
                                                            half: const Icon(
                                                              Icons.star_half,
                                                              color: Color(0xff1f95a1),
                                                            ),
                                                            empty: const Icon(
                                                              Icons.star_outline,
                                                              color: Color(0xff1f95a1),
                                                            )),
                                                        onRatingUpdate: (value) {
                                                          setState(() {
                                                            _ratingValue = value;
                                                          });
                                                        }),

                                                  ],
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.all(15),
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                    children: [
                                                      Material(
                                                        borderRadius: BorderRadius.circular(10.0),
                                                        color: Color(0xff1f95a1),
                                                        child: MaterialButton(
                                                          child: Text(
                                                            'Submit',
                                                            style: TextStyle(
                                                              color: Colors.white,
                                                              fontWeight: FontWeight.bold,
                                                              fontSize: 20,
                                                            ),
                                                          ),
                                                          onPressed: () {
                                                            Navigator.of(context,rootNavigator: true).pop();
                                                            print(_ratingValue);
                                                          },
                                                        ),
                                                      ),
                                                      Material(
                                                        borderRadius: BorderRadius.circular(10.0),
                                                        color: Color(0xff2f2e41),
                                                        child: MaterialButton(
                                                          child: Text(
                                                            'Cancel',
                                                            style: TextStyle(
                                                              color: Colors.white,
                                                              fontWeight: FontWeight.bold,
                                                              fontSize: 20,
                                                            ),
                                                          ),
                                                          onPressed: () {
                                                            Navigator.of(context,rootNavigator: true).pop();
                                                            print(_ratingValue);

                                                          },
                                                        ),
                                                      ),
                                                    ],),
                                                ),

                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ));
                              }

                            },
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.star,color: Color(0xff1f95a1),),
                                    Text("6.5",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                                    Text("(10)",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 15),),
                                  ],
                                ),
                                Text('Tab to review',style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold),)
                              ],
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            onTap: (){
                              print(flatItem.locationOnMap);
                              String lat = flatItem.locationOnMap.split(" ").first;
                              String lon = flatItem.locationOnMap.split(" ").last;
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>FlatMap(latitude: lat, longitude: lon)));
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.location_on,
                                    color: Color(0xff1f95a1),
                                  ),
                                  Text(
                                    flatItem.location,
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ),


                              GestureDetector(
                                onTap: () async {
                                  if (true) {
                                    showDialog(
                                        context: context,
                                        barrierDismissible: true,
                                        builder: (context) => Container(
                                          child: Dialog(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                BorderRadius.circular(15)),
                                            elevation: 16,
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.circular(5),
                                              child: Container(
                                                width: 100,
                                                height: 150,
                                                child: Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                                  children: [
                                                    Column(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                      children: [
                                                        IconButton(
                                                          onPressed: () {
                                                            launcApp(0,flatItem.phoneNumber.toString());
                                                          },
                                                          icon: Icon(Icons.whatsapp),
                                                          iconSize: 50,
                                                          color: Color(0xff1f95a1),
                                                        ),
                                                        Text(
                                                          "Whatsapp",
                                                          style: TextStyle(
                                                              fontWeight:
                                                              FontWeight.bold,
                                                              fontSize: 20),
                                                        )
                                                      ],
                                                    ),
                                                    Column(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                      children: [
                                                        IconButton(
                                                          onPressed: () {
                                                            launcApp(1,flatItem.phoneNumber.toString());
                                                          },
                                                          icon: Icon(Icons.phone),
                                                          iconSize: 50,
                                                          color: Color(0xff1f95a1),
                                                        ),
                                                        Text(
                                                          "Phone",
                                                          style: TextStyle(
                                                              fontWeight:
                                                              FontWeight.bold,
                                                              fontSize: 20),
                                                        )
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ));
                                  }
                                },
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.phone,
                                      color: Color(0xff1f95a1),
                                    ),
                                    Text(
                                      "Phone",
                                      style: TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              )



                        ],
                      ),

                    ],
                  ) ,
                ),
              ),
            ),
            SizedBox(height: 20,),
           Text("Facilities",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
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
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Container(
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0,right: 8,top: 15,bottom: 15),
                        child: Column(
                          children: [
                            Icon(Icons.bedroom_parent_sharp,color: Color(0xff1f95a1),),
                            Text(flatItem.bedrooms.toString()+" Bedrooms"),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
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
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Container(
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0,right: 8,top: 15,bottom: 15),
                        child: Column(
                          children: [
                            Icon(Icons.bedroom_parent_sharp,color: Color(0xff1f95a1),),
                            Text(flatItem.bed.toString()+" Beds"),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
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
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Container(
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0,right: 8,top: 15,bottom: 15),
                        child: Column(
                          children: [
                            Icon(Icons.bathtub,color: Color(0xff1f95a1),),
                            Text(flatItem.bathroom.toString()+" Bathroom"),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),

              ],
            ),
            SizedBox(height: 20,),
            Text("Amenities",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
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
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Container(
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0,right: 8,top: 15,bottom: 15),
                        child: Column(
                          children: [
                            Icon(Icons.wifi,color: Color(0xff1f95a1),),
                            Text(flatItem.wifi==true ? "WiFi" : "None"),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
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
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Container(
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0,right: 8,top: 15,bottom: 15),
                        child: Column(
                          children: [
                            Icon(Icons.tv,color: Color(0xff1f95a1),),
                            Text(flatItem.tv==true ? "Tv": "None"),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
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
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Container(
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0,right: 8,top: 15,bottom: 15),
                        child: Column(
                          children: [
                            Icon(Icons.airplay,color: Color(0xff1f95a1),),
                            Text(flatItem.cond==true ? "Ac" : "None"),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),

              ],
            ),
            SizedBox(height: 20,),
            Text("Description",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
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
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Container(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Text(flatItem.description),
                  ),
                ),
              ),
            ),



          ],
        ),
      ),
      bottomNavigationBar:  BottomAppBar(
        child: Container(
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Text(flatItem.price.toString()+" LE",style: TextStyle(color: Color(0xff1f95a1),fontSize: 25,fontWeight: FontWeight.bold),),
                ),
                RaisedButton(

                  color: Color(0xff1f95a1), // background
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)), // foreground
                  onPressed: () {
                    if(true)
                    {
                      showDialog(
                          context: context,
                          barrierDismissible: true ,
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
                                         padding: const EdgeInsets.only(top: 50,left: 50,right: 50,bottom: 20),
                                         child: Image.asset(
                                          "images/bookOrNot.png",
                                          fit: BoxFit.cover,


                                    ),
                                       ),
                                    Text(
                                      "Are You sure you want  ",
                                      style: TextStyle(
                                          fontSize: 19,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "to book this flat  ? ",
                                      style: TextStyle(
                                          fontSize: 19,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(15),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                        Material(
                                          borderRadius: BorderRadius.circular(10.0),
                                          color: Color(0xff1f95a1),
                                          child: MaterialButton(
                                            child: Text(
                                              'Yes',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20,
                                              ),
                                            ),
                                            onPressed: () {
                                                    Navigator.pushNamed(context, DataAboutYou.routeName);
                                            },
                                          ),
                                        ),
                                        Material(
                                          borderRadius: BorderRadius.circular(10.0),
                                          color: Color(0xff2f2e41),
                                          child: MaterialButton(
                                            child: Text(
                                              'No',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20,
                                              ),
                                            ),
                                            onPressed: () {
                                              Navigator.of(context,rootNavigator: true).pop();

                                            },
                                          ),
                                        ),
                                      ],),
                                    ),

                                  ],
                                ),
                              ),
                            ),
                          ));
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(top: 5.0,bottom: 5, left: 15,right: 15),
                    child: Text("Book Now",style: TextStyle(color: Colors.white ,fontSize: 25),),
                  ),
                  padding: EdgeInsets.only(top: 8,bottom: 8),
                ),
              ],
            ),
          ),
        ),
      ),



    );
  }
}
