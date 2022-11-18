import 'package:flutter/material.dart';
import 'package:geniopay/constant/colors.dart';

class AddCountry extends StatelessWidget {
  final VoidCallback onAddTap;

  const AddCountry({required this.onAddTap, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final addContainer = InkWell(
      onTap: onAddTap,
      child:Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: genioContainerColor[50],
      ),
      child: const Icon(
        Icons.add,
        color: Colors.black,
      ),
    ),);

    return Center(
      child: Column(
        children: [
          addContainer,
          const SizedBox(height: 10,),
          Text(
            'Add another country',
            style: TextStyle(
              color: textColor[150],
              fontWeight: FontWeight.w300,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 20,),
        ],
      ),
    );
  }
}
