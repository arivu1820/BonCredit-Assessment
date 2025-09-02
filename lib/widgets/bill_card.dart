import 'package:flutter/material.dart';
import '../models/bill.dart';

const Color kBlack = Colors.black;
const Color kWhite = Colors.white;
const Color kGrey = Color(0xFF4D4D4D);

class BillCard extends StatelessWidget {
  final Bill bill;
  final double width;

  const BillCard({super.key, required this.bill, required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        color: kWhite,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.12),
            blurRadius: 10,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Row(
          children: [
            // Amount + Date
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    bill.amount,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: kBlack,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    bill.date,
                    style: const TextStyle(
                      fontSize: 12,
                      color: kGrey,
                    ),
                  ),
                ],
              ),
            ),
            // Divider
            Container(
              width: 1,
              height: 40,
              color: Colors.grey.withOpacity(0.15),
            ),
            const SizedBox(width: 12),
            // Status
            Text(
              bill.status,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: kGrey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
