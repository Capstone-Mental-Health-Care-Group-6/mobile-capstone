import 'package:flutter/material.dart';

class CardMethodPayment extends StatefulWidget {
  const CardMethodPayment({super.key});

  @override
  State<CardMethodPayment> createState() => _CardMethodPaymentState();
}

class _CardMethodPaymentState extends State<CardMethodPayment> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12.0),
      height: 84,
      child: Card(
        shape: RoundedRectangleBorder(
          side: const BorderSide(
            color: Colors.black,
          ),
          borderRadius: BorderRadius.circular(8.0)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Padding(
              padding: EdgeInsets.only(left:8.0),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                      "https://karirlab-prod-bucket.s3.ap-southeast-1.amazonaws.com/files/privates/O5RgLOT0Wj9jzmf8stYL8Vg4IhFBHceJgWc8YwdW.png",
                    ),
                  ),
                  SizedBox(width: 14.0,),
                  Text(
                    style:TextStyle(
                      fontWeight: FontWeight.bold
                    ),
                    "Dana"
                  ),
                ],
              ),
            ),
            Transform.scale(
              scale: 1.3,
              child: Radio(
                value: "Dana",
                groupValue: "Dana", 
                onChanged: (value){
    
                }
              ),
            )
          ],
        ),
      ),
    );
  }
}