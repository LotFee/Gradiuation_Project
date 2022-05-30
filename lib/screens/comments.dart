import 'dart:convert';

import 'package:comment_box/comment/comment.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'package:provider/provider.dart';

import '../provider/current_user.dart';
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
      'name': 'No Commented Yet',
      'pic': 'https://picsum.photos/300/30',
      'message': 'Add the first Comment',
     // 'timeAgo' : ''
    },

  ];

  Widget commentChild(List data,String id) {
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
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    data[i]['name'] ,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    data[i]['timeAgo'] ,
                    style: TextStyle(color: Colors.grey,fontSize: 10),
                  ),
                  data[i]['ownerId']== id ? PopupMenuButton(

                    onSelected: ( v) async{
                      print(v);
                      if(v=='Delete')  {
                        final http.Response response = await http.delete(
                          Uri.parse
                            ('https://afternoon-ridge-73830.herokuapp.com/posts/deleteComment/${data[i]['id']}/$id'),
                          headers: <String, String>{
                            'Content-Type': 'application/json; charset=UTF-8',
                          },
                        );
                        print(response.statusCode);
                        if(response.statusCode==200){
                          print(response.body);

                        }

                      }

                    },
                    itemBuilder: (context) => [

                      PopupMenuItem(
                        child: Text('Delete'),
                        value: 'Delete',

                      ),
                    ],
                    icon: Icon(Icons.keyboard_arrow_down),
                  ) : Text(""),
                ],
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
          final flatId = ModalRoute.of(context)?.settings.arguments as String?;


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
              map['message']=extractData['comment'][j][0]['comment'];
              map['id']=extractData['comment'][j][0]['_id'];
              map['ownerId']=extractData['comment'][j][0]['ownerId'];
              map['timeAgo']=extractData['comment'][j][0]['timeAgo'];
              print(extractData['comment'][j][0]['_id']);
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

    final currentuser = Provider.of<CurrentUserData>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text("Comments"),
        backgroundColor: Color(0xff1f95a1),
      ),
      body: Container(
        child: CommentBox(
          userImage: currentuser.currentUserDate.img
          ,
          child: _isLoading ? Center(child: CircularProgressIndicator(color:Color(0xff1f95a1) ,),) :  commentChild(filedata,currentuser.currentUserDate.id),
          labelText: 'Write a comment...',
          withBorder: false,
          errorText: 'Plz Enter Your Comment',
          sendButtonMethod: () {
            final currentuser = Provider.of<CurrentUserData>(context, listen: false);
            final flatId = ModalRoute.of(context)?.settings.arguments as String?;
            Future<void> addComment(String comment) async {

              final response = await http.post(
                Uri.parse('https://afternoon-ridge-73830.herokuapp.com/posts/addComment/${flatId}/${currentuser.currentUserDate.id}'),
                headers: <String, String>{
                  'Content-Type': 'application/json; charset=UTF-8',
                },
                body: jsonEncode(<String, String>{
                  'comment': comment,
                }),
              );
              if(response.statusCode==200){
                print('comment added');
              }
              else{
                throw Exception('Failed to add comment');
              }



            }
            if (formKey.currentState!.validate()) {
              addComment(commentController.text);
              print(commentController.text);
              var value = {
                'name': currentuser.currentUserDate.fName  + currentuser.currentUserDate.lName,
                'pic':
                currentuser.currentUserDate.img,
                'message': commentController.text,
                'timeAgo' : '1 munite ago '
              };
              setState(() {
                filedata.insert(0, value);
              });
              commentController.clear();
              FocusScope.of(context).unfocus();
            } else {
              print("Not validated");
            }
           // Navigator.pop(context);
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