import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_plant/constants.dart';
import 'package:my_plant/models/plants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    int selectedIndex = 0;
    Size size = MediaQuery.of(context).size;

    List<Plant> _plantList = Plant.plantList;

    // plants category
    List<String> _plantTypes = [
      'Recommended',
      'Indoor',
      'OutDoor',
      'Garden',
      'Supplement',
    ];

    // toggle favorite button
    bool toggleIsFavorited(bool isFavorited) {
      return !isFavorited;
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                    ),
                    width: size.width * .9,
                    decoration: BoxDecoration(
                      color: Constants.primaryColor.withOpacity(.1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.search,
                          color: Colors.black54.withOpacity(.6),
                        ),
                        const Expanded(
                          child: TextField(
                            showCursor: false,
                            decoration: InputDecoration(
                                hintText: 'Search Plants',
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none),
                          ),
                        ),
                        Icon(
                          Icons.mic,
                          color: Colors.black54.withOpacity(.6),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 40,
              width: size.width,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 15),
                itemCount: _plantTypes.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8),
                    child: GestureDetector(
                      onTap: () {
                        setState(
                          () {
                            selectedIndex = index;
                          },
                        );
                      },
                      child: Text(
                        _plantTypes[index],
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: selectedIndex == index
                                ? FontWeight.bold
                                : FontWeight.w300,
                            color: selectedIndex == index
                                ? Constants.primaryColor
                                : Constants.blackColor),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: size.height * .32,
              child: ListView.builder(
                itemCount: _plantList.length,
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    width: 200,
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      color: Constants.primaryColor.withOpacity(.8),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          top: 10,
                          right: 10,
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              color: Constants.whiteColor,
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: IconButton(
                              onPressed: () {
                                setState(() {
                                  bool isFavorited = toggleIsFavorited(
                                      _plantList[index].isFavorated);
                                  _plantList[index].isFavorated = isFavorited;
                                });
                              },
                              icon: Icon(
                                _plantList[index].isFavorated == true
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                color: Constants.primaryColor,
                                size: 25,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 50,
                          right: 50,
                          top: 50,
                          bottom: 50,
                          child: Image.asset(_plantList[index].imageURL),
                        ),
                        Positioned(
                          bottom: 10,
                          left: 10,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                _plantList[index].category,
                                style: const TextStyle(
                                    color: Colors.white70, fontSize: 16),
                              ),
                              Text(
                                _plantList[index].plantName,
                                style: const TextStyle(
                                    color: Colors.white70,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          bottom: 10,
                          right: 10,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 2),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              '\$' + _plantList[index].price.toString(),
                              style: TextStyle(
                                  color: Constants.primaryColor, fontSize: 16),
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 20, bottom: 10, top: 10),
              child: const Text(
                'New Plants',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              height: size.height * .5,
              child: ListView.builder(
                  itemCount: _plantList.length,
                  scrollDirection: Axis.vertical,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      decoration: BoxDecoration(
                        color: Constants.primaryColor.withOpacity(.1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      height: 80,
                      width: size.width,
                      padding: const EdgeInsets.only(left: 10, top: 10),
                      margin: const EdgeInsets.only(bottom: 10, top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Container(
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                    color:
                                        Constants.primaryColor.withOpacity(.8),
                                    shape: BoxShape.circle),
                              ),
                              Positioned(
                                bottom: 5,
                                left: 0,
                                right: 0,
                                child: SizedBox(
                                  height: 80,
                                  child:
                                      Image.asset(_plantList[index].imageURL),
                                ),
                              ),
                              Positioned(
                                bottom: 5,
                                left: 80,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(_plantList[index].category),
                                    Text(
                                      _plantList[index].plantName,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                        color: Constants.blackColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Container(
                            padding: const EdgeInsets.only(right: 10),
                            child: Text(
                              r'$' + _plantList[index].price.toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Constants.primaryColor),
                            ),
                          )
                        ],
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
