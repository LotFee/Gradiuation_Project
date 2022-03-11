import 'package:flutter/material.dart';

class SearchFilter extends StatefulWidget {
  static const String routeName = 'search';

  @override
  State<SearchFilter> createState() => _SearchFilterState();
}

class _SearchFilterState extends State<SearchFilter> {
  bool checkBoxValueWifi = false;
  bool checkBoxValueTv = false;
  bool checkBoxValueCond = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        child: ListTile(
          leading: Material(
            borderRadius: BorderRadius.circular(15.0),
            color: Color(0xff1f95a1),
            child: MaterialButton(
              minWidth: 30,
              child: Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          title: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Color(0xffe7e7e7),
                  blurRadius: 1,
                ),
              ],
            ),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child:
              TextFormField(
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                  errorBorder: new OutlineInputBorder(
                    borderSide: new BorderSide(color: Colors.white, width: 0.0),
                  ),
                  focusedErrorBorder: new OutlineInputBorder(
                    borderSide: new BorderSide(color: Colors.white, width: 0.0),
                  ),
                  suffixIcon: GestureDetector(
                    onTap:(){

                        showDialog(
                            context: context,
                            barrierDismissible: true,
                            builder: (context) => SingleChildScrollView(
                              child: StatefulBuilder(
                                builder: (context,setState)=> Dialog(

                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15)),
                                  elevation: 16,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(5),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 14.0),
                                      child: Container(
                                        width: 600,
                                        height: 600,
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              "Search with",
                                              style: TextStyle(
                                                  color: Color(0xff1f95a1),
                                                  fontSize: 19,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(height: 20,),
                                            Container(
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(15),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Color(0xffe7e7e7),
                                                    blurRadius: 1,
                                                  ),
                                                ],
                                              ),
                                              child: Card(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(15),
                                                ),
                                                child:
                                                TextFormField(
                                                  keyboardType: TextInputType.text,
                                                  textInputAction: TextInputAction.done,
                                                  decoration: InputDecoration(
                                                    errorBorder: new OutlineInputBorder(
                                                      borderSide: new BorderSide(color: Colors.white, width: 0.0),
                                                    ),
                                                    focusedErrorBorder: new OutlineInputBorder(
                                                      borderSide: new BorderSide(color: Colors.white, width: 0.0),
                                                    ),
                                                    prefixIcon: Icon(
                                                      Icons.location_on_rounded,
                                                      color: Color(0xff1f95a1),
                                                    ),
                                                    labelStyle: TextStyle(color: Color(0xff1f95a1)),
                                                    focusedBorder: OutlineInputBorder(
                                                      borderSide: BorderSide(color: Color(0xffe7e7e7)),
                                                    ),
                                                    border: OutlineInputBorder(
                                                      borderRadius: BorderRadius.circular(15),
                                                      borderSide: BorderSide(color: Color(0xffe7e7e7)),
                                                    ),
                                                    hintText: "location",
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(height: 10,),
                                            Container(
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(15),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Color(0xffe7e7e7),
                                                    blurRadius: 1,
                                                  ),
                                                ],
                                              ),
                                              child: Card(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(15),
                                                ),
                                                child:
                                                TextFormField(
                                                  keyboardType: TextInputType.text,
                                                  textInputAction: TextInputAction.done,
                                                  decoration: InputDecoration(
                                                    errorBorder: new OutlineInputBorder(
                                                      borderSide: new BorderSide(color: Colors.white, width: 0.0),
                                                    ),
                                                    focusedErrorBorder: new OutlineInputBorder(
                                                      borderSide: new BorderSide(color: Colors.white, width: 0.0),
                                                    ),
                                                    prefixIcon: Icon(
                                                      Icons.price_change_outlined,
                                                      color: Color(0xff1f95a1),
                                                    ),
                                                    labelStyle: TextStyle(color: Color(0xff1f95a1)),
                                                    focusedBorder: OutlineInputBorder(
                                                      borderSide: BorderSide(color: Color(0xffe7e7e7)),
                                                    ),
                                                    border: OutlineInputBorder(
                                                      borderRadius: BorderRadius.circular(15),
                                                      borderSide: BorderSide(color: Color(0xffe7e7e7)),
                                                    ),
                                                    hintText: "Enter the price",
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(height: 10,),
                                            Container(
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(15),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Color(0xffe7e7e7),
                                                    blurRadius: 1,
                                                  ),
                                                ],
                                              ),
                                              child: Card(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(15),
                                                ),
                                                child:
                                                TextFormField(
                                                  keyboardType: TextInputType.text,
                                                  textInputAction: TextInputAction.done,
                                                  decoration: InputDecoration(
                                                    errorBorder: new OutlineInputBorder(
                                                      borderSide: new BorderSide(color: Colors.white, width: 0.0),
                                                    ),
                                                    focusedErrorBorder: new OutlineInputBorder(
                                                      borderSide: new BorderSide(color: Colors.white, width: 0.0),
                                                    ),
                                                    prefixIcon: Icon(
                                                      Icons.king_bed,
                                                      color: Color(0xff1f95a1),
                                                    ),
                                                    labelStyle: TextStyle(color: Color(0xff1f95a1)),
                                                    focusedBorder: OutlineInputBorder(
                                                      borderSide: BorderSide(color: Color(0xffe7e7e7)),
                                                    ),
                                                    border: OutlineInputBorder(
                                                      borderRadius: BorderRadius.circular(15),
                                                      borderSide: BorderSide(color: Color(0xffe7e7e7)),
                                                    ),
                                                    hintText: "Enter the number of beds ",
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(height: 10,),
                                            Container(
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(15),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Color(0xffe7e7e7),
                                                    blurRadius: 1,
                                                  ),
                                                ],
                                              ),
                                              child: Card(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(15),
                                                ),
                                                child:
                                                TextFormField(
                                                  keyboardType: TextInputType.text,
                                                  textInputAction: TextInputAction.done,
                                                  decoration: InputDecoration(
                                                    errorBorder: new OutlineInputBorder(
                                                      borderSide: new BorderSide(color: Colors.white, width: 0.0),
                                                    ),
                                                    focusedErrorBorder: new OutlineInputBorder(
                                                      borderSide: new BorderSide(color: Colors.white, width: 0.0),
                                                    ),
                                                    prefixIcon: Icon(
                                                      Icons.bathtub_outlined,
                                                      color: Color(0xff1f95a1),
                                                    ),
                                                    labelStyle: TextStyle(color: Color(0xff1f95a1)),
                                                    focusedBorder: OutlineInputBorder(
                                                      borderSide: BorderSide(color: Color(0xffe7e7e7)),
                                                    ),
                                                    border: OutlineInputBorder(
                                                      borderRadius: BorderRadius.circular(15),
                                                      borderSide: BorderSide(color: Color(0xffe7e7e7)),
                                                    ),
                                                    hintText: "Enter the number of bathrooms",
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(height: 10,),
                                            Column(
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                                                  child: Row(
                                                    children: [
                                                      Checkbox(
                                                          activeColor: Color(0xFF1F95A1),
                                                          value: checkBoxValueWifi,
                                                          onChanged: (bool? value) {
                                                            setState(() {
                                                              checkBoxValueWifi = !checkBoxValueWifi;
                                                            });
                                                          }),
                                                      // title: Text('Remember me'),
                                                      Text('wifi')
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                                                  child: Row(
                                                    children: [
                                                      Checkbox(
                                                        activeColor: Color(0xFF1F95A1),
                                                        value: checkBoxValueTv,
                                                        onChanged: (bool? value) {
                                                          setState(
                                                                () {
                                                              checkBoxValueTv = value!;
                                                            },
                                                          );
                                                        },
                                                      ),
                                                      // title: Text('Remember me'),
                                                      Text('Tv')
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                                                  child: Row(
                                                    children: [
                                                      Checkbox(
                                                        activeColor: Color(0xFF1F95A1),
                                                        value: checkBoxValueCond,
                                                        onChanged: (bool? value) {
                                                          setState(
                                                                () {
                                                              checkBoxValueCond = value!;
                                                            },
                                                          );
                                                        },
                                                      ),
                                                      // title: Text('Remember me'),
                                                      Text('Conditioner')
                                                    ],
                                                  ),
                                                ),
                                              ],
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
                                                onPressed: () {},
                                                child: Padding(
                                                  padding:
                                                  const EdgeInsets.all(10.0),
                                                  child: Text(
                                                    "Search",
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
                                  ),
                                ),
                              ),
                            ));


                      
                     },
                    child: Icon(
                      Icons.filter_list_outlined,
                      color: Color(0xff1f95a1),
                    ),
                  ),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Color(0xff1f95a1),
                  ),
                  labelStyle: TextStyle(color: Color(0xff1f95a1)),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xffe7e7e7)),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: Color(0xffe7e7e7)),
                  ),
                  hintText: "Search",
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
