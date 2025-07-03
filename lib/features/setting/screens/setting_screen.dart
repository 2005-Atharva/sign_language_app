import 'package:flutter/material.dart';
import 'package:flutter_task_sign_app/core/constants/assets.dart';
import 'package:flutter_task_sign_app/features/setting/screens/widget_options.dart';
import 'package:lottie/lottie.dart';
import 'package:share_plus/share_plus.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: ListView(
        children: [
          // Personal Info tile
          SettingOptions(
            icon: Icons.person_rounded,
            text: 'Personal Info',
            onTap: () {
              showModalBottomSheet(
                context: context,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                ),
                builder: (ctx) {
                  return Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Personal Info', style: TextStyle(fontSize: 18)),
                        const SizedBox(height: 12),
                        Text(
                          'Name: Random User',
                          style: TextStyle(fontSize: 16),
                        ),
                        Text('Level: New', style: TextStyle(fontSize: 16)),
                        Text('Points: 120', style: TextStyle(fontSize: 16)),
                        const SizedBox(height: 24),
                        Center(
                          child: ElevatedButton(
                            onPressed: () => Navigator.pop(ctx),
                            child: const Text('Close'),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          ),

          // About tile
          SettingOptions(
            icon: Icons.info_outline,
            text: 'About',
            onTap: () {
              showModalBottomSheet(
                context: context,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                ),
                builder: (ctx) {
                  return Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('About This App', style: TextStyle(fontSize: 18)),
                        const SizedBox(height: 12),
                        Text(
                          'Sign Language Learning App\n'
                          'Version: 1.0.0\n\n'
                          'This app helps you learn basic sign language '
                          'through interactive quizzes and fun animations '
                          'with our mascot Koko the Koala.',
                          style: TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 24),
                        Center(
                          child: ElevatedButton(
                            onPressed: () => Navigator.pop(ctx),
                            child: const Text('Close'),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          ),

          SettingOptions(
            icon: Icons.share,
            text: 'Invite Friends',
            onTap: () async {
              await Share.share(
                '🐨 Learn sign language with Koko! \nDownload now:\nhttps://github.com/2005-Atharva/sign_language_app',
              );
            },
          ),

          Lottie.asset(Assets.lottieIntro, height: 300, width: 300),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Did you Liked it?', style: TextStyle(fontSize: 20)),
            ],
          ),
        ],
      ),
    );
  }
}
