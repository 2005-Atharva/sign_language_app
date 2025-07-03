import 'package:flutter/material.dart';
import 'package:flutter_task_sign_app/features/chat/chat_provider.dart';
import 'package:provider/provider.dart';

class KokoChatScreen extends StatelessWidget {
  const KokoChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => KokoChatProvider(),
      child: Scaffold(
        appBar: AppBar(title: const Text('Koko Quiz Chat 🐨')),
        body: Consumer<KokoChatProvider>(
          builder: (context, provider, _) {
            final step = provider.current;
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.all(12),
                    itemCount: provider.chat.length,
                    itemBuilder: (_, index) {
                      final msg = provider.chat[index];
                      final isUser = msg["role"] == "user";
                      return Align(
                        alignment: isUser
                            ? Alignment.centerRight
                            : Alignment.centerLeft,
                        child: Container(
                          margin: const EdgeInsets.symmetric(vertical: 4),
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: isUser
                                ? Colors.purple[100]
                                : Colors.grey[300],
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(msg["text"] ?? ""),
                        ),
                      );
                    },
                  ),
                ),
                if (provider.hasNext)
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      children: [
                        Text(
                          step!.question,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 10),
                        ...List.generate(2, (i) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4),
                            child: ElevatedButton(
                              onPressed: () => context
                                  .read<KokoChatProvider>()
                                  .handleUserChoice(i),
                              child: Text(step.options[i]),
                            ),
                          );
                        }),
                      ],
                    ),
                  )
                else
                  const Padding(
                    padding: EdgeInsets.all(16),
                    child: Text(
                      "🎉 You completed the chat! Great job!",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}
