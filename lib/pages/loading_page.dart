import 'package:flutter/material.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _textSizeAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    _textSizeAnimation = Tween<double>(
      begin: 20,
      end: 25,
    ).animate(
        CurvedAnimation(parent: _animationController, curve: Curves.easeInOut));

    _animationController.repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Center(
        child: AnimatedBuilder(
          animation: _animationController,
          builder: (context, child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const RefreshProgressIndicator(),
                const SizedBox(height: 10),
                Text(
                  'Carregando',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: _textSizeAnimation.value,
                    letterSpacing: 2,
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
