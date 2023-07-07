import 'package:flutter/material.dart';

import './drop_down_cards.dart';
import './profile_cards.dart';
import './profile_header.dart';

class ProfileDetails extends StatelessWidget {
  const ProfileDetails({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const <Widget>[
        ProfileHeader(),
        SizedBox(height: 10),
        ProfileCards(),
        SizedBox(height: 10),
        DropDownCards(),
      ],
    );
  }
}
