import 'package:flutter/material.dart';
import 'package:geniopay/constant/colors.dart';
import 'button_forward.dart';

class ReceiverCard extends StatelessWidget {
  final String srcImage;
  final String name;
  final String contact;
  const ReceiverCard({required this.srcImage, required this.name,
    required this.contact, super.key});

  @override
  Widget build(BuildContext context) {
    final image =  CircleAvatar(
      radius: 20.0,
      backgroundColor: Colors.transparent,
      child: CircleAvatar(
        radius: 20.0,
          backgroundColor: Colors.transparent,
        child: ClipOval(
          child: srcImage.isEmpty ?
          Image.asset('images/avatar_1.png') :
          Image.network(srcImage),
        ),
      ),
    );

    final size = MediaQuery.of(context).size;
    final receiverName = Text(
      name,
      style: const TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w600,
        fontSize: 12,
      ),
    );

    final arrowForward = ButtonForward((){});
    
    final receiverContact = Text(
      contact,
      style: const TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w300,
        fontSize: 12,
      ),
    );
    return Container(
      width: size.width,
      height: 88,
      margin: const EdgeInsets.symmetric(horizontal: 2),
      padding: const EdgeInsets.only(
          left: 20, top: 10, bottom: 10, right: 20,),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20,),
          color: Colors.white,

          boxShadow: [
            BoxShadow(
              spreadRadius: 2,
              blurRadius: 2,
              color: boxShadowColor,
            )
          ]
      ),
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          Positioned(child: image,),
          Positioned(
            left: 60,
            child: Align(
            alignment: Alignment.topLeft,
              child: Column(
                 mainAxisAlignment: MainAxisAlignment.start,
                 children: [
                  receiverName,
                const SizedBox(height: 5,
              ),
              receiverContact,
            ],
          ),
          ),
          ),
          Positioned(
            right: 10,
            child: arrowForward,
          )
        ],
      ),
    );
  }
}
