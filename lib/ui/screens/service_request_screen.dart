import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:staylit/blocs/service/service_bloc.dart';
import 'package:staylit/blocs/service_request/service_request_bloc.dart';
import 'package:staylit/ui/widgets/custom_action_button.dart';
import 'package:staylit/ui/widgets/custom_alert_dialog.dart';
import 'package:staylit/ui/widgets/custom_button.dart';
import 'package:staylit/ui/widgets/custom_card.dart';
import 'package:staylit/ui/widgets/custom_progress_indicator.dart';
import 'package:staylit/ui/widgets/label_with_text.dart';

class ServiceRequestScreen extends StatefulWidget {
  final Map<String, dynamic> serviceDetails;
  const ServiceRequestScreen({super.key, required this.serviceDetails});

  @override
  State<ServiceRequestScreen> createState() => _ServiceRequestScreenState();
}

class _ServiceRequestScreenState extends State<ServiceRequestScreen> {
  String status = 'pending';

  ServiceRequestBloc serviceRequestBloc = ServiceRequestBloc();

  void getServiceRequests() {
    serviceRequestBloc.add(
      GetAllServiceRequestsEvent(
          status: status, serviceId: widget.serviceDetails['id']),
    );
  }

  @override
  void initState() {
    getServiceRequests();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ServiceRequestBloc>.value(
      value: serviceRequestBloc,
      child: Scaffold(
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
        body: BlocConsumer<ServiceRequestBloc, ServiceRequestState>(
          listener: (context, state) {
            if (state is ServiceRequestFailureState) {
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
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: CachedNetworkImage(
                            imageUrl: widget.serviceDetails['image_url'],
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
                            widget.serviceDetails['service']
                                .toString()
                                .toUpperCase(),
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
                      groupValue: status,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 10,
                      ),
                      children: {
                        'pending': Text(
                          'Pending',
                          style:
                              Theme.of(context).textTheme.titleMedium!.copyWith(
                                    color: status == 'pending'
                                        ? Colors.white
                                        : Colors.blue,
                                    fontWeight: FontWeight.w400,
                                  ),
                        ),
                        'accepted': Text(
                          'Accepted',
                          style:
                              Theme.of(context).textTheme.titleMedium!.copyWith(
                                    color: status == 'accepted'
                                        ? Colors.white
                                        : Colors.blue,
                                    fontWeight: FontWeight.w400,
                                  ),
                        ),
                        'completed': Text(
                          'Completed',
                          style:
                              Theme.of(context).textTheme.titleMedium!.copyWith(
                                    color: status == 'completed'
                                        ? Colors.white
                                        : Colors.blue,
                                    fontWeight: FontWeight.w400,
                                  ),
                        ),
                      },
                      onValueChanged: (value) {
                        status = value!;
                        getServiceRequests();
                        setState(() {});
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: state is ServiceRequestSuccessState
                          ? state.serviceRequests.isNotEmpty
                              ? SingleChildScrollView(
                                  child: Wrap(
                                    runSpacing: 20,
                                    children: List<Widget>.generate(
                                      state.serviceRequests.length,
                                      (index) => ServiceRequestCard(
                                        serviceDetails:
                                            state.serviceRequests[index],
                                        serviceRequestBloc: serviceRequestBloc,
                                      ),
                                    ),
                                  ),
                                )
                              : Center(
                                  child: Text(
                                      'No $status service requests found!'),
                                )
                          : state is ServiceRequestLoadingState
                              ? const Center(
                                  child: CustomProgressIndicator(),
                                )
                              : const SizedBox(),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(bottom: 5),
          child: CustomButton(
            label: 'Send Request',
            onPressed: () {
              serviceRequestBloc.add(
                AddServiceRequestEvent(
                  serviceId: widget.serviceDetails['id'],
                ),
              );
            },
            mainAxisSize: MainAxisSize.min,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}

class ServiceRequestCard extends StatelessWidget {
  final Map<String, dynamic> serviceDetails;
  final ServiceRequestBloc serviceRequestBloc;
  const ServiceRequestCard({
    super.key,
    required this.serviceDetails,
    required this.serviceRequestBloc,
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
                Expanded(
                  child: Text(
                    DateFormat('dd/MM/yyyy hh:mm a').format(
                        DateTime.parse(serviceDetails['created_at']).toLocal()),
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: Colors.grey[600],
                          fontWeight: FontWeight.w400,
                        ),
                  ),
                ),
                Expanded(
                  child: Text(
                    serviceDetails['status'],
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: Colors.grey[600],
                          fontWeight: FontWeight.w400,
                        ),
                    textAlign: TextAlign.end,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: LabelWithText(
                    label: 'Service',
                    text: serviceDetails['service']['service'],
                  ),
                ),
                Expanded(
                  child: LabelWithText(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    label: 'Accepted By',
                    text: serviceDetails['acceptedBy'] != null
                        ? serviceDetails['acceptedBy']['name']
                        : 'not yet accepted',
                  ),
                ),
              ],
            ),
            const Divider(
              height: 30,
            ),
            Row(
              children: [
                Expanded(
                  child: LabelWithText(
                    label: 'Room',
                    text: serviceDetails['room']['room_no'],
                  ),
                ),
                Expanded(
                  child: LabelWithText(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    label: 'Price',
                    text: '₹${serviceDetails['service']['price'].toString()}',
                  ),
                ),
              ],
            ),
            const Divider(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: LabelWithText(
                    label: 'Payment Status',
                    text: serviceDetails['payment_status'],
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                serviceDetails['status'] == 'completed'
                    ? Expanded(
                        child: CustomActionButton(
                          color: Colors.red,
                          iconData: Icons.report_gmailerrorred,
                          onPressed: () {},
                          label: 'Report Service',
                        ),
                      )
                    : const SizedBox(),
              ],
            ),
            Divider(
              height: serviceDetails['status'] == 'completed' ||
                      serviceDetails['status'] == 'pending'
                  ? 0
                  : 30,
              color: serviceDetails['status'] == 'pending' ||
                      serviceDetails['status'] == 'completed'
                  ? Colors.transparent
                  : Colors.grey,
            ),
            serviceDetails['status'] == 'completed' ||
                    serviceDetails['status'] == 'pending'
                ? const SizedBox()
                : CustomActionButton(
                    iconData: Icons.payment_outlined,
                    label: 'Pay Now',
                    color: Colors.blue[800]!,
                    onPressed: () {
                      // serviceRequestBloc.add(ChangeServiceRequestStatusEvent(
                      //   requestId: serviceDetails['id'],
                      //   status: serviceDetails['status'] == 'pending'
                      //       ? 'accepted'
                      //       : serviceDetails['status'] == 'accepted'
                      //           ? 'completed'
                      //           : '',
                      // ));
                    },
                  ),
          ],
        ),
      ),
    );
  }
}
