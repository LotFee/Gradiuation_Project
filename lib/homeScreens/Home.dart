import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sakkeny/provider/current_user.dart';
import 'package:sakkeny/screens/addPost/addOne.dart';
import 'package:sakkeny/screens/search/search%20and%20filter.dart';
import 'package:sakkeny/widget/bottomBar.dart';
import 'package:sakkeny/widget/drawer.dart';
import 'package:sakkeny/widget/flats_grid.dart';
import 'package:provider/provider.dart';
import 'package:sakkeny/provider/Flats.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  static const String routeName = 'home';

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var  _isInit = true;
  var _isLoading=false;
  @override
  void initState() {
   // Provider.of<Flats>(context).getPosts();
    super.initState();
  }
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    if(_isInit){
      setState(() {
        _isLoading=true;

      });

      Provider.of<Flats>(context).getPosts(context).then((_) {

        setState(() {

          _isLoading=false;
        });

      });

      // get user data
      Provider.of<CurrentUserData>(context).getUserData(context);
    }
    _isInit =false;
    super.didChangeDependencies();
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
          systemOverlayStyle: SystemUiOverlayStyle(statusBarColor:Color(0xff1f95a1) ),
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
          title: Center(
              child: Text(
            "Home",
            style: TextStyle(
                color: Color(0xff1f95a1), fontWeight: FontWeight.bold),
          )),
          actions: [
            GestureDetector(
              onTap: () {
                Navigator.push(context,PageRouteBuilder(
                  pageBuilder: (context, animation1, animation2) => SearchFilter(),
                  transitionDuration: Duration.zero,
                ),);
              },
              child: Icon(Icons.search, color: Color(0xff1f95a1), size: 35),
            ),
          ],
        ),
        body: _isLoading ? Center(child: CircularProgressIndicator(color:Color(0xff1f95a1) ,),) :  RefreshIndicator(
            backgroundColor:Color(0xff1f95a1) ,
            color: Colors.white,
            onRefresh: () async {
              await Future.delayed(Duration(seconds: 2));
              setState(() {
                FlatsGrid(index: 0,);
              });
            },
            child: FlatsGrid(index: 0)),
        drawer: myDrawer(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushReplacement(context,PageRouteBuilder(
              pageBuilder: (context, animation1, animation2) => AddOne(),
              transitionDuration: Duration.zero,
            ),);
          },
          backgroundColor: Color(0xff1f95a1),
          child: Icon(Icons.add), //icon inside button
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: myBottomBar(
          index: 0,
        ),
      ),
    );
  }
}
