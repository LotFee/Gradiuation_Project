import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sakkeny/providers/Flats.dart';
import 'package:sakkeny/providers/flat.dart';
import 'package:sakkeny/screens/flat_details.dart';


class FlatItem extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
   final flat= Provider.of<Flat>(context,listen: false);
    return Padding(
        padding: const EdgeInsets.all(5.0),
        child: GridTile(
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
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                color: Colors.white,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0,left: 8),
                              child: CircleAvatar(
                                backgroundColor: Colors.white,
                                foregroundImage: NetworkImage(flat.userImage,) ,
                                radius: 25,
                              ),
                            ),
                            SizedBox(
                              width: 3,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  flat.userName,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17),
                                ),
                                Text(
                                  "Owner",
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Text(
                          flat.time.hour.toString() + " Ago",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Image(
                      height: 200,
                      image: NetworkImage(flat.images[0]),
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
              ),
            ),
          ),
          footer: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              height: 120,
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                             Column(children: [
                               Row(children: [
                                 Icon(
                                 Icons.location_on,
                                 color: Color(0xff1f95a1),
                               ),
                                 Text(
                                   flat.location,
                                   style: TextStyle(fontWeight: FontWeight.bold),
                                 ),

                               ],),
                               Text(
                                 "    " + flat.price.toString() + " LE",
                                 style: TextStyle(
                                     color: Color(0xff1f95a1),
                                     fontWeight: FontWeight.bold,
                                     fontSize: 20),
                               ),
                             ],),

                          ],
                        ),
                        RaisedButton(
                          color: Color(0xff1f95a1), // background
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(7)), // foreground
                          onPressed: () {
                            Navigator.of(context).pushNamed(FlatDetails.routeName,arguments: flat.id);
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(top: 5,bottom: 5,left: 13,right: 13),
                            child: Text(
                              "More details",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                          padding: EdgeInsets.only(top: 8, bottom: 8),
                        ),

                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            color: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 8.0,bottom: 8,left: 25,right: 25),
                              child: Consumer<Flat>(
                                builder: (context,flat,child)=>GestureDetector(
                                  onTap: (){
                                    flat.toggleFavState();
                                  },
                                  child: Row(
                                    children: [
                                      Icon(
                                        flat.isFav? Icons.favorite :  Icons.favorite_border,
                                        color: Color(0xff1f95a1),

                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        "Like",
                                        style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                ),

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
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            color: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 8.0,bottom: 8.0,left: 15,right: 15),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.comment_bank_outlined,
                                    color: Color(0xff1f95a1),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "Comment",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
