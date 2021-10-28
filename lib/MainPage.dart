import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}


class _MainPageState extends State<MainPage> {
  int currentPosition = 0;

  List<String> imagePathsList = [
    "assets/image_one.jpg",
    "assets/image_two.jpg",
    "assets/image_three.jpg",
  ];

  Widget buildImageCarousel(String imagePath, int index) {
    return Container(
      margin : EdgeInsets.all(3),
      color: Colors.green,
      child : Image.asset(
        imagePath,
        fit : BoxFit.cover,
      ),
    );
  }


  Widget buildIndicator() {
    return AnimatedSmoothIndicator(
      activeIndex: currentPosition,
      count: imagePathsList.length,
      effect: ExpandingDotsEffect(
        radius:  6,
        dotWidth: 10,
        dotHeight: 6,
        spacing: 4,
        dotColor : Colors.black26,
      ),
    );
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height : 25,
            ),

            Row(
              children: [
                Text('vuvdu'),
                Text('vuvdu'),
              ],
            ),

            SizedBox(
              height : 25,
            ),

            CarouselSlider.builder(
              itemCount: imagePathsList.length,
              options: CarouselOptions(
                  autoPlay: true,
                  initialPage: 0,
                  autoPlayInterval: Duration(seconds: 2),
                  enableInfiniteScroll: false,
                  height : 200,
                  onPageChanged: (index, reason) {
                    setState(() {
                      currentPosition = index;
                    });
                  }
              ),
              itemBuilder: (context, index, real_index){
                final imagePath = imagePathsList[index];
                return buildImageCarousel(imagePath , index);
              },
            ),


            SizedBox(
              height : 25,
            ),

            buildIndicator(),

            SizedBox(
              height : 25,
            ),

            const Divider(
              thickness: 1,
              //indent: 20,
              //endIndent: 20,
            ),

            SizedBox(
              height : 25,
            ),

            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Your News',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  TextButton(
                    onPressed: (){},
                    child: Text(
                      'Watch All',
                      //textAlign: TextAlign.end,
                      style: TextStyle(color : Colors.indigo, fontSize : 18, fontWeight: FontWeight.bold),
                    ),
                  ),

                ],

              ),

            ),

            SizedBox(
              height : 25,
            ),

            /*
            ListView.builder(
              itemCount: 1,
              itemBuilder: (context, index) {
                return Container(
                  color: Colors.green,
                  child: Text(
                      'hvdu'
                  ),
                );
                },
            ),

             */


          ],
        ),
      ),
    );

  }

}






