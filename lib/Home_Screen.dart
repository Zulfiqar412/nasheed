import 'package:flutter/material.dart';


import 'SignUp_Screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? Select;

  List<String> names = [
    "Asim Ali Shah",
    "hasham khan",
    "Rizwan ali",
    "Yasir hussain ",
    "hamza shinwari",
    "Junaid khattak"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.headset,
              color: Colors.black,
            ),
          ),
          title: Text(
            "Nasheed Station",
            style: TextStyle(fontSize: 20, color: Colors.black),
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.search,
                  color: Colors.black,
                )),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.more_vert,
                color: Colors.black,
              ),
            ),
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(left: 10, right: 10, top: 20),
              height: 150,
              width: double.maxFinite,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 1),
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 7,
                    child: Container(
                      margin: EdgeInsets.only(top: 5, left: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              "neighborhoods, cities, schools,\n churches,  temples,\n  offices, factories and plants,\n tools, means of production,  \nand products,"),
                          Container(
                            margin: EdgeInsets.only(left: 20, top: 20),
                            color: Colors.red,
                            child: InkWell(
                              onTap: (){
                                Navigator.push(context , MaterialPageRoute(builder: (context) => SignupScreen(),));
                              },
                              child: Text(
                                "Sign Up For Free",
                                style: TextStyle(fontSize: 18, color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Text(
                      "🕋",
                      style: TextStyle(fontSize: 80),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18.0, top: 12),
              child: Row(
                children: [
                  Text(
                    "Racently Added",
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                    width: 65,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  DropdownButton<String>(
                    items: [
                      DropdownMenuItem(
                        value: 'name',
                        child: Icon(
                          Icons.sort,
                          size: 30,
                        ),
                      ),
                      DropdownMenuItem(
                        value: 'length',
                        child: Icon(
                          Icons.sort_by_alpha,
                          size: 30,
                        ),
                      ),
                    ],
                    onChanged: (value) {
                      Select = value;
                      setState(() {
                        if (Select == "name") {
                          names.sort((a, b) => a.length.compareTo(b.length));
                        } else {
                          names.sort((a, b) => a.compareTo(b));
                        }
                      });
                    },
                    hint: Text("Sort by"),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: names.length,
                itemBuilder: (ctx, index) {
                  return Container(
                    margin: EdgeInsets.only(left: 18, top: 18, right: 18),
                    height: 95,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      // border: Border.all( width: 1),
                      borderRadius: BorderRadius.circular(15),
                      color: index % 2 == 0
                          ? Colors.grey.shade400
                          : Colors.grey.shade300,
                    ),
                    child: Row(
                      children: [
                        Container(
                            height: 100,
                            width: 90,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(15),
                                bottomLeft: Radius.circular(15),
                              ),
                            ),
                            child: Center(
                                child: Text(
                                  "🎶",
                                  style: TextStyle(fontSize: 40),
                                ))),
                        SizedBox(
                          width: 30,
                        ),
                        Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              names[index],
                              style: TextStyle(fontSize: 18),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              names[index],
                              style: TextStyle(color: Colors.black26),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: const [
                                Icon(
                                  Icons.play_arrow,
                                  size: 35,
                                ),
                                Icon(
                                  Icons.share,
                                  size: 35,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),

        bottomNavigationBar: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_pin_outlined),
                label: 'person',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.upload),
                label: 'Upload',
              ),
            ],
            ),
        );
    }
}