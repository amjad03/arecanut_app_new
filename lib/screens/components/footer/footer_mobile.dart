import 'package:arecanut_app/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).brightness == Brightness.dark
        ? Colors.grey.shade800
        : Colors.grey[200];

    final dividerColor = Theme.of(context).brightness == Brightness.dark
        ? Colors.black54
        : Colors.grey;

    return Container(
      width: double.maxFinite,
      color: color,
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Contact Information',
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10.0),
          Divider(
            indent: 15,
            endIndent: 15,
            color: dividerColor,
          ),
          const SizedBox(height: 10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.call),
              SizedBox(
                width: 10,
              ),
              Text(
                '+91 ${AppInfo.contactNumber1}',
                style: TextStyle(fontSize: 14.0),
              ),
            ],
          ),
          const SizedBox(height: 10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.call),
              SizedBox(
                width: 10,
              ),
              Text(
                '+91 ${AppInfo.contactNumber2}',
                style: TextStyle(fontSize: 14.0),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.email),
              SizedBox(
                width: 10,
              ),
              Text(
                AppInfo.companyEmail,
                style: TextStyle(fontSize: 14.0),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.location_on),
              SizedBox(
                width: 10,
              ),
              Text(
                '${AppInfo.companyAddress}, India',
                style: TextStyle(fontSize: 14.0),
              ),
            ],
          ),
          const SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: const FaIcon(
                  FontAwesomeIcons.facebook,
                  size: 20,
                ),
                onPressed: () {
                  // Add your Facebook URL or action here
                },
              ),
              IconButton(
                icon: const FaIcon(
                  FontAwesomeIcons.twitter,
                  size: 20,
                ),
                onPressed: () {
                  // Add your Twitter URL or action here
                },
              ),
              IconButton(
                icon: const FaIcon(
                  FontAwesomeIcons.instagram,
                  size: 20,
                ),
                onPressed: () {
                  // Add your Instagram URL or action here
                },
              ),
              IconButton(
                icon: const FaIcon(
                  FontAwesomeIcons.youtube,
                  size: 20,
                ),
                onPressed: () {
                  // Add your Instagram URL or action here
                },
              ),
            ],
          ),
          const SizedBox(height: 10.0),
          Divider(
            indent: 15,
            endIndent: 15,
            color: dividerColor,
          ),
          const SizedBox(height: 16.0),
          Text(
            '© ${DateTime.now().year} ${AppInfo.appName}. All rights reserved.',
            style: const TextStyle(fontSize: 14.0),
          ),
        ],
      ),
    );
  }
}
