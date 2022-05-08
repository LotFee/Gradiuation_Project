import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sakkeny/provider/current_user.dart';
import 'package:sakkeny/providers/Flats.dart';
import 'package:sakkeny/providers/flat.dart';
import 'package:sakkeny/screens/comments.dart';
import 'package:sakkeny/screens/flat_details.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart'as http;
import 'dart:math';

import 'package:flutter_blurhash/flutter_blurhash.dart';

import '../screens/Update Post.dart';
class FlatItem extends StatefulWidget {


  @override
  State<FlatItem> createState() => _FlatItemState();
}

class _FlatItemState extends State<FlatItem> {
  var  _expanded=false;
  @override
  Widget build(BuildContext context) {
   final flat= Provider.of<Flat>(context,listen: false);
   final currentUser = Provider.of<CurrentUserData>(context,listen: false);
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
                                backgroundColor: Colors.black,
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
                                      fontSize: 15),
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
                        currentUser.currentUserDate.id == flat.ownerId ? PopupMenuButton(

                          onSelected: ( v) async{
                            print(v);
                             if(v=='Delete')  {
                               final http.Response response = await http.delete(
                                 Uri.parse
                                   ('https://afternoon-ridge-73830.herokuapp.com/posts/${flat.id}/${flat.ownerId}'),
                                 headers: <String, String>{
                                   'Content-Type': 'application/json; charset=UTF-8',
                                 },
                               );
                               if(response.statusCode==200){
                                 print(response.body);
                               }

                             }
                             if(v=='Edit'){
                               Navigator.of(context).pushNamed(UpdatePost.routeName,arguments: flat.id);
                             }
                          },
                          itemBuilder: (context) => [
                            PopupMenuItem(
                              child: Text('Edit'),
                              value: 'Edit',
                            ),
                            PopupMenuItem(
                              child: Text('Delete'),
                              value: 'Delete',

                            ),
                          ],
                          icon: Icon(Icons.keyboard_arrow_down),
                        ) : Text('')
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                      // CachedNetworkImage(
                      //   placeholder: (context, url) =>
                      //   const CircularProgressIndicator(color:Color(0xff1f95a1) ,),
                      //   imageUrl: 'http://res.cloudinary.com/egyptegypt/image/upload/v1651232733/krxk6u7qq1iy0ubae14e.jpg',
                      //   fit: BoxFit.cover,
                      //   errorWidget: (context, url, error) =>
                      //       Icon(Icons.error,color: Colors.red,),
                      // ),
                      Image.network(flat.images[0],fit: BoxFit.cover,),
                    // Image(
                    //   height: 200,
                    //   image: NetworkImage(flat.images[0]),
                    //   fit: BoxFit.cover,
                    // ),
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
                                   flat.location.length<20 ? flat.location : flat.location.substring(0,15) +'...' ,
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
                          child: GestureDetector(
                            onTap: (){
                              setState(() {
                                _expanded=!_expanded;
                                Navigator.pushNamed(context, Comments.routeName,arguments: flat.id);
                              });
                            },
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
                                      "${flat.noComments}",
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
                    ],
                  ),


                ],
              ),
            ),
          ),
        ));
  }
}
