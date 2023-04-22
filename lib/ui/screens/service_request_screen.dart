import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:staylit/ui/widgets/custom_action_button.dart';
import 'package:staylit/ui/widgets/custom_card.dart';
import 'package:staylit/ui/widgets/label_with_text.dart';

class ServiceRequestScreen extends StatefulWidget {
  const ServiceRequestScreen({super.key});

  @override
  State<ServiceRequestScreen> createState() => _ServiceRequestScreenState();
}

class _ServiceRequestScreenState extends State<ServiceRequestScreen> {
  String groupValue = 'pending';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: false,
        title: Text(
          'Request',
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Colors.blueAccent[700],
                fontWeight: FontWeight.bold,
              ),
        ),
        elevation: 1,
        leading: BackButton(
          color: Colors.blueAccent[700]!,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      'https://images.unsplash.com/photo-1581578731548-c64695cc6952?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
                      fit: BoxFit.cover,
                      height: 150,
                      width: MediaQuery.of(context).size.width - 40,
                    ),
                  ),
                  SizedBox(
                    height: 150,
                    width: MediaQuery.of(context).size.width - 40,
                    child: Material(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.black12,
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'CLEANING',
                      style: GoogleFonts.josefinSans(
                        textStyle: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                  ),
                ],
              ),
              const Divider(
                color: Colors.black54,
                height: 20,
              ),
              CupertinoSlidingSegmentedControl<String>(
                backgroundColor: Colors.white60,
                thumbColor: Colors.blueAccent,
                groupValue: groupValue,
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 10,
                ),
                children: {
                  'pending': Text(
                    'Pending',
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: groupValue == 'pending'
                              ? Colors.white
                              : Colors.blue,
                          fontWeight: FontWeight.w400,
                        ),
                  ),
                  'accepted': Text(
                    'Accepted',
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: groupValue == 'accepted'
                              ? Colors.white
                              : Colors.blue,
                          fontWeight: FontWeight.w400,
                        ),
                  ),
                  'completed': Text(
                    'Completed',
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: groupValue == 'completed'
                              ? Colors.white
                              : Colors.blue,
                          fontWeight: FontWeight.w400,
                        ),
                  ),
                },
                onValueChanged: (value) {
                  groupValue = value!;
                  setState(() {});
                },
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Wrap(
                    runSpacing: 20,
                    children: List<Widget>.generate(
                      5,
                      (index) => const ServiceRequestCard(),
                    ),
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
    );
  }
}

class ServiceRequestCard extends StatelessWidget {
  const ServiceRequestCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '12/12/2022 10:00 am',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: Colors.grey[600],
                        fontWeight: FontWeight.w400,
                      ),
                ),
                Text(
                  'Pending',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: Colors.grey[600],
                        fontWeight: FontWeight.w400,
                      ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Cleaning',
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const Divider(
              height: 20,
            ),
            const LabelWithText(
              label: 'Accepted By',
              text: 'Staff name',
            ),
            const Divider(
              height: 20,
            ),
            Row(
              children: const [
                Expanded(
                  child: LabelWithText(
                    label: 'Room',
                    text: '101',
                  ),
                ),
                Expanded(
                  child: LabelWithText(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    label: 'Price',
                    text: '₹500',
                  ),
                ),
              ],
            ),
            const Divider(
              height: 20,
            ),
            const LabelWithText(
              label: 'Payment Status',
              text: 'Pending',
            ),
            const Divider(
              height: 20,
            ),
            CustomActionButton(
              iconData: Icons.check_circle_outline,
              label: 'Pay Now',
              color: Colors.green,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
