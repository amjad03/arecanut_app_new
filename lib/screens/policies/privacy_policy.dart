import 'package:arecanut_app/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:arecanut_app/constants/dimensions.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var color = Theme.of(context).brightness == Brightness.dark ? const Color(0xFF333333) : Colors.white;

    return Scaffold(
      backgroundColor: color,
      appBar: AppBar(
        title: const Text("Privacy & Policy",style: TextStyle(fontFamily: 'Inter'),),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(Dimensions.ten),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Privacy Policy for ${Strings.appTitle}",style: TextStyle(fontSize: Dimensions.eighteen,fontWeight: FontWeight.bold,fontFamily: 'Inter')),
              SizedBox(height: Dimensions.height10,),
              Text('At ${Strings.appTitle}, we are committed to protecting the privacy of our users. This Privacy Policy describes how we collect, use, and disclose information about you when you use our app ("${Strings.appTitle}").',style: TextStyle(fontSize: Dimensions.fifteen),textAlign: TextAlign.left,),
              const Divider(),
              SizedBox(height: Dimensions.height10,),
              Text("Information We Collect",style: TextStyle(fontSize: Dimensions.eighteen,fontWeight: FontWeight.w400,fontFamily: 'Inter')),
              SizedBox(height: Dimensions.height10,),
              Text('We collect certain information about you when you use the App,',style: TextStyle(fontSize: Dimensions.fifteen),textAlign: TextAlign.left,),
              SizedBox(height: Dimensions.height10,),
              Text('  We collect personal information such as your name, email address, phone number, when you provide it to us voluntarily, when you interact with our App',style: TextStyle(fontSize: Dimensions.fifteen),textAlign: TextAlign.left,),
              const Divider(),
              SizedBox(height: Dimensions.height10,),
              Text("How We Use Your Information",style: TextStyle(fontSize: Dimensions.eighteen,fontWeight: FontWeight.w400,fontFamily: 'Inter')),
              SizedBox(height: Dimensions.height10,),
              Text('We use the personal information we collect to provide you with our services, to communicate with you, to improve our products and services, and to comply with legal obligations. We may also use your personal information to send you promotional materials, but only if you have given us your consent to do so.',style: TextStyle(fontSize: Dimensions.fifteen),textAlign: TextAlign.left,),
              const Divider(),
              SizedBox(height: Dimensions.height10,),
              Text("Security of Your Information",style: TextStyle(fontSize: Dimensions.eighteen,fontWeight: FontWeight.w400,fontFamily: 'Inter')),
              SizedBox(height: Dimensions.height10,),
              Text('We take reasonable measures to protect the personal information we collect from loss, theft, misuse, and unauthorized access, disclosure, alteration, and destruction.',style: TextStyle(fontSize: Dimensions.fifteen),textAlign: TextAlign.left,),
              const Divider(),
              SizedBox(height: Dimensions.height10,),
              Text("Your Rights:",style: TextStyle(fontSize: Dimensions.eighteen,fontWeight: FontWeight.w400,fontFamily: 'Inter')),
              SizedBox(height: Dimensions.height10,),
              Text('You have the right to access and correct your personal information, and to ask us to delete it in certain circumstances. You may also opt-out of receiving promotional communications from us at any time.',style: TextStyle(fontSize: Dimensions.fifteen),textAlign: TextAlign.left,),
              const Divider(),
              SizedBox(height: Dimensions.height10,),
              Text("Updates to Our Privacy Policy:",style: TextStyle(fontSize: Dimensions.eighteen,fontWeight: FontWeight.w400,fontFamily: 'Inter')),
              SizedBox(height: Dimensions.height10,),
              Text('We may update this Privacy Policy from time to time. We will notify you of any changes by posting the new Privacy Policy.',style: TextStyle(fontSize: Dimensions.fifteen),textAlign: TextAlign.left,),
              const Divider(),
              SizedBox(height: Dimensions.height10,),
              Text("Contact Us:",style: TextStyle(fontSize: Dimensions.eighteen,fontWeight: FontWeight.w400,fontFamily: 'Inter')),
              SizedBox(height: Dimensions.height10,),
              Text('If you have any questions about this Privacy Policy or our privacy practices, please contact us at ',style: TextStyle(fontSize: Dimensions.fifteen),textAlign: TextAlign.left,),
              Text('query.${Strings.appTitle}@gmail.com',style: TextStyle(fontSize: Dimensions.fifteen,color: Colors.blue),textAlign: TextAlign.left,),

            ],
          ),
        ),
      ),
    );
  }
}

/*
* Privacy Policy for Arecanut Cutting Machine Service Provider App:

This Privacy Policy governs the manner in which the Arecanut Cutting Machine Service Provider App collects, uses, maintains, and discloses information collected from users (referred to as "Users") of the app. This Privacy Policy applies to the app and all products and services offered by the Arecanut Cutting Machine Service Provider App.

1. Information Collection:
   - Personal Identification Information: We may collect personal identification information from Users when they register or interact with the app. This information may include the user's name, email address, contact number, and other necessary details.
   - Non-personal Identification Information: We may collect non-personal identification information about Users whenever they interact with the app. This information may include the device name, device model, operating system, and other technical details.

2. Information Usage:
   - The information we collect from Users is used for the following purposes:
     - To provide and improve our services: We may use the information to personalize user experience, improve customer service, and enhance the functionality of the app.
     - To send periodic emails: We may use the email address provided by Users to respond to their inquiries, questions, and other requests.
     - To ensure security and prevent fraud: We may use the collected information to verify user identity, detect and prevent fraudulent activities, and maintain the integrity of our services.

3. Data Protection:
   - We adopt appropriate data collection, storage, and processing practices to protect against unauthorized access, alteration, disclosure, or destruction of user information.
   - We implement industry-standard security measures to safeguard user data and follow best practices to ensure the security of our app and services.

4. Information Sharing:
   - We do not sell, trade, or rent user information to others.
   - We may share generic aggregated demographic information not linked to any personal identification information regarding our Users with our business partners, trusted affiliates, and advertisers.

5. Third-Party Services:
   - We may use third-party service providers to assist us in operating our app and providing services to our Users. These third parties have their own privacy policies, and we encourage Users to review their privacy policies.

6. Changes to this Privacy Policy:
   - The Arecanut Cutting Machine Service Provider App has the discretion to update this Privacy Policy at any time. We encourage Users to frequently check this page for any changes and stay informed about how we are helping to protect the personal information we collect.

7. User Acceptance:
   - By using this app, Users signify their acceptance of this Privacy Policy. If a User does not agree to this policy, they should refrain from using the app.

It is important to review and understand this Privacy Policy. By using the Arecanut Cutting Machine Service Provider App, Users acknowledge that they have read and agreed to the terms and conditions outlined in this Privacy Policy.

This Privacy Policy was last updated on [Insert Date].
*
* */
