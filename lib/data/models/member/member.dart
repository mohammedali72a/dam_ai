import 'package:dam_ai/core/utilis/image_managers.dart';

class TeamMember {
  final String name;
  final String email;
  final String image;

  TeamMember({required this.name, required this.email, required this.image});
}

List<TeamMember> members = [
  // TeamMember(
  //   name: "Esraa Ebrahim taha Deef",
  //   email: "esraa99deif@gmail.com",
  //   image: ImagesManager.esraa,
  // ),
  TeamMember(
    name: "Aya Mouneir Khalil",
    email: "ayamouneir308@gmail.com",
    image: ImagesManager.aya,
  ),
  TeamMember(
    name: "Ahmed Mokhtar Elasmer",
    email: "mkhtarjrizmn@gmail.com",
    image: ImagesManager.ahmed,
  ),
  TeamMember(
    name: "Omnia Hesham Reda",
    email: "heshamomnia78@gmail.com",
    image: ImagesManager.omnia,
  ),
  TeamMember(
    name: "Esraa Ebrahim Arab",
    email: "esraaebrahim3010@gmail.com",
    image: ImagesManager.esraaEbrahim,
  ),
  TeamMember(
    name: "Omnia Saber Elazab",
    email: "omniaelazab80@gmail.com",
    image: ImagesManager.omniaSaber,
  ),
  TeamMember(
    name: "Ahmed Magdy Rakha",
    email: "ahmedrakha477@gmail.com",
    image: ImagesManager.ahmedMagdy,
  ),
  TeamMember(
    name: "Ibrahim Atef Al-Desouki",
    email: "dsoky5050@gmail.com",
    image: ImagesManager.ibrahimAtef,
  ),
];
