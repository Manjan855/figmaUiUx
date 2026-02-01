//import 'package:flutter/gestures.dart';
import 'package:figmaproject/Write_Review.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Review extends StatefulWidget {
  const Review({super.key});

  @override
  State<Review> createState() => _ReviewState();
}

class _ReviewState extends State<Review> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: Text(
          "Reviews",
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: GestureDetector(
              onTap: () {
                Get.to(() => const WriteReview());
              },
              child: const Icon(Icons.add_circle_outlined, size: 26),
            ),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),

        children: [
          ReviewTile(
            imageUrl: "assets/haylie.png",
            name: "Haylie Aminoff",
            time: "32 minutes ago",
          ),
          ReviewTile(
            imageUrl: "assets/carla1.png",
            name: "Carla Septimus",
            time: "32 minutes ago",
          ),
          ReviewTile(
            imageUrl: "assets/carla2.png",
            name: "Carla George",
            time: "32 minutes ago",
          ),
          ReviewTile(
            imageUrl: "assets/maren.png",
            name: "Maren Kenter",
            time: "32 minutes ago",
          ),
        ],
      ),
    );
  }
}

class ReviewTile extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String time;

  const ReviewTile({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.time,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(radius: 20, backgroundImage: AssetImage(imageUrl)),

              SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                      color: Color(0xFF000000),
                    ),
                  ),
                  Text(
                    time,
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 16),
          Row(
            children: [
              Text("4.5"),
              SizedBox(width: 10),
              Icon(Icons.star, color: Colors.amber, size: 18),
              Icon(Icons.star, color: Colors.amber, size: 18),
              Icon(Icons.star, color: Colors.amber, size: 18),
              Icon(Icons.star, color: Colors.amber, size: 18),
              Icon(Icons.star_half, color: Colors.amber, size: 18),
            ],
          ),
          const SizedBox(height: 8),
          const Text(
            "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy",
            style: TextStyle(color: Colors.grey),
          ),
          Text("elitr, sed diam nonumy", style: TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }
}
