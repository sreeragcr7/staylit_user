import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:staylit/blocs/service_request/service_request_bloc.dart';
import 'package:staylit/ui/widgets/complaints/add_complaint_dialog.dart';
import 'package:staylit/ui/widgets/custom_action_button.dart';
import 'package:staylit/ui/widgets/custom_alert_dialog.dart';
import 'package:staylit/ui/widgets/custom_button.dart';
import 'package:staylit/ui/widgets/custom_card.dart';
import 'package:staylit/ui/widgets/custom_progress_indicator.dart';
import 'package:staylit/ui/widgets/label_with_text.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

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
                            fit: BoxFit.fill,
                            height: 150,
                            width: MediaQuery.of(context).size.width - 40,
                          ),
                        ),
                        SizedBox(
                          height: 150,
                          width: MediaQuery.of(context).size.width - 40,
                          child: Material(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.black38,
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
                        status = value ?? 'pending';
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
                                        serviceRequestDetails:
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

class ServiceRequestCard extends StatefulWidget {
  final Map<String, dynamic> serviceRequestDetails;
  final ServiceRequestBloc serviceRequestBloc;
  const ServiceRequestCard({
    super.key,
    required this.serviceRequestDetails,
    required this.serviceRequestBloc,
  });

  @override
  State<ServiceRequestCard> createState() => _ServiceRequestCardState();
}

class _ServiceRequestCardState extends State<ServiceRequestCard> {
  @override
  void initState() {
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    super.initState();
  }

  final Razorpay _razorpay = Razorpay();
  void _handlePaymentSuccess(PaymentSuccessResponse response) async {
    await showDialog(
      context: context,
      builder: (context) => CustomAlertDialog(
        title: 'Payment Success',
        message:
            'Thank you for the payment, our staff will be there within 5 minutes',
        primaryButtonLabel: 'Ok',
        primaryOnPressed: () {
          widget.serviceRequestBloc.add(
            MakePaymentEvent(
              requestId: widget.serviceRequestDetails['id'],
              serviceId: widget.serviceRequestDetails['service']['id'],
            ),
          );

          Navigator.pop(context);
        },
      ),
    );

    // widget.manageListingsBloc.add(
    //   OrderListingsEvent(
    //     listingId: widget.listDetails['id'],
    //   ),
    // );
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    // Logger().e(response.error);
    showDialog(
      context: context,
      builder: (context) => CustomAlertDialog(
        title: 'Payment Failed',
        message: response.message ?? 'Something went wrong, Please try again',
        primaryButtonLabel: 'Ok',
      ),
    );
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Do something when an external wallet was selected
  }

  void makePayment() async {
    // String orderId = await createOrder(widget.testDetails['total_price']);

    var options = {
      'key': 'rzp_test_j07YpjyCexi5xr',
      'amount': (widget.serviceRequestDetails['service']['price']) * 100,
      'name': 'PetsMart',
      // 'order_id': orderId,
      'description': '#${widget.serviceRequestDetails['service']['service']}',
      'prefill': {
        'contact': '9999999999',
        'email': Supabase.instance.client.auth.currentUser!.email,
      }
    };
    Logger().w(options);
    _razorpay.open(options);
  }

  @override
  void dispose() {
    _razorpay.clear(); // Removes all listeners
    super.dispose();
  }

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
                    DateFormat('dd/MM/yyyy hh:mm a').format(DateTime.parse(
                            widget.serviceRequestDetails['created_at'])
                        .toLocal()),
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: Colors.grey[600],
                          fontWeight: FontWeight.w400,
                        ),
                  ),
                ),
                Expanded(
                  child: Text(
                    widget.serviceRequestDetails['status'] == 'pending'
                        ? 'Pending'
                        : widget.serviceRequestDetails['status'] == 'accepted'
                            ? 'Accepted'
                            : 'Completed',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: widget.serviceRequestDetails['status'] ==
                                  'pending'
                              ? Colors.grey[600]
                              : widget.serviceRequestDetails['status'] ==
                                      'accepted'
                                  ? Colors.green
                                  : Colors.blue[900],
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
                    text: widget.serviceRequestDetails['service']['service'],
                  ),
                ),
                Expanded(
                  child: LabelWithText(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    label: 'Accepted By',
                    text: widget.serviceRequestDetails['acceptedBy'] != null
                        ? widget.serviceRequestDetails['acceptedBy']['name']
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
                    text: widget.serviceRequestDetails['room']['room_no'],
                  ),
                ),
                Expanded(
                  child: LabelWithText(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    label: 'Price',
                    text:
                        '₹${widget.serviceRequestDetails['service']['price'].toString()}',
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
                    text: widget.serviceRequestDetails['payment_status'] ==
                            'pending'
                        ? 'Pending'
                        : 'Paid',
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: CustomActionButton(
                    color: Colors.red,
                    iconData: Icons.report_gmailerrorred,
                    onPressed: () async {
                      await showDialog(
                        context: context,
                        builder: (_) => AddComplaintDialog(
                          serviceRequestId: widget.serviceRequestDetails['id'],
                        ),
                      );

                      showDialog(
                        context: context,
                        builder: (_) => const CustomAlertDialog(
                          title: 'Received',
                          message:
                              'Your complaint has been received to the admin of STAYLIT. Will fix your complaint as soon as possible',
                          primaryButtonLabel: 'Ok',
                        ),
                      );
                    },
                    label: 'Report Service',
                  ),
                ),
              ],
            ),
            Divider(
              height: widget.serviceRequestDetails['status'] == 'completed'
                  ? 0
                  : 30,
              color: widget.serviceRequestDetails['status'] == 'completed'
                  ? Colors.transparent
                  : Colors.grey,
            ),
            widget.serviceRequestDetails['status'] == 'accepted'
                ? CustomActionButton(
                    iconData: Icons.payment_outlined,
                    label: 'Pay Now',
                    color: Colors.green[900]!,
                    onPressed: () {
                      makePayment();
                    },
                  )
                : const SizedBox(),
            widget.serviceRequestDetails['status'] == 'pending'
                ? CustomActionButton(
                    iconData: Icons.delete_forever_outlined,
                    label: 'Delete Request',
                    color: Colors.red[800]!,
                    onPressed: () {
                      widget.serviceRequestBloc.add(DeleteServiceRequestEvent(
                        serviceRequestId: widget.serviceRequestDetails['id'],
                        serviceId: widget.serviceRequestDetails['service_id'],
                      ));
                    },
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
