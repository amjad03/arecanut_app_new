import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../widgets/custom_button.dart';
import '../../components/footer/footer_mobile.dart';

DateTime selectedDate = DateTime.now();
var date = "${selectedDate.day}/${selectedDate.month}/${selectedDate.year}";

String type = '';

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
  final qtyController = TextEditingController();
  double qty = 0.0;

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).brightness == Brightness.dark
        ? Colors.grey.shade50.withOpacity(0.5)
        : Colors.grey;
    var formatter = NumberFormat('#,###');
    var formattedPrice = formatter.format(double.parse(widget.price));

    var perKg = double.parse(widget.price) / 100;

    var total = qty * perKg;
    var formattedTotal = formatter.format(total);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              const Divider(
                indent: 30,
                endIndent: 30,
                thickness: 0.5,
                color: Colors.black,
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Book Machine",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                        height: 160,
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
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        customSizedBox(),
                        Row(
                          children: [
                            Text(
                              widget.rating.toString(),
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              width: 10,
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
                              itemSize: 25, // Size of each star
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
                              style: const TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                        customSizedBox(),
                        Text(
                          widget.address,
                          style: const TextStyle(fontSize: 16, height: 1.5),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        customSizedBox(),
                        Row(
                          children: [
                            Text(
                              "Rs : ₹ $formattedPrice /- ",
                              style: const TextStyle(fontSize: 22, height: 1.5),
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
                        customSizedBox(),
                        Text(
                          "Distance: ${widget.distance} km away",
                          style: const TextStyle(fontSize: 18, height: 1.5),
                        )
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              const Divider(
                thickness: 0.5,
                color: Colors.black,
              ),
              const SizedBox(
                height: 10,
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Fill the below Details",
                  style: TextStyle(fontSize: 22),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Row(
                children: [
                  // SizedBox(
                  //   width: 150,
                  //   child: Row(
                  //     children: const [
                  //       Text(
                  //         "Select Date ",
                  //         style: TextStyle(fontSize: 18),
                  //       ),
                  //       Text(
                  //         "*",
                  //         style: TextStyle(fontSize: 18, color: Colors.red),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  // const Text(
                  //   ":",
                  //   style: TextStyle(fontSize: 20),
                  // ),
                  // const SizedBox(
                  //   width: 15,
                  // ),
                  textAndInputWidget("Select Date", false),
                  const DatePicker()
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  textAndInputWidget("Add Quantity", false),
                  Expanded(
                      child: Container(
                    height: 50,
                    child: TextField(
                      controller: qtyController,
                      decoration: InputDecoration(
                          hintText: "eg: 120",
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0)),
                            borderSide: BorderSide(
                              color: color,
                              width: 1.0,
                            ),
                          ),
                          suffixText: "KG"),
                      onChanged: (val) {
                        setState(() {
                          var v = val ?? '0';
                          // qty = double.parse(v);
                          qty = double.tryParse(v) ?? 0.0;
                        });
                      },
                      keyboardType: TextInputType.number,
                    ),
                  ))
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  textAndInputWidget("Select Type", false),
                  const Expanded(child: DropDown()
                      //     Container(
                      //   height: 50,
                      //   child: TextField(
                      //     decoration: InputDecoration(
                      //       hintText: "eg: Chali",
                      //       border: OutlineInputBorder(
                      //         borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      //         borderSide: BorderSide(
                      //           color: color,
                      //           width: 1.0,
                      //         ),
                      //       ),
                      //     ),
                      //     keyboardType: TextInputType.number,
                      //   ),
                      // )
                      )
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              const Divider(
                thickness: 0.5,
                color: Colors.black,
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                // crossAxisAlignment: CrossAxisAlignment.,
                // mainAxisAlignment: MainAxisAlignment.,
                children: [
                  SizedBox(
                    width: 120,
                    height: 60,
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Total Price",
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            ":",
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Rs : ₹ $formattedTotal /-",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "${qty}kg x Rs.$perKg(per Kg) = Rs. $formattedTotal",
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              Row(
                children: [
                  Expanded(
                      child: SizedBox(
                    height: 50,
                    child: CustomOutlineButton(
                      title: "Cancel",
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      fontSize: 18,
                    ),
                  )),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      child: SizedBox(
                    height: 50,
                    child: CustomButton(
                      title: "Confirm Booking",
                      onPressed: () {},
                      fontSize: 18,
                    ),
                  ))
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              const Divider(
                thickness: 0.5,
                color: Colors.black,
              ),
              const SizedBox(
                height: 15,
              ),
              const Footer()
            ],
          ),
        ),
      ),
    );
  }

  customSizedBox() {
    return const SizedBox(
      height: 5,
    );
  }

  textAndInputWidget(text, opt) {
    return Row(
      children: [
        SizedBox(
          width: 150,
          child: Row(
            children: [
              Text(
                "$text ",
                style: TextStyle(fontSize: 18),
              ),
              if (!opt)
                const Text(
                  "*",
                  style: TextStyle(fontSize: 18, color: Colors.red),
                ),
            ],
          ),
        ),
        const Text(
          ":",
          style: TextStyle(fontSize: 20),
        ),
        const SizedBox(
          width: 15,
        ),
      ],
    );
  }
}

//-----------------------Date picker calendar ------------------------//
class DatePicker extends StatefulWidget {
  const DatePicker({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _DatePickerState createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  /// Which holds the selected date
  /// Defaults to today's date.
  // DateTime selectedDate = DateTime.now();

  _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).brightness == Brightness.dark
        ? Colors.grey.shade50.withOpacity(0.5)
        : Colors.grey;

    return Expanded(
      child: InkWell(
          onTap: () => _selectDate(context),
          child: Container(
            // width: 50,
            height: 50,
            decoration: BoxDecoration(
              border: Border.all(
                color: color,
              ),
              // color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.calendar_month,
                    // color: Colors.black45,
                  ),
                ),
                Center(
                    child: Text(
                        "${selectedDate.day}/${selectedDate.month}/${selectedDate.year}")),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.arrow_drop_down),
                )
              ],
            ),
          )),
    );
  }
}

