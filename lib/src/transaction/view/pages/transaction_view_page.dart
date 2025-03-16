import 'package:flutter/material.dart';

class TransactionDetailPage extends StatelessWidget {
  const TransactionDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: const Text("Expense", style: TextStyle(color: Colors.white)),
            centerTitle: true,

            collapsedHeight: 250,
            expandedHeight: 250,
            flexibleSpace: Stack(
              clipBehavior: Clip.none,
              children: [
                _buildAppBarBackground(context),
                _buildTransactionCard(context),
              ],
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              const SizedBox(height: 80),
              _buildSectionTitle("Description"),
              const SizedBox(height: 10),
              _buildSectionTitle(
                "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit. Exercitation veniam consequat sunt nostrud amet.",
              ),
              const SizedBox(height: 10),
              _buildSectionTitle("Attachment"),
              const SizedBox(height: 10),
              _buildAttachmentImages([
                "https://docs.flutter.dev/assets/images/dash/Dashatars.png",
                "https://docs.flutter.dev/assets/images/dash/Dashatars.png",
                "https://docs.flutter.dev/assets/images/dash/Dashatars.png",
              ]),
              const SizedBox(height: 30),
              _buildEditButton(),
            ]),
          ),
        ],
      ),
    );
  }

  // AppBar background with curve and transaction info
  Widget _buildAppBarBackground(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.pink,
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(30),
          bottomLeft: Radius.circular(30),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [_buildTransactionInfo()],
      ),
    );
  }

  // Transaction info like amount, date, etc.
  Widget _buildTransactionInfo() {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          SizedBox(height: 10),
          Text(
            "\$5000",
            style: TextStyle(
              fontSize: 42,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 5),
          Text(
            "Salary for July",
            style: TextStyle(fontSize: 18, color: Colors.white70),
          ),
          SizedBox(height: 5),
          Text(
            "Saturday 4 June 2021 16:20",
            style: TextStyle(fontSize: 14, color: Colors.white54),
          ),
        ],
      ),
    );
  }

  // Transaction type, category, wallet info card
  Positioned _buildTransactionCard(BuildContext context) {
    return Positioned(
      bottom: -50,
      left: 20,
      right: 20,
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildTransactionInfoItem("Type", "Income"),
            _buildTransactionInfoItem("Category", "Salary"),
            _buildTransactionInfoItem("Wallet", "Chase"),
          ],
        ),
      ),
    );
  }

  // A reusable widget to show transaction info like type, category, wallet
  Widget _buildTransactionInfoItem(String title, String value) {
    return Column(
      children: [
        Text(title, style: const TextStyle(fontSize: 14, color: Colors.grey)),
        const SizedBox(height: 5),
        Text(
          value,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  // Attachment section
  // Updated to handle multiple images
  Widget _buildAttachmentImages(List<String> imageUrls) {
    return SizedBox(
      height: 150, // Height for the images
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: imageUrls.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                imageUrls[index],
                height: 150,
                width: 200, // Set the desired width for each image
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }

  // Section title widget
  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Text(
        title,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }

  // Edit button at the bottom
  Widget _buildEditButton() {
    return ElevatedButton(
      onPressed: () {
        // Handle edit action
      },
      child: const Text(
        "Edit",
        style: TextStyle(fontSize: 16, color: Colors.white),
      ),
    );
  }
}
