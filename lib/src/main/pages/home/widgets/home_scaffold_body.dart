import 'package:flutter/material.dart';

class HomeScaffoldBody extends StatelessWidget {
  const HomeScaffoldBody({
    super.key,
    required this.isDrawerOpen,
  });

  final ValueNotifier<bool> isDrawerOpen;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: isDrawerOpen,
      builder: (context, value, _) {
        print(value);
        return Stack(
          children: [
            ListView.builder(
              padding: EdgeInsets.zero,
              physics: value
                  ? const NeverScrollableScrollPhysics()
                  : const AlwaysScrollableScrollPhysics(),
              itemCount: 100,
              itemBuilder: (context, index) {
                return SizedBox(
                  height: 300,
                  child: ListTile(
                    title: Text("$index"),
                    tileColor: Colors.accents[index % 16],
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }
}
