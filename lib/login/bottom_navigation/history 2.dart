import 'package:flutter/material.dart';


class HistoryScreen extends StatelessWidget {
  final List<Map<String, dynamic>> historyData = [
    {
      'month': 'November',
      'date': '06/11/2024',
      'time': '03.43 PM',
      'transactionId': '2589654123',
      'status': 'Paid',
    },
    {
      'month': 'October',
      'date': '06/10/2024',
      'time': '01.13 PM',
      'transactionId': '2589652132',
      'status': 'Paid',
    },
    {
      'month': 'October',
      'date': '06/10/2024',
      'time': '01.10 PM',
      'transactionId': '2589652130',
      'status': 'Failed',
    },
    {
      'month': 'September',
      'date': '03/09/2024',
      'time': '02.56 PM',
      'transactionId': '2589652132',
      'status': 'Paid',
    },
  ];

  HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('History', style: TextStyle(color: Colors.white)),
        actions: [
          IconButton(
            icon: const Icon(Icons.whatshot, color: Colors.green),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.grey[900],
            ),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    alignment: Alignment.center,
                    child: const Text("Chit History", style: TextStyle(color: Colors.white)),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    alignment: Alignment.center,
                    child: const Text("Payment History", style: TextStyle(color: Colors.black)),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: historyData.length,
              itemBuilder: (context, index) {
                final item = historyData[index];
                return Card(
                  color: Colors.black,
                  margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: ListTile(
                    leading: const Icon(Icons.receipt_long_outlined, color: Colors.white),
                    title: Text(
                      "${item['month']} Month Chit Amount",
                      style: const TextStyle(color: Colors.amber),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Transaction ID : ${item['transactionId']}", style: const TextStyle(color: Colors.white)),
                        Text(item['date'], style: const TextStyle(color: Colors.white70)),
                      ],
                    ),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(item['time'], style: const TextStyle(color: Colors.white)),
                        Container(
                          margin: const EdgeInsets.only(top: 5),
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                          decoration: BoxDecoration(
                            color: item['status'] == 'Paid' ? Colors.green : Colors.red,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Text(
                            item['status'],
                            style: const TextStyle(color: Colors.white, fontSize: 12),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.amber,
        unselectedItemColor: Colors.white,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.assignment), label: 'My Chits'),
          BottomNavigationBarItem(icon: Icon(Icons.gavel), label: 'Live Auction'),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: 'History'),
        ],
        currentIndex: 3,
        onTap: (index) {},
      ),
    );
  }
}