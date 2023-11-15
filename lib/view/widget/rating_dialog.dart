import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class RatingDialog extends StatefulWidget {
  const RatingDialog({super.key});

  @override
  State<RatingDialog> createState() => _RatingDialogState();
}

class _RatingDialogState extends State<RatingDialog> {
  double _iconRating = 0;
  
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0)
      ),
      content: SizedBox(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 12),
              child: Text(
                textAlign: TextAlign.center,
                "Bagaimana dengan Psikolog ?",
                style: TextStyle(
                  fontSize: 16
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top:5.0),
              child: Text(
                textAlign: TextAlign.center,
                "(1 adalah mengecewakan, 5 adalah terbaik)",
                style: TextStyle(
                  fontSize: 14
                ),
              ),
            ),
        
            Padding(
              padding:  const EdgeInsets.all(12),
              child:GFRating(
                spacing:20,
                borderColor: const Color.fromARGB(255, 255, 229, 0),
                filledIcon: const Icon(
                  Icons.star,
                  color: Color.fromARGB(255, 255, 229, 0),
                ),
                allowHalfRating: true,
                size: GFSize.SMALL,
                value: _iconRating,
                onChanged: (value) {
                  setState(() {
                    _iconRating = value;
                  });
                },
              ),
            ),
        
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Opsional",
                  ),
                ),
                const SizedBox(height: 10,),
                TextFormField(
                  // controller: namaController,
                  keyboardType: TextInputType.text,
                  // validator: (String? value){},
                  maxLines: 4,
                  decoration: InputDecoration(
                    hintText: "Silahkan tulis komentar anda",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)
                    )
                  ),
                ),
              ],
            ),
            
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Align(
                alignment: Alignment.bottomRight,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)
                    ),
                    backgroundColor: const Color.fromARGB(255, 0, 133, 255)
                  ),
                  onPressed: Navigator.of(context).pop, 
                  child: const Text(
                    "Kirim",
                    style: TextStyle(
                      color: Colors.white
                    ),
                  )
                ),
              ),
            )
          ],
        ),
      )
    );
  }
}