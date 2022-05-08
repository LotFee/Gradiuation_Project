import 'dart:convert';

import 'package:comment_box/comment/comment.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'package:provider/provider.dart';

import '../providers/Flats.dart';

class Comments extends StatefulWidget {
  static const routeName = 'Comments';

  @override
  _CommentsState createState() => _CommentsState();
}

class _CommentsState extends State<Comments> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController commentController = TextEditingController();
  String flatID='';
  List filedata = [
    {
      'name': 'Adeleye Ayodeji',
      'pic': 'https://picsum.photos/300/30',
      'message': 'I love to code'
    },
    {
      'name': 'Biggi Man',
      'pic': 'https://picsum.photos/300/30',
      'message': 'Very cool'
    },
    {
      'name': 'Biggi Man',
      'pic': 'https://picsum.photos/300/30',
      'message': 'Very cool'
    },
    {
      'name': 'Biggi Man',
      'pic': 'https://picsum.photos/300/30',
      'message': 'Very cool'
    },
  ];

  Widget commentChild(data) {
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
                      foregroundImage: NetworkImage(data[i]['pic'],)

                  ),

                ),
              ),
              // NetworkImage(data[i]['pic'] + "$i")
              title: Text(
                data[i]['name'],
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(data[i]['message']),
            ),
          )
      ],
    );
  }
  var  _isInit = true;
  var _isLoading=false;
  @override

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    if(_isInit){
      setState(() {
        _isLoading=true;
      });

      Future<void> getComments () async{
        try {
          final flatId = ModalRoute.of(context)!.settings.arguments as String;


          String url = "https://afternoon-ridge-73830.herokuapp.com/posts/getComments/$flatId";
          final response =   await http.get(Uri.parse(url));
          final extractData = jsonDecode(response.body);
          if(response.statusCode==200)
          {

            print(extractData['comment']);
             var i = extractData['comment'].length;
            //  print(extractData['Dpost'][0][0]['ownerId']);
            List loadedComments=[];
             for(var j =0 ; j < i ; j++)
             {
               var map = {};

               map['name'] = extractData['comment'][j][1];
               map['pic']= extractData['comment'][j][2];
               print(extractData['comment'][j][2]);
               map['message']=extractData['comment'][j][0]['comment'];
               loadedComments.add(map);
             }
            //
             filedata=loadedComments;
            //  print(loadedFlats.length.toString());
            //
            // // print(extractData);
          }

        }catch(error){

          throw(error.toString());
        }
      }
      getComments().then((_){setState(() {
        _isLoading=false;
      });});


    }
    _isInit =false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Comments"),
        backgroundColor: Color(0xff1f95a1),
      ),
      body: Container(
        child: CommentBox(
          userImage:
          "https://lh3.googleusercontent.com/a-/AOh14GjRHcaendrf6gU5fPIVd8GIl1OgblrMMvGUoCBj4g=s400",
          child: _isLoading ? Center(child: CircularProgressIndicator(color:Color(0xff1f95a1) ,),) :  commentChild(filedata),
          labelText: 'Write a comment...',
          withBorder: false,
          errorText: 'Plz Enter Your Comment',
          sendButtonMethod: () {
            if (formKey.currentState!.validate()) {
              print(commentController.text);
              setState(() {
                var value = {
                  'name': 'New User',
                  'pic':
                  'https://lh3.googleusercontent.com/a-/AOh14GjRHcaendrf6gU5fPIVd8GIl1OgblrMMvGUoCBj4g=s400',
                  'message': commentController.text
                };
                filedata.insert(0, value);
              });
              commentController.clear();
              FocusScope.of(context).unfocus();
            } else {
              print("Not validated");
            }
          },
          formKey: formKey,
          commentController: commentController,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          sendWidget: Icon(Icons.send_sharp, size: 30, color: Colors.white),
        ),
      ),
    );
  }


}