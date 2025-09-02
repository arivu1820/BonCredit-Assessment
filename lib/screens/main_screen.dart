import 'package:flutter/material.dart';
import '../models/bill.dart';
import '../widgets/bill_card.dart';

const Color kBlack = Colors.black;
const Color kWhite = Colors.white;
const Color kGrey = Color(0xFF4D4D4D);

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const double margin = 20.0;
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      // Drawer on the right
      endDrawer: Drawer(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(margin),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Company logo and name

                const SizedBox(height: 32),

                // Profile section
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 24,
                      backgroundImage:
                          AssetImage("lib/assets/Profile_Icon.png"),
                    ),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Profile Name',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: kBlack,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'ProfileName@gmail.com',
                          style: TextStyle(
                            fontSize: 10,
                            color: kGrey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                ListTile(
                  leading: const Icon(Icons.home),
                  title: const Text("Home"),
                  onTap: () => Navigator.pop(context),
                ),
              ],
            ),
          ),
        ),
      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(margin),
          child: Column(
            children: [
              // Top Row (profile avatar triggers drawer)
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        "lib/assets/Vector.png", // <-- company icon
                        height: 28,
                        width: 28,
                      ),
                    ],
                  ),
                  Expanded(
                    child: Container(),
                  ),
                  Builder(
                    builder: (context) => GestureDetector(
                      onTap: () => Scaffold.of(context).openEndDrawer(),
                      child: const CircleAvatar(
                        backgroundImage:
                            AssetImage("lib/assets/Profile_Icon.png"),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 18),

              // Reward Section
              Expanded(
                flex: 5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'You\'ve\nunlocked a \$10\nreward!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 32,
                        fontStyle: FontStyle.italic,
                        color: kBlack,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: 18),
                    SizedBox(
                      width: 150,
                      height: 34,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: kBlack,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text(
                          "Chosen Brand",
                          style: TextStyle(
                            fontSize: 14,
                            color: kWhite,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),

              // Bill List
              Expanded(
                flex: 5,
                child: ListView.builder(
                  itemCount: sampleBills.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 20.0),
                      child: BillCard(
                        bill: sampleBills[index],
                        width: size.width - (margin * 2),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
