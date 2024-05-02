import 'package:dam_ai/core/utilis/image_managers.dart';
import 'package:dam_ai/data/models/member/member.dart';
import 'package:dam_ai/features/home/presentaion/widgets/team_member_card.dart';
import 'package:flutter/material.dart';

class TeamMembersScreen extends StatelessWidget {
  const TeamMembersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("أعضاء الفريق"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const TeamMemberCard(
              email: "esraa99deif@gmail.com",
              name: "Esraa Ebrahim taha Deef",
              image: ImagesManager.esraa,
              membership: "Team Leader",
            ),
            const SizedBox(
              height: 10,
            ),
            GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 5,
                mainAxisSpacing: 10,
                mainAxisExtent: 280,
              ),
              padding: const EdgeInsets.all(10),
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: members.length,
              itemBuilder: (context, index) {
                return TeamMemberCard(
                  name: members[index].name,
                  email: members[index].email,
                  image: members[index].image,
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
