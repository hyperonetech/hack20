import 'package:Hack20/models/step_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:Hack20/styles/colors.dart';
import 'FadeAnimation.dart';
class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  List<StepModel> list = StepModel.list;
  var _controller = PageController();
  var initialPage = 0;

  @override
  Widget build(BuildContext context) {
    double w=MediaQuery.of(context).size.width * 1;
    double h=MediaQuery.of(context).size.height * 1;
    _controller.addListener(() {
      setState(() {
        initialPage = _controller.page.round();
      });
    });

    return Scaffold(
      extendBodyBehindAppBar: true,

      body: Column(
        children: <Widget>[
          _appBar(),
          _body(_controller),
          _indicator(),
        ],
      ),
    );
  }

  _appBar() {
    return  FadeAnimation(0.3, Container(
        margin: EdgeInsets.only(top: 25),
        padding: EdgeInsets.all(12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            GestureDetector(
              onTap: () {
                if (initialPage > 0)
                  _controller.animateToPage(initialPage - 1,
                      duration: Duration(microseconds: 500),
                      curve: Curves.easeIn);
              },
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.grey.withAlpha(50),
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
                child: Icon(Icons.arrow_back_ios),
              ),
            ),
            FlatButton(
              onPressed: () {
                if (initialPage < list.length)
                  _controller.animateToPage(list.length,
                      duration: Duration(microseconds: 500),
                      curve: Curves.easeInOut);
              },
              child: Text(
                "Skip",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _body(PageController controller) {
    return Expanded(
      child: PageView.builder(
        controller: controller,
        itemCount: list.length,
        itemBuilder: (context, index) {
          return Column(
            children: <Widget>[

                _displayImage(list[index].id),
              SizedBox(
                height: 25,
              ),

             _displayText(list[index].title,list[index].text),
            ],
          );
        },
      ),
    );
  }

  _indicator() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 90,
      margin: EdgeInsets.symmetric(vertical: 12),
      child: Stack(
        children: <Widget>[
          Positioned(
            bottom: 0,
            left: MediaQuery.of(context).size.width*0.30,
            child: Align(
              alignment: Alignment.center,
              child: Container(
                width:MediaQuery.of(context).size.width*0.4,
                height: 5,
                child:  LinearProgressIndicator(backgroundColor: Colors.black38,
                  valueColor: AlwaysStoppedAnimation(Colors.blue),
                  value: (initialPage +1) / (list.length ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: Align(

              alignment: Alignment.center,
              child: GestureDetector(
                onTap: () {
                  if (initialPage < list.length)
                    {
                    _controller.animateToPage(initialPage + 1,
                        duration: Duration(microseconds: 500),
                        curve: Curves.easeIn);
                    //print((initialPage +1) / (list.length ));

                    }
              if(initialPage==list.length-1){
                Navigator.of(context).pushNamed('s');
              }
                },
                child: Container(
                  width: 110,
                  height: 45,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius:BorderRadius.only(
                      bottomLeft: Radius.circular(15),
                      topLeft:  Radius.circular(15),
                    )
                  ),
                  child:((initialPage +1) / (list.length ))<1.0? Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                  ):Center(
                    child: Text(
                      'Go',style: TextStyle(
                      color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18
                    ),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  _displayText(String title,String text) {
    return Container(
      child: Column(
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 28,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 18,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  _displayImage(int path) {
    return Image.asset(
      "assets/$path.png",
      height: MediaQuery.of(context).size.height * .4,
      width:  MediaQuery.of(context).size.width * .8,

    );
  }
}