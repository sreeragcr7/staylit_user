import 'package:flutter/material.dart';

import 'package:staylit/screens/cleaning_screen.dart';
import 'package:staylit/screens/laundary_screen.dart';
import 'package:staylit/screens/maintainance_screen.dart';
import 'package:staylit/screens/vehicle_screen.dart';
import 'package:staylit/widgets/carsol.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({super.key});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        shrinkWrap: true,
        children: [
          const Padding(
            padding: EdgeInsets.only(right: 260, top: 30),
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
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
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
                        width: 2, color: Color.fromARGB(255, 36, 103, 40)),
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
            height: 50,
          ),
          const SizedBox(height: 200, child: Casourl()),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
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
                                builder: (context) => const CleanScreen()));
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
                                builder: (context) => const LaundaryScreen()));
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
                                builder: (context) => const VehicleScreen()));
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
    );
  }
}
