import 'package:flutter/material.dart';

class ApplyFiltersPage extends StatelessWidget {
  const ApplyFiltersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F8FA),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {},
        ),
        title: const Text(
          "Apply Filters",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// PRICE RANGE
                  const Text(
                    "Price Range",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(child: _priceField("Min.")),
                      const SizedBox(width: 12),
                      Expanded(child: _priceField("Max.")),
                    ],
                  ),

                  const SizedBox(height: 24),

                  /// STAR RATING
                  const Text(
                    "Star Rating",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
                  ),
                  const SizedBox(height: 12),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 14,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        ...List.generate(
                          4,
                          (index) => const Icon(
                            Icons.star,
                            color: Colors.amber,
                            size: 20,
                          ),
                        ),
                        const Icon(
                          Icons.star_border,
                          color: Colors.grey,
                          size: 20,
                        ),
                        const Spacer(),
                        const Text(
                          "4 stars",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 24),

                  /// OTHERS
                  const Text(
                    "Others",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
                  ),
                  const SizedBox(height: 12),
                  _optionTile(
                    icon: Icons.local_offer_outlined,
                    title: "Discount",
                    checked: false,
                  ),
                  _optionTile(
                    icon: Icons.local_shipping_outlined,
                    title: "Free shipping",
                    checked: true,
                  ),
                  _optionTile(
                    icon: Icons.inventory_2_outlined,
                    title: "Same day delivery",
                    checked: true,
                  ),
                ],
              ),
            ),
          ),

          /// APPLY BUTTON
          Padding(
            padding: const EdgeInsets.all(16),
            child: SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF8CD248),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {},
                child: const Text(
                  "Apply filter",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// PRICE INPUT
  static Widget _priceField(String hint) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextField(
        keyboardType: TextInputType.number,
        decoration: InputDecoration(hintText: hint, border: InputBorder.none),
      ),
    );
  }

  /// OPTION TILE
  static Widget _optionTile({
    required IconData icon,
    required String title,
    required bool checked,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.grey),
          const SizedBox(width: 12),
          Text(title),
          const Spacer(),
          Icon(
            checked ? Icons.check_circle : Icons.radio_button_unchecked,
            color: checked ? Colors.green : Colors.grey,
          ),
        ],
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:get/get.dart';

// class ApplyFilters extends StatefulWidget {
//   const ApplyFilters({super.key});

//   @override
//   State<ApplyFilters> createState() => _ApplyFiltersState();
// }

// class _ApplyFiltersState extends State<ApplyFilters> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 0,
//         title: Text("Apply Filters"),
//         centerTitle: true,
//         leading: IconButton(
//           onPressed: () {
//             Get.back();
//           },
//           icon: Icon(Icons.arrow_back),
//         ),
//         actions: [
//           IconButton(
//             onPressed: () {},
//             icon: Icon(Icons.refresh, color: Colors.black),
//           ),
//         ],
//       ),

//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             "Price Range",
//             style: TextStyle(
//               fontWeight: FontWeight.w600,
//               fontSize: 15,
//               color: Color(0xFF000000),
//             ),
//           ),
//           SizedBox(height: 15),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               Expanded(
//                 child: TextField(
//                   decoration: InputDecoration(
//                     labelText: "Min.",
//                     labelStyle: TextStyle(
//                       fontWeight: FontWeight.w500,
//                       fontSize: 12,
//                       color: Color(0xFF868889),
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(width: 7),
//               Expanded(
//                 child: TextField(
//                   decoration: InputDecoration(
//                     labelText: "Min.",
//                     labelStyle: TextStyle(
//                       fontWeight: FontWeight.w500,
//                       fontSize: 12,
//                       color: Color(0xFF868889),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           SizedBox(height: 43),
//           Text(
//             "Star Rating",
//             style: TextStyle(
//               fontWeight: FontWeight.w600,
//               fontSize: 15,
//               color: Color(0xFF000000),
//             ),
//           ),
//           SizedBox(height: 15),
//           Padding(
//             padding: const EdgeInsets.only(left: 17, right: 17),

//             child: Row(
//               children: [
//                 Icon(Icons.star, color: Colors.amber),
//                 Icon(Icons.star, color: Colors.amber),
//                 Icon(Icons.star, color: Colors.amber),
//                 Icon(Icons.star, color: Colors.amber),
//                 Icon(Icons.star, color: Colors.white),
//                 Spacer(),
//                 Text("4stars"),
//               ],
//             ),
//           ),
//           SizedBox(height: 28),
//           Text(
//             "Others",
//             style: TextStyle(
//               fontWeight: FontWeight.bold,
//               fontSize: 18,
//               color: Color(0xFF000000),
//             ),
//           ),
//           Column(
//             children: [
//               Row(
//                 children: [
//                   SvgPicture.asset("assets/discount.svg"),
//                   SizedBox(width: 15),
//                   Text(
//                     "Discount",
//                     style: TextStyle(
//                       color: Color(0xff898889),
//                       fontWeight: FontWeight.w500,
//                       fontSize: 15,
//                     ),
//                   ),
//                   Spacer(),
//                   Icon(Icons.check_circle_outline),
//                 ],
//               ),
//               Row(
//                 children: [
//                   SvgPicture.asset("assets/orderdel.svg"),
//                   SizedBox(width: 15),
//                   Text(
//                     "Free shipping",
//                     style: TextStyle(
//                       color: Color(0xff898889),
//                       fontWeight: FontWeight.w500,
//                       fontSize: 15,
//                     ),
//                   ),
//                   Spacer(),
//                   Icon(Icons.check_circle_outline),
//                 ],
//               ),
//               Row(
//                 children: [
//                   SvgPicture.asset("assets/sameday.svg"),
//                   SizedBox(width: 15),
//                   Text(
//                     "Same day delivery",
//                     style: TextStyle(
//                       color: Color(0xff898889),
//                       fontWeight: FontWeight.w500,
//                       fontSize: 15,
//                     ),
//                   ),
//                   Spacer(),
//                   Icon(Icons.check_circle_outline),
//                 ],
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
