import 'dart:developer';

import 'package:colgate/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: buildAppBar(),
      bottomNavigationBar: const BottomNav(),
      body: ListView(
        children: [
          Container(
            margin: const EdgeInsets.all(17.0),
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            decoration: BoxDecoration(
                color: const Color.fromRGBO(230, 231, 233, 100),
                borderRadius: BorderRadius.circular(30.0)),
            child: Row(children: const [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "search",
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                  ),
                  textInputAction: TextInputAction.done,
                ),
              ),
              Icon(Icons.search),
            ]),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: const <Widget>[
                HeaderSlide(),
                HeaderSlide(),
                HeaderSlide()
              ],
            ),
          ),
          TitleWithMoreBtn(
              title: "Today New Arrival",
              desc: "Best of the today food list",
              press: () {
                log("btn more");
              }),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: const [
                MealsCard(),
                SizedBox(
                  width: 20,
                ),
                MealsCard(),
                SizedBox(
                  width: 20,
                ),
                MealsCard(),
                SizedBox(
                  width: 20,
                ),
                MealsCard(),
              ],
            ),
          ),
          TitleWithMoreBtn(
              title: "Booking Restaurant",
              desc: "Check your city near by restaurant",
              press: () {}),
          Column(
            children: const <Widget>[
              HotelCard(),
              SizedBox(
                height: 10,
              ),
              HotelCard(),
              SizedBox(
                height: 10,
              ),
              HotelCard(),
              SizedBox(
                height: 10,
              ),
              HotelCard(),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ],
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        onPressed: () {},
        icon: SvgPicture.asset(
          "assets/icons/menu.svg",
        ),
      ),
      title: const Text(
        "Restaurant App",
        textAlign: TextAlign.center,
        style: TextStyle(color: primaryColor, fontSize: 16),
      ),
      actions: [
        IconButton(
            onPressed: () {}, icon: Image.asset("assets/images/profile.png"))
      ],
    );
  }
}

class BottomNav extends StatefulWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      backgroundColor: Colors.transparent,
      labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
      height: 50,
      selectedIndex: _selectedIndex,
      onDestinationSelected: (index) => setState(() {
        _selectedIndex = index;
      }),
      destinations: const [
        NavigationDestination(
          icon: Icon(Icons.home_outlined),
          selectedIcon: Icon(
            Icons.home_outlined,
            color: Colors.blue,
          ),
          label: "Home",
        ),
        NavigationDestination(
          icon: Icon(Icons.file_copy_outlined),
          selectedIcon: Icon(
            Icons.file_copy_outlined,
            color: Colors.blue,
          ),
          label: "History",
        ),
        NavigationDestination(
          icon: Icon(Icons.person_outlined),
          selectedIcon: Icon(
            Icons.person_outlined,
            color: Colors.blue,
          ),
          label: "Account",
        ),
      ],
    );
    ;
  }
}

class HeaderSlide extends StatelessWidget {
  const HeaderSlide({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        log("clicked");
      },
      child: Container(
        margin: const EdgeInsets.all(31),
        padding: const EdgeInsets.only(left: 10),
        decoration: BoxDecoration(
            color: Colors.amber, borderRadius: BorderRadius.circular(20)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            const Text("Flash Offer"),
            Image.asset(
              "assets/images/header1.png",
              width: 200.0,
            )
          ],
        ),
      ),
    );
  }
}

class TitleWithMoreBtn extends StatelessWidget {
  const TitleWithMoreBtn(
      {Key? key, required this.title, required this.desc, required this.press})
      : super(key: key);

  final String title, desc;
  final void Function() press;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(17.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                title,
                style: const TextStyle(color: Colors.black, fontSize: 16),
              ),
              Text(
                desc,
                style:
                    const TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
              ),
            ],
          ),
          TextButton(onPressed: press, child: const Text("More"))
        ],
      ),
    );
  }
}

class MealsCard extends StatelessWidget {
  const MealsCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, '/details'),
      child: Container(
        padding: const EdgeInsets.all(15.0),
        width: 200.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: Colors.white,
        ),
        child: Column(
          children: [
            Image.asset(
              "assets/images/food1.jpg",
            ),
            const SizedBox(
              height: 10.0,
            ),
            const Text(
              "Chicken Biryani",
              textAlign: TextAlign.start,
            ),
            const SizedBox(
              height: 10.0,
            ),
            Row(
              children: const <Widget>[
                Icon(Icons.location_pin, color: Colors.green),
                Text("Ambrosia Hotel & \nRestaurant"),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class HotelCard extends StatelessWidget {
  const HotelCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15.0),
      margin: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: Colors.white,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            "assets/images/food3.jpg",
            width: 120.0,
            height: 100,
            fit: BoxFit.contain,
          ),
          const SizedBox(
            width: 10.0,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Hotel Zaman Restaurant",
                textAlign: TextAlign.start,
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: const <Widget>[
                  Icon(Icons.location_pin, color: Colors.green),
                  Text("Ambrosia Hotel & \nRestaurant"),
                ],
              ),
              TextButton(
                onPressed: () {},
                child: const Text("Book"),
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.blue),
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
