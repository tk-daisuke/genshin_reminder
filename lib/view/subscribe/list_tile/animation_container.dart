import 'package:flutter/material.dart';
import 'package:genshin_reminder/view/subscribe/subscribe_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AnimationContainer extends ConsumerStatefulWidget {
  const AnimationContainer({
    Key? key,
    // required this.payload,
    // required this.notificationID,
    // required this.weekID,
    required this.child,
    // required this.hour,
    // required this.minutes,
  }) : super(key: key);
  // final int notificationID;
  // final int weekID;
  // final int hour;
  // final int minutes;
  // final String payload;
  final Widget child;

  @override
  _AnimationContainerState createState() => _AnimationContainerState();
}

class _AnimationContainerState extends ConsumerState<AnimationContainer>
    with TickerProviderStateMixin {
  // final animatedListKey = GlobalKey<AnimatedListState>();
  late final _controller = AnimationController(
    duration: const Duration(
      seconds: 2,
    ),
    vsync: this,
  );
  // ..repeat();
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeOutQuart,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(currentPayload);
    _controller
      ..reset()
      ..forward();
    return FadeTransition(
        opacity: _animation,
        child: SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0, -0.1),
            end: Offset.zero,
          ).animate(_animation),
          child: widget.child,
        ));
  }
}
