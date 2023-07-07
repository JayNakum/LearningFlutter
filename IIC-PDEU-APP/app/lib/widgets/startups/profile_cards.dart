import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iic_pdeu/widgets/startups/Project_details.dart';
import 'package:iic_pdeu/widgets/startups/team_members.dart';

class ProfileCards extends StatelessWidget {
  const ProfileCards({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.35,
        child: Card(
          color: Theme.of(context).colorScheme.primary,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(15),
              topLeft: Radius.circular(15),
            ),
          ),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ProfileCard(
                    title: 'Project Details',
                    icon: 'assets/images/project.png',
                    size: 220,
                    ontap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ProjectDetails()));
                    },
                  ),
                  const SizedBox(width: 10),
                  ProfileCard(
                    title: 'Team Details',
                    icon: 'assets/images/team.png',
                    size: 100,
                    ontap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const TeamMembers(
                                  username: '', page: 'startup')));
                    },
                  ),
                  // const SizedBox(width: 10),
                  // ProfileCard(
                  //   title: 'Plans',
                  //   icon: FontAwesomeIcons.sheetPlastic,
                  //   ontap: () {
                  //     Navigator.push(
                  //         context,
                  //         MaterialPageRoute(
                  //             builder: (context) => const TeamMembers()));
                  //   },
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ProfileCard extends StatelessWidget {
  final String title;
  final String icon;
  final double size;
  final VoidCallback ontap;

  const ProfileCard({
    required this.title,
    required this.icon,
    required this.ontap,
    Key? key,
    required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onPrimary,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(7),
            bottomRight: Radius.circular(15),
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
        ),
        width: 150,
        height: 200,
        padding: const EdgeInsets.all(8.0),
        child: GridTile(
          footer: Center(
            child: Text(
              title,
              softWrap: false,
              overflow: TextOverflow.fade,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          child: Center(
            child: ImageIcon(
              AssetImage(icon.toString()),
              size: size,
              color: Colors.lightBlueAccent,
            ),
          ),
        ),
      ),
    );
  }
}
