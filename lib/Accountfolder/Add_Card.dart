import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AddCard extends StatefulWidget {
  const AddCard({super.key});

  @override
  State<AddCard> createState() => _AddCardState();
}

class _AddCardState extends State<AddCard> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back)),
          Expanded(
            child: Center(
              child: Text(
                "Add Card",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
              ),
            ),
          ),
          SizedBox(height: 23),
          Padding(
            padding: const EdgeInsets.only(left: 17, right: 17),
            child: Container(child: Image.asset("assets/cards.png")),
          ),
          SizedBox(height: 23),
          TextField(
            decoration: InputDecoration(
              prefixIcon: Padding(
                padding: const EdgeInsets.all(12.0),
                child: SvgPicture.asset(
                  "assets/user.svg",
                  height: 25,
                  width: 25,
                ),
              ),
              labelText: "Name of the card",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ),
          SizedBox(height: 5,),
            TextField(
            decoration: InputDecoration(
              prefixIcon: Padding(
                padding: const EdgeInsets.all(12.0),
                child: SvgPicture.asset(
                  "assets/user.svg",
                  height: 25,
                  width: 25,
                ),
              ),
              labelText: "Name of the card",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ),
           SizedBox(height: 5),
          Row(
            children: [
              TextField(
                decoration: InputDecoration(
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: SvgPicture.asset(
                      "assets/user.svg",
                      height: 25,
                      width: 25,
                    ),
                  ),
                  labelText: "Name of the card",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
               SizedBox(width: 5),
              TextField(
                decoration: InputDecoration(
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: SvgPicture.asset(
                      "assets/user.svg",
                      height: 25,
                      width: 25,
                    ),
                  ),
                  labelText: "Name of the card",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
            ],
          ),
              Padding(
            padding: const EdgeInsets.only(left: 17, right: 17, bottom: 36),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                backgroundColor: Color(0xFF6CC51D),
                shadowColor: Color(0xFFAEDC81),
                minimumSize: Size(double.infinity, 60),
                foregroundColor: Colors.white,
              ),
              onPressed: () {},
              child: Text(
                "Add address",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
