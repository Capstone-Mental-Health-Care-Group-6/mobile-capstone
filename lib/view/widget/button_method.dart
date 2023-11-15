import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';

class ButtonMethod extends StatefulWidget {
  const ButtonMethod({super.key});

  @override
  State<ButtonMethod> createState() => _ButtonMethodState();
}

class _ButtonMethodState extends State<ButtonMethod> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12.0),
      padding: const EdgeInsets.all(6.0),
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: const Color(0xFFCCE7FF),
      ),
      child: ToggleSwitch(
        minWidth: 200,
        minHeight: 50,
        cornerRadius: 8,
        fontSize: 14,
        totalSwitches: 2,
        radiusStyle: true,
        activeBgColors: const [[Color.fromARGB(255, 0, 133, 255)],[Color.fromARGB(255, 0, 133, 255)]],
        inactiveBgColor:const Color(0xFFCCE7FF),
        labels: const ["E-Wallet","Bank-Transfer"],
        inactiveFgColor: Colors.black,
        onToggle: (index){
        },
      ),
    );
  }
}