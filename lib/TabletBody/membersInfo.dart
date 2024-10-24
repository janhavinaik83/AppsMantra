import 'package:flutter/material.dart';
import 'package:my_portfolio/Constants/globalKey.dart';
import 'package:my_portfolio/Constants/text.dart';

class MembersInfo extends StatelessWidget {
  const MembersInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      key: AboutKey,
      children: [
        const Text(
          'Members',
          style: TextStyle(fontFamily: "Poppins", fontSize: 40, fontWeight: FontWeight.w700),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.1),
        const Text(
          'Ribhu Mukherjee (CEO)',
          style: TextStyle(fontFamily: "Poppins", fontSize: 25, fontWeight: FontWeight.w700),
        ),
        const SizedBox(height: 5),
        Text(
          'SWE @ Qualcomm RnD, IIT Madras, Ex - Newton School, GeeksForGeeks',
          style: TextStyle(fontFamily: "Poppins", fontSize: 22, fontWeight: FontWeight.w300, color: Theme.of(context).primaryColor),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 20),
        const Text(
          'Susmita Sen (CTO)',
          style: TextStyle(fontFamily: "Poppins", fontSize: 25, fontWeight: FontWeight.w700),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 5),
        Text(
          'Work with 10+ start-ups and delivered almost 10+ projects',
          style: TextStyle(fontFamily: "Poppins", fontSize: 22, fontWeight: FontWeight.w300, color: Theme.of(context).primaryColor),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 20),
        const Text(
          'Other Members',
          style: TextStyle(fontFamily: "Poppins", fontSize: 25, fontWeight: FontWeight.w700),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 5),
        Text(
          d2,
          style: TextStyle(fontFamily: "Poppins", fontSize: 25, fontWeight: FontWeight.w500, color: Theme.of(context).textTheme.bodySmall?.color,),
        ),
        SizedBox(width: 5),
        Text(
          d3,
          style: TextStyle(fontFamily: "Poppins", fontSize: 22, fontWeight: FontWeight.w300, color: Theme.of(context).primaryColor),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 10),
        Text(
          d4,
          style: TextStyle(fontFamily: "Poppins", fontSize: 25, fontWeight: FontWeight.w500, color: Theme.of(context).textTheme.bodySmall?.color),
        ),
        SizedBox(width: 5),
        Text(
          d5,
          style: TextStyle(fontFamily: "Poppins", fontSize: 22, fontWeight: FontWeight.w300, color: Theme.of(context).primaryColor),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
