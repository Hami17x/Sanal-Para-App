import 'package:flutter/material.dart';

class ProjectErrorWidget extends StatelessWidget {
  final VoidCallback retry;
  const ProjectErrorWidget({super.key, required this.retry});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            "assets/something_wrong.png",
            fit: BoxFit.cover,
          ),
          Positioned(
            bottom: MediaQuery.of(context).size.height * 0.2,
            left: MediaQuery.of(context).size.width * 0.3,
            right: MediaQuery.of(context).size.width * 0.3,
            child: ElevatedButton(
              onPressed: retry,
              child: const Text(
                "Try Again",
                style: TextStyle(color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}
