import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:staylit/blocs/service/service_bloc.dart';
import 'package:staylit/ui/screens/service_request_screen.dart';
import 'package:staylit/ui/widgets/custom_alert_dialog.dart';
import 'package:staylit/ui/widgets/custom_card.dart';
import 'package:staylit/ui/widgets/custom_progress_indicator.dart';
import 'package:staylit/ui/widgets/custom_search.dart';

class ServiceListingScreen extends StatefulWidget {
  const ServiceListingScreen({super.key});

  @override
  State<ServiceListingScreen> createState() => _ServiceListingScreenState();
}

class _ServiceListingScreenState extends State<ServiceListingScreen> {
  ServiceBloc serviceBloc = ServiceBloc();

  String? query;

  getServices() {
    serviceBloc.add(GetAllServiceEvent(
      query: query,
    ));
  }

  @override
  void initState() {
    getServices();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ServiceBloc>.value(
      value: serviceBloc,
      child: BlocConsumer<ServiceBloc, ServiceState>(
        listener: (context, state) {
          if (state is ServiceFailureState) {
            showDialog(
              context: context,
              builder: (context) => CustomAlertDialog(
                title: 'Failed',
                message: state.message,
                primaryButtonLabel: 'Ok',
              ),
            );
          }
        },
        builder: (context, state) {
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Available services',
                    style: GoogleFonts.notoSans(
                      textStyle:
                          Theme.of(context).textTheme.titleMedium!.copyWith(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomSearch(
                    onSearch: (search) {
                      query = search;
                      getServices();
                    },
                  ),
                  const Divider(
                    color: Colors.black54,
                    height: 20,
                  ),
                  Expanded(
                    child: state is ServiceSuccessState
                        ? state.services.isNotEmpty
                            ? SingleChildScrollView(
                                child: GridView.count(
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  childAspectRatio: 1 / 1.35,
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 10,
                                  mainAxisSpacing: 10,
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  children: List<Widget>.generate(
                                    state.services.length,
                                    (index) => ServiceCard(
                                      serviceDetails: state.services[index],
                                    ),
                                  ),
                                ),
                              )
                            : const Center(
                                child: Text('No services found'),
                              )
                        : state is ServiceLoadingState
                            ? const Center(
                                child: CustomProgressIndicator(),
                              )
                            : const SizedBox(),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class ServiceCard extends StatelessWidget {
  final Map<String, dynamic> serviceDetails;
  const ServiceCard({
    super.key,
    required this.serviceDetails,
  });

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ServiceRequestScreen(
              serviceDetails: serviceDetails,
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: CachedNetworkImage(
                imageUrl: serviceDetails['image_url'],
                fit: BoxFit.cover,
                height: 150,
                width: 150,
                progressIndicatorBuilder: (context, url, progress) =>
                    const Center(
                  child: CustomProgressIndicator(),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              serviceDetails['service'],
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              '₹${serviceDetails['price'].toString()}',
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
