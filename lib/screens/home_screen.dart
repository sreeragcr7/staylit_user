import 'dart:async';
import 'package:flutter/material.dart';
import 'package:staylit/screens/cleaning_screen.dart';
import 'package:staylit/screens/laundary_screen.dart';
import 'package:staylit/screens/maintainance_screen.dart';
import 'package:staylit/screens/vehicle_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _CarsoulScreenState();
}

class _CarsoulScreenState extends State<HomeScreen> {
  late final PageController pageController;
  int pageNo = 0;
  late final Timer carasoulTimer;
  Timer getTimer() {
    return Timer.periodic(const Duration(seconds: 3), (timer) {
      if (pageNo == 4) {
        pageNo = 0;
      }
      pageController.animateToPage(pageNo,
          duration: const Duration(seconds: 1), curve: Curves.easeInOutCirc);
      pageNo++;
    });
  }

  @override
  void initState() {
    pageController = PageController(
      initialPage: 0,
      viewportFraction: 0.85,
    );
    carasoulTimer = getTimer();

    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.menu,
            color: Colors.black,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 36, 103, 40),
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(255, 14, 14, 14),
              blurRadius: 10,
            )
          ],
        ),
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.person,
                size: 30,
              ),
            ),
            const SizedBox(
              width: 100,
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.home,
                size: 30,
              ),
            ),
            const SizedBox(
              width: 100,
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.settings,
                size: 30,
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          SafeArea(
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(right: 250, top: 30),
                  child: Text(
                    "Hi Rohan",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(30),
                  child: const Padding(
                    padding: EdgeInsets.only(right: 50),
                    child: Text(
                      "What Service DoYou Need",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(
                  width: 380,
                  child: TextField(
                    decoration: InputDecoration(
                        prefixIcon: const Icon(
                          Icons.search,
                          color: Color.fromARGB(255, 36, 103, 40),
                        ),
                        hintText: "Search What You Need",
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              width: 2,
                              color: Color.fromARGB(255, 36, 103, 40)),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              width: 3,
                              color: Color.fromARGB(255, 36, 103, 40),
                            ),
                            borderRadius: BorderRadius.circular(30))),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 200,
                  child: PageView.builder(
                    controller: pageController,
                    onPageChanged: (index) {
                      pageNo = index;
                      setState(() {});
                    },
                    itemBuilder: (_, index) {
                      return AnimatedBuilder(
                        animation: pageController,
                        builder: (ctx, child) {
                          return child!;
                        },
                        child: Container(
                          margin: const EdgeInsets.only(
                              left: 10, right: 10, top: 30),
                          height: 180,
                          decoration: BoxDecoration(
                            color: Colors.amberAccent,
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: Image.asset("assets/images/service.jpg"),
                        ),
                      );
                    },
                    itemCount: 5,
                  ),
                ),
                SizedBox(
                  height: 30.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      5,
                      (index) => Container(
                        margin: const EdgeInsets.all(2.0),
                        child: Icon(
                          Icons.circle,
                          size: 12.0,
                          color: pageNo == index
                              ? Colors.indigoAccent
                              : Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  child: Material(
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: GridView.count(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        crossAxisCount: 3,
                        crossAxisSpacing: 1,
                        mainAxisSpacing: 1,
                        children: [
                          Column(
                            children: [
                              const SizedBox(
                                height: 30,
                              ),
                              IconButton(
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) =>
                                          const CleanScreen()));
                                },
                                icon: const Icon(
                                  Icons.cleaning_services,
                                  color: Color.fromARGB(255, 36, 103, 40),
                                  size: 30,
                                ),
                              ),
                              const Text(
                                "Cleaning",
                                style: TextStyle(fontSize: 10),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              const SizedBox(
                                height: 30,
                              ),
                              IconButton(
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) =>
                                          const LaundaryScreen()));
                                },
                                icon: const Icon(
                                  Icons.local_laundry_service_sharp,
                                  color: Color.fromARGB(255, 36, 103, 40),
                                  size: 30,
                                ),
                              ),
                              const Text(
                                "Laundary",
                                style: TextStyle(fontSize: 10),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              const SizedBox(
                                height: 30,
                              ),
                              IconButton(
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) =>
                                          const MaintainanceScreen()));
                                },
                                icon: const Icon(
                                  Icons.electrical_services,
                                  color: Color.fromARGB(255, 36, 103, 40),
                                  size: 30,
                                ),
                              ),
                              const Text(
                                "Maintainance",
                                style: TextStyle(fontSize: 10),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              const SizedBox(
                                height: 30,
                              ),
                              IconButton(
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) =>
                                          const VehicleScreen()));
                                },
                                icon: const Icon(
                                  Icons.local_car_wash,
                                  color: Color.fromARGB(255, 36, 103, 40),
                                  size: 30,
                                ),
                              ),
                              const Text(
                                "Vehicle Wash",
                                style: TextStyle(fontSize: 10),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              const SizedBox(
                                height: 30,
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.pets,
                                  color: Color.fromARGB(255, 36, 103, 40),
                                  size: 30,
                                ),
                              ),
                              const Text(
                                "Pet Care",
                                style: TextStyle(fontSize: 10),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              const SizedBox(
                                height: 30,
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.food_bank_rounded,
                                  color: Color.fromARGB(255, 36, 103, 40),
                                  size: 30,
                                ),
                              ),
                              const Text(
                                "Food",
                                style: TextStyle(fontSize: 10),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              const SizedBox(
                                height: 30,
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.report,
                                  color: Color.fromARGB(255, 36, 103, 40),
                                  size: 30,
                                ),
                              ),
                              const Text(
                                "Report",
                                style: TextStyle(fontSize: 10),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
