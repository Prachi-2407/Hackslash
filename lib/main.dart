import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Home Page", style: TextStyle(color: Colors.grey[400])),
        backgroundColor: Colors.grey[800],
        elevation: 0,

      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:[
            Row(
              mainAxisAlignment:
              MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.menu, color: Colors.black, size: 40.0),
                Padding(
                  padding: EdgeInsets.only(right: 16.0),
                  child: Icon(Icons.person, color: Colors.black, size: 40.0),
                ),
              ],
            ),
            SizedBox(height: 20,),
            Text(
              "Hi! Prachi\nLet’s Explore India",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 16),
            // Tabs for categories
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Stack(alignment:Alignment.bottomLeft,
                  children:[
                    Container(height:2,width:130,
                    decoration:BoxDecoration(boxShadow:[BoxShadow(color:Colors.grey,
                    blurRadius:5.0,offset:Offset(3.0,3.0),)]),
                    ),
                    Text("Recommended",textAlign: TextAlign.left,style: TextStyle(fontSize:20,
                    color:Colors.yellow[700],
                    fontWeight: FontWeight.bold,
                    decoration:TextDecoration.underline,
                    decorationColor: Colors.transparent,
                    decorationThickness:2.0,),)
                  ],),
                  SizedBox(width: 18),
                  Text("Ecotourism", style: TextStyle(fontSize: 18)),
                  SizedBox(width: 18),
                  Text("Spiritual", style: TextStyle(fontSize: 18)),
                ],
              ),
            ),
            SizedBox(height: 20),
            // Horizontal Scroll List with increased height and clipBehavior set to Clip.none
            SizedBox(
              height: 210,// Increased height to accommodate shadows
              child: ListView(
                clipBehavior: Clip.none, // Allow shadows to overflow
                scrollDirection: Axis.horizontal,
                children: [
                  tripCard(
                    "Him Trek",
                    "Badrinath, Uttarakhand",
                    "4.5",
                    "https://static.vecteezy.com/system/resources/thumbnails/045/380/529/small_2x/spring-in-kullu-valley-in-himalaya-mountains-himachal-pradesh-india-photo.jpg",
                  ),
                  SizedBox(width: 25),
                  tripCard(
                    "Delhi Zoo",
                    "Delhi, New Delhi",
                    "4.2",
                    "https://etvbharatimages.akamaized.net/etvbharat/prod-images/15-01-2024/1200-675-20515095-thumbnail-16x9-aaaa.jpg",
                  ),
                ],
              ),
            ),
            SizedBox(height: 35),
            // Tour Packages Button and View All
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pink,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  child: Text(
                    "Tour Packages",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text("View All", style: TextStyle(fontSize: 15)),
              ],
            ),
            SizedBox(height: 15),
            // Tour Package Card
            tourPackageCard(
              "Banaras, Uttar Pradesh",
              "Rs. 7,999",
              "2 Days, 1 Night",
              "4.5",
              "https://t4.ftcdn.net/jpg/04/08/25/05/360_F_408250543_MVaEVGeWxb4FiFy7mEGKj8nfYkwoAZON.jpg",
            ),
          ],
        ),
      ),
    );
  }

  // Trip Card with rounded corners and vertical margins for shadows
  Widget tripCard(String title, String location, String rating, String imageUrl) {
    return Container(
      width: 240,
      margin: EdgeInsets.symmetric(vertical: 15), // Provide space at top and bottom
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 5.0,
          offset: Offset(3.0, 3.0),)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Image with rounded corners using ClipRRect
          Padding(
            padding: EdgeInsets.only(
                left: 8.0, right: 8.0, top: 8.0, bottom: 4.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                imageUrl,
                width: 240,
                height: 120,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding:
            EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title and rating row
                Row(
                  mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: [
                        Icon(Icons.star,
                            color: Colors.orange[300], size: 16),
                        Text(
                          rating,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                      ],
                    ),
                  ],
                ),
                // Location row
                Row(
                  children: [
                    Icon(Icons.location_on_outlined,
                        size: 12),
                    Text(
                      location,
                      style: TextStyle(
                          fontSize: 12),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Tour Package Card with vertical margins for shadow spacing
  Widget tourPackageCard(String location, String price, String duration,
      String rating, String imageUrl) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15), // Space for shadows
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 5.0,
          offset: Offset(3.0, 3.0),)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
                left: 8.0, right: 8.0, top: 10.0, bottom: 4.0),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              child: Image.network(
                imageUrl,
                width: double.infinity,
                height: 130,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment:
              CrossAxisAlignment.start,
              children: [
                // Price and rating row
                Row(
                  mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      price,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: [
                        Icon(Icons.star,
                            color: Colors.orange[300], size: 16),
                        Text(
                          rating,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                      ],
                    ),
                  ],
                ),
                // Location and duration row
                Row(
                  mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.location_on_outlined,
                            size: 16),
                        Text(
                          location,
                          style: TextStyle(fontSize: 13),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.calendar_today,
                            size: 15, color: Colors.black),
                        SizedBox(width: 5),
                        Text(
                          duration,
                          style: TextStyle(fontSize: 13),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}