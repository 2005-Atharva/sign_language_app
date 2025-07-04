import 'package:flutter/material.dart';

class SettingOptions extends StatelessWidget {
  const SettingOptions({
    super.key,
    required this.icon,
    required this.text,
    required this.onTap,
  });

  final IconData icon;
  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          height: 60,
          width: 100,
          decoration: BoxDecoration(
            // border: Border.all(color: Colors.purple),
            borderRadius: BorderRadius.circular(16),
            image: DecorationImage(
              image: AssetImage('assets/images/Buttonw.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Row(
            children: [
              Icon(icon, size: 28),
              const SizedBox(width: 12),
              Expanded(child: Text(text, style: const TextStyle(fontSize: 18))),
              const Icon(Icons.navigate_next_rounded),
            ],
          ),
        ),
      ),
    );
  }
}
