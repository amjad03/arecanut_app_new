import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:intl/intl.dart';

class BookMachineMobile extends StatefulWidget {
  const BookMachineMobile(
      {Key? key,
      required this.title,
      required this.image,
      required this.price,
      required this.rating,
      required this.distance,
      required this.totalRatings,
      required this.address})
      : super(key: key);

  final String title;
  final String image;
  final String price;
  final String rating;
  final String distance;
  final String totalRatings;
  final String address;

  @override
  State<BookMachineMobile> createState() => _BookMachineMobileState();
}

class _BookMachineMobileState extends State<BookMachineMobile> {
  @override
  Widget build(BuildContext context) {
    var formatter = NumberFormat('#,###');
    var formattedPrice = formatter.format(double.parse(widget.price));

    var perKg = double.parse(widget.price) / 100;

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              const Divider(
                indent: 20,
                endIndent: 20,
                thickness: 0.5,
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Confirm Booking",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                        height: 210,
                        width: 120,
                        color: Colors.grey,
                        child: Image.network(
                          widget.image,
                          fit: BoxFit.cover,
                        )),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.title,
                          style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              height: 2),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Row(
                          children: [
                            Text(
                              widget.rating.toString(),
                              style: const TextStyle(fontSize: 14),
                            ),
                            RatingBar.builder(
                              initialRating: double.parse(
                                  widget.rating), // The rating value
                              minRating: 1, // Minimum rating value
                              direction: Axis
                                  .horizontal, // The direction of the rating bar
                              allowHalfRating:
                                  true, // Allow half ratings (e.g., 3.5 stars)
                              itemCount: 5, // Total number of stars
                              itemSize: 15, // Size of each star
                              itemBuilder: (context, _) => const Icon(
                                Icons.star,
                                color:
                                    Colors.orange, // Color of the filled star
                              ),
                              onRatingUpdate: (rating) {
                                // Callback function when the rating is updated
                                if (kDebugMode) {
                                  print(rating);
                                }
                              },
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Text(
                              "${widget.totalRatings} ratings",
                              style: const TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                        Text(
                          widget.address,
                          style: const TextStyle(fontSize: 14, height: 1.5),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Row(
                          children: [
                            Text(
                              "Rs : ₹ $formattedPrice /- ",
                              style: const TextStyle(fontSize: 18, height: 1.5),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              "per 100kg (Rs.$perKg per kg)",
                              style: const TextStyle(fontSize: 14, height: 1.5),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                        Text(
                          "Distance: ${widget.distance} km away",
                          style: const TextStyle(fontSize: 18, height: 1.5),
                        )
                      ],
                    ),
                  )
                ],
              ),
              const Divider(
                thickness: 0.5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
