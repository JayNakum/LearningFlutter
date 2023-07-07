import 'package:flutter/material.dart';
import 'package:iic_pdeu/helpers/api.dart';
import 'package:iic_pdeu/screens/startups/mentor_profile_screen.dart';

import '../../models/get_mentorprofile.dart';

class MentorsCards extends StatefulWidget {
  const MentorsCards({Key? key}) : super(key: key);

  @override
  State<MentorsCards> createState() => _MentorsCardsState();
}

class _MentorsCardsState extends State<MentorsCards> {
  bool _isLoading = true;
  List<GetMentorDetails> _mentors = [];

  @override
  void initState() {
    super.initState();
    API
        .getMentors()
        .then((value) => _mentors = value)
        .then((value) => setState(() => _isLoading = false))
        .then((_) => print(_mentors.first.image));
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                crossAxisSpacing: 10,
                mainAxisSpacing: 0,
                childAspectRatio: 2.4,
              ),
              itemCount: _mentors.length,
              itemBuilder: (ctx, i) {
                return MentorCard(
                  mentorName: _mentors[i].username,
                  mentorExpertise: _mentors[i].experties,
                  url: _mentors[i].image,
                  ontaps: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                MentorProfileScreen(_mentors[i])));
                  },
                );
              },
            ),
    );
  }
}

class MentorCard extends StatelessWidget {
  final String mentorName;
  final String mentorExpertise;
  final String url;
  final VoidCallback ontaps;

  const MentorCard({
    Key? key,
    required this.mentorName,
    required this.mentorExpertise,
    required this.url,
    required this.ontaps,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontaps,
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    mentorName,
                    style: TextStyle(
                      fontSize: 25,
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    mentorExpertise,
                    style: const TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 60),
              CircleAvatar(
                backgroundImage: NetworkImage(url),
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
