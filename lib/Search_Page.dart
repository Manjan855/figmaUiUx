import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: TextField(
          decoration: InputDecoration(
            hintText: "Search keywords..",
            prefixIcon: const Icon(Icons.search),
            filled: true,
            fillColor: Colors.grey.shade100,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            sectionTitle("Search History"),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: const [
                Chip(label: Text("Fresh Grocery")),
                Chip(label: Text("Bananas")),
                Chip(label: Text("Cheetos")),
                Chip(label: Text("Vegetables")),
                Chip(label: Text("Fruits")),
              ],
            ),
            const SizedBox(height: 24),
            sectionTitle("Discover more"),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: const [
                Chip(label: Text("Discounted items")),
                Chip(label: Text("Fresh vegetables")),
              ],
            ),
            const Spacer(),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    icon: const Icon(Icons.camera_alt),
                    label: const Text("Image Search"),
                    onPressed: () {},
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton.icon(
                    icon: const Icon(Icons.mic),
                    label: const Text("Voice Search"),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const Text("clear", style: TextStyle(color: Colors.green)),
        ],
      ),
    );
  }
}
