import 'package:flutter/material.dart';
import 'package:iic_pdeu/models/getstartdetails.dart';

import '../../helpers/api.dart';
import '../../models/roles.dart';
import '../../screens/admins/startupprofile_admin.dart';
import '../../screens/mentors/startup_profile_screen.dart';

class StartupsCards extends StatefulWidget {
  const StartupsCards({Key? key}) : super(key: key);

  @override
  State<StartupsCards> createState() => _StartupsCardsState();
}

class _StartupsCardsState extends State<StartupsCards> {
  bool _isLoading = true;
  List<GetStartUpDetails> _startupDetails = [];

  @override
  void initState() {
    super.initState();
    API
        .getStartUps()
        .then((value) => _startupDetails = value)
        .then((value) => setState(() => _isLoading = false));
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height - 200,
      width: MediaQuery.of(context).size.width,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 2.2,
        ),
        itemCount: _startupDetails.length,
        itemBuilder: (ctx, i) {
          return StartupCard(
            // startupName: startUps[i].name,
            // imageUrl: startUps[i].imageUrl,
            startupName: _startupDetails[i].username,
            imageUrl: _startupDetails[i].image,
            startdesc: _startupDetails[i].username,
            ontap2: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          StartupAdminProfileScreen(_startupDetails[i])));
            },
          );
        },
      ),
    );
  }
}

class StartupCard extends StatelessWidget {
  final String startupName, imageUrl, startdesc;
  final VoidCallback ontap2;

  const StartupCard({
    required this.ontap2,
    required this.startupName,
    required this.imageUrl,
    required this.startdesc,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap2,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(14, 10, 14, 10),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
            side: const BorderSide(
              color: Colors.blue,
              width: 1.2,
            ),
          ),
          elevation: 5,
          child: Row(
            children: [
              Container(
                width: 15,
                decoration: const BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    bottomLeft: Radius.circular(15),
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      startupName,
                      style: TextStyle(
                        fontSize: 25,
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(startdesc,
                        style: TextStyle(
                          fontSize: 15,
                          color: Theme.of(context).colorScheme.secondary,
                          //overflow: TextOverflow.ellipsis,
                        )),
                  ],
                ),
              ),
              const SizedBox(width: 15),
              CircleAvatar(
                backgroundImage: NetworkImage(imageUrl),
                backgroundColor: Theme.of(context).colorScheme.secondary,
                radius: 40,
                // child: const Text('AH'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
