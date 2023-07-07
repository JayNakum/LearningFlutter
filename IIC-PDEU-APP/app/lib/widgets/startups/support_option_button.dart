import 'package:flutter/material.dart';
import 'package:iic_pdeu/screens/startups/forms/IPR_Service_form.dart';
import 'package:iic_pdeu/screens/startups/forms/Procurement_Services.dart';
import 'package:iic_pdeu/screens/startups/forms/accomodation_screen.dart';
import 'package:iic_pdeu/screens/startups/forms/exit_graduation_service_form.dart';
import 'package:iic_pdeu/screens/startups/forms/financial_services.dart';
import 'package:iic_pdeu/screens/startups/forms/lab_services.dart';
import 'package:url_launcher/url_launcher.dart';

class SupportServices extends StatelessWidget {
  const SupportServices({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height - 150,
        child: GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 0.75,
            crossAxisCount: 2,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
          ),
          children: <SupportButton>[
            SupportButton(
              serviceName: 'Accomodation',
              picture: 'assets/images/Hostel Mess.jpg',
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => const AccomodationAndMessScreen(),
                  ),
                );
              },
            ),
            SupportButton(
              serviceName: 'IPR',
              picture: 'assets/images/IPR.jpg',
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => const IPRServicesScreen(),
                  ),
                );
              },
            ),
            SupportButton(
              serviceName: 'Financial',
              picture: 'assets/images/Reimbursement.jpg',
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => const FinancialServicesScreen(),
                  ),
                );
              },
            ),
            SupportButton(
              serviceName: 'Procurement',
              picture: 'assets/images/Procurement.jpg',
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => const ProcuermentServicesScreen(),
                  ),
                );
              },
            ),
            SupportButton(
              serviceName: 'Lab',
              picture: 'assets/images/Lab.jpg',
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => const LabServicesScreen(),
                  ),
                );
              },
            ),
            SupportButton(
              serviceName: 'Exit & Graduation',
              picture: 'assets/images/Exit and Graduation.jpg',
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => const ExitAndGraduationScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class SupportButton extends StatelessWidget {
  final String serviceName;
  final String picture;
  final Function()? onPressed;

  const SupportButton({
    required this.serviceName,
    required this.picture,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: SizedBox(
        height: 800,
        child: Card(
          elevation: 5,
          color: Theme.of(context).colorScheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Expanded(
                  child: Container(
                      decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.onPrimary,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15),
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                    image: DecorationImage(
                      image: AssetImage(picture),
                      fit: BoxFit.fill,
                    ),
                  )),
                ),
                const SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.fromLTRB(6, 13, 6, 10),
                  child: Text(
                    serviceName,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimary,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
