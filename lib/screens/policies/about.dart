import 'package:flutter/material.dart';
import 'package:arecanut_app/constants/dimensions.dart';

import '../../constants/constants.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var color = Theme.of(context).brightness == Brightness.dark ? const Color(0xFF333333) : Colors.white;

    return Scaffold(
      backgroundColor: color,
      appBar: AppBar(
        title: const Text("About",style: TextStyle(fontFamily: 'Inter'),),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(Dimensions.ten),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Welcome to ${Strings.appTitle}!',style: TextStyle(height: 1.2,fontSize: Dimensions.twenty),textAlign: TextAlign.left,),
              const Divider(),
              SizedBox(height: Dimensions.ten,),
              Text('    At ${Strings.appTitle}, we are dedicated to bridging the gap between arecanut cutting machine service providers and clients. Our innovative app serves as an intermediary platform, connecting clients in need of cutting machine services with trusted and reliable service providers. We strive to simplify the process, making it convenient and efficient for both parties.',style: TextStyle(height: 1.2,fontSize: Dimensions.fifteen),textAlign: TextAlign.left,),
              const Divider(),
              SizedBox(height: Dimensions.ten,),
              Text('Why choose us:',style: TextStyle(height: 1.2,fontSize: Dimensions.fifteen),textAlign: TextAlign.left,),
              SizedBox(height: Dimensions.ten,),
              // ListTile(
              //   // dense: true,
              //   // visualDensity: VisualDensity.compact,
              //   contentPadding: EdgeInsets.zero,
              //   leading: Text("1."),
              //   title: Text("Extensive Service Provider Network: We have established a wide network of verified and experienced arecanut cutting machine service providers. We carefully select our partners to ensure they meet our quality standards, ensuring that you receive the best service possible."),
              // ),
              const TextWithLeadingNumber(number: '1.', text: 'Extensive Service Provider Network: We have established a wide network of verified and experienced arecanut cutting machine service providers. We carefully select our partners to ensure they meet our quality standards, ensuring that you receive the best service possible.',),
              // Text('1. Extensive Service Provider Network: We have established a wide network of verified and experienced arecanut cutting machine service providers. We carefully select our partners to ensure they meet our quality standards, ensuring that you receive the best service possible.',style: TextStyle(height: 1.2,fontSize: Dimensions.fifteen),textAlign: TextAlign.left,),
              SizedBox(height: Dimensions.ten,),
              const TextWithLeadingNumber(number: '2.', text: 'Convenient Booking Process: Our user-friendly app allows you to effortlessly browse through a list of available service providers in your area. You can compare their profiles, services offered, and customer reviews. Once you\'ve made your choice, you can book a service directly through the app, eliminating the need for multiple phone calls or inquiries.',),
              // Text('2. Convenient Booking Process: Our user-friendly app allows you to effortlessly browse through a list of available service providers in your area. You can compare their profiles, services offered, and customer reviews. Once you\'ve made your choice, you can book a service directly through the app, eliminating the need for multiple phone calls or inquiries.',style: TextStyle(height: 1.2,fontSize: Dimensions.fifteen),textAlign: TextAlign.left,),
              SizedBox(height: Dimensions.ten,),
              const TextWithLeadingNumber(number: '3.', text: 'Transparent Pricing and Reviews: We believe in transparency, which is why we provide detailed information about each service provider\'s pricing structure. You can access real-time pricing information and read reviews from other clients who have previously utilized their services. This helps you make informed decisions based on your budget and specific requirements.',),
              // Text('3. Transparent Pricing and Reviews: We believe in transparency, which is why we provide detailed information about each service provider\'s pricing structure. You can access real-time pricing information and read reviews from other clients who have previously utilized their services. This helps you make informed decisions based on your budget and specific requirements.',style: TextStyle(height: 1.2,fontSize: Dimensions.fifteen),textAlign: TextAlign.left,),
              SizedBox(height: Dimensions.ten,),
              const TextWithLeadingNumber(number: '4.', text: 'Timely Service Delivery: We understand the importance of timely service delivery in the arecanut industry. By using our app, you can expect prompt response times from service providers and efficient scheduling of machine services. We aim to minimize downtime and ensure your operations run smoothly.',),
              // Text('4. Timely Service Delivery: We understand the importance of timely service delivery in the arecanut industry. By using our app, you can expect prompt response times from service providers and efficient scheduling of machine services. We aim to minimize downtime and ensure your operations run smoothly.',style: TextStyle(height: 1.2,fontSize: Dimensions.fifteen),textAlign: TextAlign.left,),
              SizedBox(height: Dimensions.ten,),
              const TextWithLeadingNumber(number: '5.', text: 'Secure Payments: Our app offers secure payment options, allowing you to conveniently pay for the services you receive. You can choose from multiple payment methods, ensuring a hassle-free and secure transaction process.',),
              // Text('5. Secure Payments: Our app offers secure payment options, allowing you to conveniently pay for the services you receive. You can choose from multiple payment methods, ensuring a hassle-free and secure transaction process.',style: TextStyle(height: 1.2,fontSize: Dimensions.fifteen),textAlign: TextAlign.left,),
              SizedBox(height: Dimensions.ten,),
              const TextWithLeadingNumber(number: '6.', text: 'Dedicated Customer Support: Our customer support team is always available to assist you throughout your journey with us. Whether you have questions about the app, need help with bookings, or require any other assistance, we\'re here to ensure your experience is seamless and satisfying.',),
              // Text('6. Dedicated Customer Support: Our customer support team is always available to assist you throughout your journey with us. Whether you have questions about the app, need help with bookings, or require any other assistance, we\'re here to ensure your experience is seamless and satisfying.',style: TextStyle(height: 1.2,fontSize: Dimensions.fifteen),textAlign: TextAlign.left,),
              SizedBox(height: Dimensions.ten,),
              Text('    At ${Strings.appTitle}, we are committed to revolutionizing the arecanut cutting machine service industry. Our app acts as the intermediary that brings together service providers and clients, fostering a reliable and efficient ecosystem. We strive to create a platform that saves you time, reduces effort, and ultimately enhances your arecanut processing operations.',style: TextStyle(height: 1.2,fontSize: Dimensions.fifteen),textAlign: TextAlign.left,),
              SizedBox(height: Dimensions.ten,),
              Text('    Thank you for choosing "${Strings.appTitle}"! We look forward to being your trusted partner, connecting you with top-quality service providers and ensuring your satisfaction every step of the way. ',style: TextStyle(height: 1.2,fontSize: Dimensions.fifteen),textAlign: TextAlign.left,),
              const Divider(),
              // SizedBox(height: Dimensions.ten,),
              Text('    If you have any feedback or suggestions, please don\'t hesitate to reach out to us - we\'re always happy to hear from our users!',style: TextStyle(height: 1.2,fontSize: Dimensions.fifteen),textAlign: TextAlign.left,),
              SizedBox(height: Dimensions.ten,),
              Text('Sincerely, "${Strings.appTitle}" Team',style: TextStyle(fontSize: Dimensions.twenty),textAlign: TextAlign.left,),

            ],
          ),
        ),
      ),
    );
  }
}

class TextWithLeadingNumber extends StatelessWidget {
  const TextWithLeadingNumber({
    super.key, required this.number, required this.text,
  });

  final String number;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: Dimensions.five), // Adjust vertical spacing
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(right: Dimensions.fifteen),
            child: Text(number),
          ),
          Expanded(
            child: Text(
              text,
              // "Extensive Service Provider Network: We have established a wide network of verified and experienced arecanut cutting machine service providers. We carefully select our partners to ensure they meet our quality standards, ensuring that you receive the best service possible.",
              style: TextStyle(fontSize: Dimensions.fifteen), // Customize the font size
            ),
          ),
        ],
      ),
    );
  }
}
