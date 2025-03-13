import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 16),
            const Text(
              'Account Balance',
              style: TextStyle(color: Colors.grey, fontSize: 16),
            ),
            const Text(
              '\$9400',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 36),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                BalanceCard(
                  color: Colors.green,
                  label: 'Income',
                  amount: '\$5000',
                  icon: Icons.arrow_upward,
                ),
                BalanceCard(
                  color: Colors.red,
                  label: 'Expenses',
                  amount: '\$1200',
                  icon: Icons.arrow_downward,
                ),
              ],
            ),
            const SizedBox(height: 16),
            TransactionFilter(),
            const SizedBox(height: 16),
            RecentTransactions(),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}

class BalanceCard extends StatelessWidget {
  final Color color;
  final String label;
  final String amount;
  final IconData icon;

  const BalanceCard({
    super.key,
    required this.color,
    required this.label,
    required this.amount,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.2),
        borderRadius: BorderRadius.circular(16),
      ),
      width: MediaQuery.of(context).size.width * 0.4,
      child: Column(
        children: [
          Icon(icon, color: color, size: 32),
          const SizedBox(height: 8),
          Text(label, style: const TextStyle(color: Colors.grey)),
          const SizedBox(height: 4),
          Text(amount, style: TextStyle(color: color, fontSize: 20)),
        ],
      ),
    );
  }
}

class TransactionFilter extends StatelessWidget {
  const TransactionFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        FilterChip(label: 'Today', isSelected: true, onTap: () {}),
        FilterChip(label: 'Week', isSelected: false, onTap: () {}),
        FilterChip(label: 'Month', isSelected: false, onTap: () {}),
        FilterChip(label: 'Year', isSelected: false, onTap: () {}),
      ],
    );
  }
}

class FilterChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const FilterChip({
    super.key,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? Colors.yellow : Colors.grey.shade200,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          label,
          style: TextStyle(color: isSelected ? Colors.black : Colors.grey),
        ),
      ),
    );
  }
}

class RecentTransactions extends StatelessWidget {
  const RecentTransactions({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Recent Transactions',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            TextButton(
              onPressed: () {},
              child: const Text(
                'See All',
                style: TextStyle(color: Colors.purple),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        const TransactionItem(
          icon: Icons.shopping_bag,
          label: 'Shopping',
          description: 'Buy some grocery',
          amount: '-\$120',
          time: '10:00 AM',
        ),
        const TransactionItem(
          icon: Icons.subscriptions,
          label: 'Subscription',
          description: 'Disney+ Annual..',
          amount: '-\$80',
          time: '03:30 PM',
        ),
        const TransactionItem(
          icon: Icons.fastfood,
          label: 'Food',
          description: 'Buy a ramen',
          amount: '-\$32',
          time: '07:30 PM',
        ),
      ],
    );
  }
}

class TransactionItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String description;
  final String amount;
  final String time;

  const TransactionItem({
    super.key,
    required this.icon,
    required this.label,
    required this.description,
    required this.amount,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.grey.shade200,
        child: Icon(icon, color: Colors.purple),
      ),
      title: Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text('$description • $time'),
      trailing: Text(
        amount,
        style: TextStyle(
          color: amount.startsWith('-') ? Colors.red : Colors.green,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
