class Bill {
  final String amount;
  final String date;
  final String status;

  Bill({required this.amount, required this.date, required this.status});
}

final List<Bill> sampleBills = [
  Bill(amount: '\$120', date: 'Sep 5', status: 'Due'),
  Bill(amount: '\$110', date: 'Aug 5', status: 'Paid'),
  Bill(amount: '\$50', date: 'July 5', status: 'Paid'),
];
