import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:staylit/ui/screen/breakfast_screen.dart';
import 'package:staylit/ui/screen/dinner_screen.dart';
import 'package:staylit/ui/screen/lunch_screen.dart';

class FoodScreen extends StatefulWidget {
  const FoodScreen({super.key});

  @override
  State<FoodScreen> createState() => _FoodScreenState();
}

class _FoodScreenState extends State<FoodScreen> with TickerProviderStateMixin {
  TabController? controller;
  TabController? imageTabcontroller;

  @override
  void initState() {
    controller = TabController(length: 3, vsync: this);
    imageTabcontroller = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const CustomImageView(
            imagePath: "assets/images/food.png",
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(55),
                      topRight: Radius.circular(55))),
              height: 500,
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 25, left: 25),
                    child: Text(
                      textAlign: TextAlign.left,
                      'Hi Rohan',
                      style: GoogleFonts.poppins(
                        textStyle:
                            Theme.of(context).textTheme.subtitle1!.copyWith(
                                  color: const Color(0xFF103E12),
                                  fontWeight: FontWeight.bold,
                                ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5, left: 25),
                    child: Text(
                      "Find your food",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.berkshireSwash(
                        textStyle: Theme.of(context)
                            .textTheme
                            .headline4!
                            .copyWith(
                              color: const Color(0xFF103E12).withOpacity(0.8),
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 10,
                      left: 25,
                      right: 25,
                      bottom: 10,
                    ),
                    child: TextFormField(
                      style: GoogleFonts.poppins(
                        textStyle:
                            Theme.of(context).textTheme.subtitle1!.copyWith(
                                  color: const Color(0xFF103E12),
                                  fontWeight: FontWeight.bold,
                                ),
                      ),
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                        prefixIcon: const Icon(
                          Icons.search,
                          color: Colors.black,
                          size: 30,
                        ),
                        filled: true,
                        labelText: 'Search Food',
                        labelStyle: GoogleFonts.poppins(
                          textStyle: Theme.of(context)
                              .textTheme
                              .subtitle1!
                              .copyWith(
                                color: const Color(0xFF103E12).withOpacity(0.5),
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                        fillColor: const Color(0xFFFBC60C).withOpacity(0.6),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Row(
                      children: [
                        FoodTypeItem(
                          foodType: 'Breakfast',
                          onTap: () {
                            controller!.animateTo(0);
                            setState(() {});
                          },
                          isSelected: controller!.index == 0,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        FoodTypeItem(
                          foodType: 'Lunch',
                          onTap: () {
                            controller!.animateTo(1);
                            setState(() {});
                          },
                          isSelected: controller!.index == 1,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        FoodTypeItem(
                          foodType: 'Dinner',
                          onTap: () {
                            controller!.animateTo(2);
                            setState(() {});
                          },
                          isSelected: controller!.index == 2,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: TabBarView(
                        controller: controller,
                        physics: const NeverScrollableScrollPhysics(),
                        children: const [
                          BreakfastScreen(),
                          LunchScreen(),
                          DinnerScreen(),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
          // Align(
          //   alignment: Alignment.topCenter,
          //   child: Container(
          //     height: 30,
          //     width: 30,
          //     decoration: BoxDecoration(
          //       shape: BoxShape.circle,
          //       color: Colors.blueAccent,
          //       border: Border.all(
          //         color: Colors.white,
          //         width: 5,
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}

class CustomImageView extends StatelessWidget {
  final String imagePath;
  const CustomImageView({
    Key? key,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          imagePath,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        Align(
          alignment: Alignment.center,
          child: Icon(
            Icons.arrow_back_ios,
          ),
        ),
      ],
    );
  }
}

class FoodTypeItem extends StatelessWidget {
  final String foodType;
  final Function() onTap;
  final bool isSelected;
  const FoodTypeItem({
    Key? key,
    required this.foodType,
    required this.onTap,
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Material(
        child: IntrinsicWidth(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                foodType,
                style: GoogleFonts.poppins(
                  textStyle: Theme.of(context).textTheme.subtitle1!.copyWith(
                        color: const Color(0xFF103E12),
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                  right: 10,
                ),
                child: isSelected
                    ? Container(
                        height: 5,
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(10)),
                      )
                    : const SizedBox(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
