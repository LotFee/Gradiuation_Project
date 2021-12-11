import 'package:flutter/material.dart';


class HalfStep extends StatelessWidget {


  final String stepImage;
  final int index  ;

  HalfStep(this.stepImage , this.index);


  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(

        child: ClipRRect(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(20.0),
              bottomLeft: Radius.circular(20.0)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Center(
                  child: Text(
                    "Sakkeny",
                    style: TextStyle(
                        color: Color(0xff1f95a1),
                        fontSize: 40,
                        fontWeight: FontWeight.bold),
                  )),
              SizedBox(
                height: 20,
              ),
              Image.asset(
                stepImage,
                fit: BoxFit.cover,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Sakkeny Application  will help you to find your flat ',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: index==1 ?   Color(0xff1f95a1)   : Colors.black26 ,
                        )),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                          color: index==1 ?   Color(0xff1f95a1)   : Colors.black26,
                          shape: BoxShape.circle),
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Container(
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: index==2 ?   Color(0xff1f95a1)   : Colors.black26,
                        )),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                         color: index==2 ?   Color(0xff1f95a1)   : Colors.black26,
                          shape: BoxShape.circle),
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Container(
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: index==3 ?   Color(0xff1f95a1)   : Colors.black26,
                        )),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                          color: index==3 ?   Color(0xff1f95a1)   : Colors.black26,
                          shape: BoxShape.circle),
                    ),
                  ),
                ],
              ),

              SizedBox(
                height: 10,
              ),
              Container(
                width: double.infinity,
                height: 10,
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}