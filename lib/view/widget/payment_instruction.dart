import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PaymentInstruction extends StatefulWidget {
  const PaymentInstruction(
      {super.key,
      required this.title,
      required this.instruction,
      required this.isExpanded});

  final String title;
  final String instruction;
  final bool isExpanded;

  @override
  State<PaymentInstruction> createState() => _PaymentInstructionState();
}

class _PaymentInstructionState extends State<PaymentInstruction> {
  late bool isExpanded;

  @override
  void initState() {
    super.initState();
    isExpanded = widget.isExpanded;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            setState(() {
              isExpanded = !isExpanded;
            });
          },
          child: Container(
            decoration: const BoxDecoration(
                color: Color(0xFFDCDCDC),
                borderRadius: BorderRadius.all(Radius.circular(5))),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.title,
                    style: GoogleFonts.montserrat(fontWeight: FontWeight.w500),
                  ),
                  isExpanded
                      ? const Icon(Icons.keyboard_arrow_down)
                      : const Icon(Icons.keyboard_arrow_up)
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        isExpanded
            ? Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xFF001B33)),
                    borderRadius: const BorderRadius.all(Radius.circular(5))),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                  child: Text(widget.instruction,
                      style: GoogleFonts.montserrat(fontSize: 12, height: 1.5)),
                ),
              )
            : const SizedBox(),
        isExpanded ? const SizedBox(height: 10) : const SizedBox(),
      ],
    );
  }
}
