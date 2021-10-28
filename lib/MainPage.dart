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
  int _selectedIndex = 0;

  List<String> imagePathsList = [
    "assets/image_one.jpg",
    "assets/image_two.jpg",
    "assets/image_three.jpg",
  ];

  Widget buildImageCarousel(String imagePath, int index) {
    return Container(
      margin : EdgeInsets.all(8),
      decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(100),),
      child : ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.asset(
          imagePath,
          fit : BoxFit.cover,
        ),
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
      body: Container(
        //child: Container(
          padding: EdgeInsets.all(35),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Featured News',
                    style : TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                  Text(
                    'Local News',
                    style : TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color : Colors.grey
                    ),
                  ),
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
                height : 2,
              ),

              //LIST VIEWBUILDER START

              Expanded(
                flex: 1,
                child: SingleChildScrollView(
                  padding: EdgeInsets.all(10),
                  child:  ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          ListTile(
                            title: Text(
                            'As you can see, we\'ve been toying around with optical illusions.',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 13,
                              ),
                            ),
                            trailing: Image.asset('assets/vertical.jpg'),
                            onTap: () {},
                          ),

                          SizedBox(
                            height: 5,
                          ),

                          Row(
                            children: [
                              ElevatedButton(
                                onPressed: (){},
                                child: Text('Viral', style: TextStyle(fontSize : 13, color: Colors.indigo),),
                              ),

                              SizedBox(
                                width : 45,
                              ),

                              Text(
                                '4h ago',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 10,
                                ),
                              ),
                            ],
                          ),

                          const Divider(
                            thickness: 1,
                          ),

                          SizedBox(
                            height: 15,
                          ),

                        ],
                      );
                    }
                  )
                ),
              ),

            ],

          ),

        ),



      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined, size : 30),
            label: ' ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search, size : 30,),
            label: ' ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.play_circle_outline, size : 30),
            label: ' ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment_sharp, size : 30),
            label: ' ',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.grey,
        onTap: null,

      ),
    );


  }

}






