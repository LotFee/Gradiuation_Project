import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sakkeny/screens/addPost/addOne.dart';
import 'package:sakkeny/widget/bottomBar.dart';
import 'package:sakkeny/widget/drawer.dart';
import 'package:sakkeny/screens/search/search and filter.dart';
import 'package:http/http.dart'as http;
import 'dart:convert';

import '../provider/current_user.dart';

class NotiScreen extends StatefulWidget {

  @override
  State<NotiScreen> createState() => _NotiScreenState();
}

class _NotiScreenState extends State<NotiScreen> {
  var  _isInit = true;
  var _isLoading=false;
  @override
  void initState() {
    super.initState();
  }
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    if(_isInit){
      setState(() {
        _isLoading=true;
      });

    }
    Future<void> getNotifi() async{
      try {

        final currentuser = Provider.of<CurrentUserData>(context, listen: false);
        String url = "https://afternoon-ridge-73830.herokuapp.com/posts/getNotification/${currentuser.currentUserDate.id}";
        final response =   await http.get(Uri.parse(url));
        final List extractData = jsonDecode(response.body);
        print(extractData);
        if(response.statusCode==200)
        {
          var i  =extractData.length;
          print(extractData.length);
          List loadedComments=[];
          for(var j =0 ; j < i ; j++)
          {
            var map = {};

            map['_id'] = extractData[j]['_id'];
            map['senderId']= extractData [j]['senderId'];
            map['receiverId']=extractData [j]['receiverId'];
            map['name']=extractData[j]['name'];
            map['urlImage']=extractData[j]['urlImage'];
            map['text']=extractData[j]['text'];
            map['time']=extractData[j]['time'];
            map['timeAgo']=extractData[j]['timeAgo'];
            loadedComments.add(map);
          }
          setState(() {
            filedata=loadedComments;
          });


        }

      }catch(error){

        throw(error.toString());
      }
    }
    getNotifi().then((_) {setState(() {
      _isLoading=false;
    });} );
    _isInit =false;
    super.didChangeDependencies();
  }
  List filedata = [
    {
      '_id': '0',
      'senderId': '0',
      'receiverId': '0',
      'name' : 'No Notification Yet',
      'urlImage' :'https://picsum.photos/300/30',
      'text' : 'u will be notified if there come ',
      'time' : '0',
      'timeAgo' : '0',

    },

  ];
  Widget notifyChild(List data) {
    return ListView(
      children: [
        for (var i = 0; i < data.length; i++)
          Padding(
            padding: const EdgeInsets.fromLTRB(2.0, 8.0, 2.0, 0.0),
            child: ListTile(
              leading: GestureDetector(
                onTap: () async {
                  // Display the image in large form.
                  print("Comment Clicked");
                },
                child: Container(
                  height: 50.0,
                  width: 50.0,
                  decoration: new BoxDecoration(
                      color: Colors.blue,
                      borderRadius: new BorderRadius.all(Radius.circular(50))),
                  child: CircleAvatar(
                      radius: 50,
                      // backgroundImage:   NetworkImage(data[i]['pic'] + "$i") ,
                      foregroundImage: NetworkImage(data[i]['urlImage'],)

                  ),

                ),
              ),
              // NetworkImage(data[i]['pic'] + "$i")
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    data[i]['name'] ,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    data[i]['timeAgo'] ,
                    style: TextStyle(color: Colors.grey,fontSize: 12),
                  )
                ],
              ),
              subtitle: Text(data[i]['text']),
            ),
          )
      ],
    );
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
          title: Center(child: Text("Notifications", style: TextStyle(color:Color(0xff1f95a1),fontWeight: FontWeight.bold ),)),
          actions: [
            GestureDetector(onTap: (){
              Navigator.push(context,PageRouteBuilder(
                pageBuilder: (context, animation1, animation2) => SearchFilter(),
                transitionDuration: Duration.zero,
              ),);
            },child: Icon(Icons.search,color: Color(0xff1f95a1),size: 35)),
          ],
        ),
        drawer: myDrawer(),
        body: _isLoading ? Center(child: CircularProgressIndicator(color:Color(0xff1f95a1) ,),) :  notifyChild(filedata),
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


        bottomNavigationBar: myBottomBar(index: 2,),

      ),
    );
  }

}