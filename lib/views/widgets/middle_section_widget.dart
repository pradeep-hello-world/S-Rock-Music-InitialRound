import 'package:flutter/material.dart';

class MiddleSectionWidget extends StatelessWidget {
  const MiddleSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
          colors: [Color(0xFF9D003B), Color(0xFF59003E)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 20,
            left: -40,
            child: Image.asset(
              'assets/images/left_image.png',
              height: 150,
              width: 100,
              fit: BoxFit.contain,
            ),
          ),

          Positioned(
            top: 0,
            right: -40,
            child: Image.asset(
              'assets/images/right_image.png',
              height: 150,
              width: 100,
              fit: BoxFit.contain,
            ),
          ),

          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text('Claim your', style: TextStyle(color: Colors.white70)),
              const Text(
                'Free Demo',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
              const Text('for custom Music Production',
                  style: TextStyle(color: Colors.white70)),
              const SizedBox(height: 12),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                ),
                child: const Text('Book Now'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
