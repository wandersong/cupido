import '/flutter_flow/flutter_flow_util.dart';
import 'home_page_swipe_widget.dart' show HomePageSwipeWidget;
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';

class HomePageSwipeModel extends FlutterFlowModel<HomePageSwipeWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for SwipeableStack widget.
  late CardSwiperController swipeableStackController;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    swipeableStackController = CardSwiperController();
  }

  @override
  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
