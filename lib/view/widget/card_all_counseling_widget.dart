import 'package:empathi_care/view_model/card_counseling_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CardAllWidgetInstant extends StatelessWidget {
  const CardAllWidgetInstant({super.key});

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<CardCounselingViewModel>(context, listen: false);
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        itemCount: prov.data.length,
        itemBuilder: (context, index) {
          final data1 = prov.data[index];
          return Card(
            child: ListTile(
              leading: Container(
                width: 60.0,
                // height: 260.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: Stack(
                  textDirection: TextDirection.rtl,
                  children: [
                    Center(
                      child: SizedBox(
                        width: 60.0,
                        height: 60.0,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30.0),
                          child: Image.asset(
                            data1.image,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(1.0),
                      padding: EdgeInsets.all(2.0),
                      height: 15.0,
                      width: 15.0,
                      decoration: BoxDecoration(
                        // color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.green,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              title: Text(data1.doctorName),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(data1.specialist),
                  Text(data1.method),
                  Text(data1.topic),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
