import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:staylit/blocs/complaint/complaint_bloc.dart';
import 'package:staylit/ui/widgets/complaints/complaints_card.dart';
import 'package:staylit/ui/widgets/custom_alert_dialog.dart';
import 'package:staylit/ui/widgets/custom_progress_indicator.dart';

class ComplaintsScreen extends StatefulWidget {
  const ComplaintsScreen({super.key});

  @override
  State<ComplaintsScreen> createState() => _ComplaintsScreenState();
}

class _ComplaintsScreenState extends State<ComplaintsScreen> {
  ComplaintBloc complaintBloc = ComplaintBloc();

  @override
  void initState() {
    complaintBloc.add(GetAllComplaintEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ComplaintBloc>.value(
      value: complaintBloc,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: false,
          title: Text(
            'Complaints',
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
        body: BlocConsumer<ComplaintBloc, ComplaintState>(
          listener: (context, state) {
            if (state is ComplaintFailureState) {
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
                      height: 20,
                    ),
                    Expanded(
                      child: state is ComplaintSuccessState
                          ? state.complaints.isNotEmpty
                              ? SingleChildScrollView(
                                  child: Wrap(
                                    runSpacing: 20,
                                    children: List<Widget>.generate(
                                      state.complaints.length,
                                      (index) => ComplaintCard(
                                        complaintDetails:
                                            state.complaints[index],
                                      ),
                                    ),
                                  ),
                                )
                              : const Center(
                                  child: Text('No Complaint found'),
                                )
                          : state is ComplaintLoadingState
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
      ),
    );
  }
}
