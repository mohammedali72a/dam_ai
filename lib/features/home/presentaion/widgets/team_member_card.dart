import 'package:flutter/material.dart';

class TeamMemberCard extends StatelessWidget {
  final String name;
  final String email;
  final String image;
  final String membership;
  const TeamMemberCard({
    super.key,
    required this.name,
    required this.email,
    this.membership = "Team Member",
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          child: Card(
            // color: Color.fromARGB(255, 155, 136, 118),
            elevation: 3,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(30),
                bottom: Radius.circular(10),
              ),
            ),
            margin: const EdgeInsets.only(top: 60),
            child: SizedBox(
              child: Padding(
                padding: const EdgeInsets.all(20).copyWith(
                  top: 60,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      membership,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Color.fromARGB(255, 221, 90, 4),
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      name,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      email,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Color.fromARGB(255, 169, 134, 9),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: FittedBox(
            child: Container(
              alignment: Alignment.bottomRight,
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 5),
                shape: BoxShape.circle,
                color: Colors.white,
                image: DecorationImage(
                  image: AssetImage(image),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