//------------------------Input Decoration-------------------------//

InputDecoration customInputDecoration(hint) {
  return InputDecoration(
    border: const OutlineInputBorder(),
    hintText: hint,
  );
}

//------------------------ Select Arecanut Type-----------------------//

class DropDown extends StatefulWidget {
  const DropDown({Key? key}) : super(key: key);

  @override
  State<DropDown> createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  _DropDownState() {
    type = arecanutTypes[0];
  }

  List arecanutTypes = [
    'Chali(ಚಾಳಿ)',
    'Bettele(ಬೇತೆಲೆ)',
    'Maalige(ಮಾಲಿಗೆ)',
    'Poppina kaaḍu(ಪೋಪ್ಪಿನ ಕಾಡು)',
    'Regu(ರೇಗು )',
    'Goli supari(ಗೋಳಿ ಸುಪಾರಿ)',
    'Saasive(ಸಾಸಿವೆ)',
    'Jenasi(ಜೆನಸಿ)'
  ];
  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).brightness == Brightness.dark
        ? Colors.grey.shade50.withOpacity(0.5)
        : Colors.grey;
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
            color: color,
            // width: 0.5
          ),
          borderRadius: BorderRadius.circular(5)),
      child: DropdownButtonFormField(
        value: type,
        hint: const Text(
          'Select Type',
          style: TextStyle(fontFamily: 'Inter'),
        ),
        onChanged: (value) {
          setState(() {
            type = value!;
          });
        },
        items: arecanutTypes.map((e) {
          return DropdownMenuItem<String>(
            value: e,
            child: Text(
              e,
              style: const TextStyle(fontFamily: 'Inter'),
            ),
          );
        }).toList(),
        decoration: const InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(horizontal: 10)
            // prefixIcon: Icon(
            //   Icons.male,
            //   color: Colors.grey,
            // ),
            ),
      ),
    );
  }
}
