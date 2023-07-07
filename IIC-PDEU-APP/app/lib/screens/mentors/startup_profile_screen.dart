import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class StartupProfileScreen extends StatefulWidget {
  const StartupProfileScreen({Key? key}) : super(key: key);

  @override
  State<StartupProfileScreen> createState() => _StartupProfileScreenState();
}

class _StartupProfileScreenState extends State<StartupProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('IIC PDEU'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 130,
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 60,
                      child: Image.asset(
                        'assets/images/logo.png',
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    const Text(
                      " Startup Name",
                      style: TextStyle(
                        fontSize: 26,
                        color: Colors.blue,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) =>
                            _buildPopupDialog(context),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                      textStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    child: const Text('Appointments List'),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: GestureDetector(
                    onTap: () {},
                    child: SizedBox(
                      height: 90,
                      width: MediaQuery.of(context).size.width * 0.51,
                      child: Card(
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: const BorderSide(
                            color: Colors.blue,
                            width: 1.2,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const <Widget>[
                              Text(
                                "Download Quarterly Plan",
                                //overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 22,
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              //SizedBox(height: 10),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: GestureDetector(
                    onTap: () {
                      launch(
                          'mailto:papnejaanmol@gmail.com?subject= Upgrade startup&body=This is Body of Email');
                    },
                    child: SizedBox(
                      height: 90,
                      width: MediaQuery.of(context).size.width * 0.42,
                      child: Card(
                        elevation: 3,
                        color: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                "Recommed To Upgrade",
                                style: TextStyle(
                                  fontSize: 22,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              //SizedBox(height: 10),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 200,
                width: MediaQuery.of(context).size.width,
                child: Card(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: const BorderSide(
                      color: Colors.blue,
                      width: 1.2,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const <Widget>[
                        Text(
                          "Minutes Of Meeting",
                          style: TextStyle(
                            fontSize: 22,
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "data to be fetched",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 0, 12, 4),
              child: SizedBox(
                height: 170,
                width: MediaQuery.of(context).size.width,
                child: Card(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: const BorderSide(
                      color: Colors.blue,
                      width: 1.2,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Text(
                              "Action points",
                              style: TextStyle(
                                fontSize: 22,
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(width: 130),
                            ElevatedButton(
                              onPressed: () => showDialog<String>(
                                context: context,
                                builder: (BuildContext context) => AlertDialog(
                                  title: const Text('Add new Action Points'),
                                  actions: <Widget>[
                                    TextFormField(
                                      decoration: const InputDecoration(
                                        label: Text('Email'),
                                        // hintText: 'Enter Your Email',
                                        border: OutlineInputBorder(),
                                        filled: true,
                                      ),
                                      keyboardType: TextInputType.emailAddress,
                                    ),
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.pop(context, 'Cancel'),
                                      child: const Text('Cancel'),
                                    ),
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.pop(context, 'OK'),
                                      child: const Text('OK'),
                                    ),
                                  ],
                                ),
                              ),
                              child: const Icon(
                                Icons.add,
                              ),
                            ),
                          ],
                        ),
                        const Divider(
                          color: Colors.black,
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          "data to be fetched",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 120,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      launch(
                          'mailto:papnejaanmol@gmail.com?subject=This is Subject Title&body=This is Body of Email');
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                      textStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const <Widget>[
                        Text(
                          'Mail',
                        ),
                        SizedBox(width: 10),
                        Icon(Icons.mail),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 160,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      launch('sms:+918734080491?body= Enter your Message here');
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                      textStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const <Widget>[
                        Text(
                          'Message',
                        ),
                        SizedBox(width: 10),
                        Icon(Icons.mail),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildPopupDialog(BuildContext context) {
  return AlertDialog(
    title: const Text('Appointments'),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const <Widget>[
        Text("Minerva"),
      ],
    ),
    actions: <Widget>[
      FlatButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        textColor: Theme.of(context).primaryColor,
        child: const Text('Close'),
      ),
    ],
  );
}
