import 'package:empathi_care/model/payment_method_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CardMethodPayment extends StatefulWidget {
  const CardMethodPayment(
      {super.key,
      required this.label,
      required this.groupValue,
      required this.value,
      required this.logo,
      required this.onChanged});

  final String label;
  final String logo;
  final PaymentMethodModel groupValue;
  final PaymentMethodModel value;
  final ValueChanged<PaymentMethodModel> onChanged;

  @override
  State<CardMethodPayment> createState() => _CardMethodPaymentState();
}

class _CardMethodPaymentState extends State<CardMethodPayment> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (widget.value != widget.groupValue) {
          widget.onChanged(widget.value);
        }
      },
      child: SizedBox(
        height: 84,
        child: Card(
          shape: RoundedRectangleBorder(
              side: const BorderSide(
                color: Color(0xFF959595),
              ),
              borderRadius: BorderRadius.circular(8.0)),
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/images/${widget.logo}',
                        width: 50,
                      ),
                      const SizedBox(
                        width: 14.0,
                      ),
                      Text(
                          style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.bold),
                          widget.label),
                    ],
                  ),
                ),
                Transform.scale(
                  scale: 1.3,
                  child: Radio<PaymentMethodModel>(
                    groupValue: widget.groupValue,
                    value: widget.value,
                    onChanged: (PaymentMethodModel? currentPaymentMethod) {
                      widget.onChanged(currentPaymentMethod!);
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
