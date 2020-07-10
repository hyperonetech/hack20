import 'package:Hack20/pages/FadeAnimation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  int container_state=0;
  @override
  Widget build(BuildContext context) {
    double w=MediaQuery.of(context).size.width ;
    double h=MediaQuery.of(context).size.height ;

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned(
            top: h*0.15,
            width: w*0.7,
            height: h*0.3,
            left: w*0.15,
            child: FadeAnimation(0.3,
              Image(
                image: AssetImage(
                    'assets/login.png'
                ),

              ),
            ),
          ),
          Positioned(
            top: h*0.47,
            height: h*0.5,
            left: w*0.1,
            width: w*0.8,
            child: Container(


              child: Column(
                children: <Widget>[
                  FadeAnimation(

                      0.6, Text(
                    "Acces Acount",style: TextStyle(
                      fontWeight: FontWeight.bold,fontSize: 24
                  ),
                  ))
                  ,SizedBox(height: 20,),
                  FadeAnimation(

                      0.9,TextField(
                    onChanged: (text) {
                      if (text.length>=2) {
                        setState(() {
                          // displaycontainer();
                          container_state=1;
                          print("greater then 2");
                          print(container_state);
                        });
                      } else {
                        setState(() {
                          //doSomethingelse();
                          container_state=0;

                        });
                      }

                    },
                  ))
                  ,SizedBox(height: 40,),
                  container_state==1?FadeAnimation(

                      1.2,InkWell(
                    onTap: (){},
                    child: Container(

                      width: w,
                      decoration: BoxDecoration(
                          color: Colors.black54.withOpacity(0.07),
                          borderRadius: BorderRadius.circular(10)

                      ),
                      height: h*0.15,

                      child: Center(

                        child: Text("this is container that you want to display",style: TextStyle(
                            fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black54
                        ),),
                      ),
                    ),
                  )
                  ):Container(),SizedBox(height: 20,),
                  FadeAnimation(
                      1.4,InkWell(
                    onTap: (){},
                    child: Container(
                      width: w,
                      decoration: BoxDecoration(
                          color: Colors.black54.withOpacity(0.07),
                          borderRadius: BorderRadius.circular(10)

                      ),
                      height: h*0.07,

                      child: Center(

                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,

                          children: <Widget>[
                            Icon(
                              Icons.account_box,size: 20,color: Colors.blueAccent,
                            ),
                            SizedBox(
                              width: 25,
                            ),
                            Text("Continue with Twitter",style: TextStyle(
                                fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black54
                            ),),
                          ],
                        ),
                      ),
                    ),
                  )
                  ),


                ],
              ),
            ),
          )
        ],

      ),
    );
  }
}
