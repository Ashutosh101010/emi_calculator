import 'package:emi_calculator/background_widget.dart';
import 'package:emi_calculator/bottom_sheets/emi_bottom_sheet.dart';
import 'package:emi_calculator/calculate_model.dart';
import 'package:flutter/material.dart';
import 'color_widget.dart';
import 'bottom_sheets/draggable_bottom_sheet.dart';
import 'package:provider/provider.dart';
class EmiCalulator extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return EmiCalculatorState();
  }
}

class EmiCalculatorState extends State<EmiCalulator> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  double currentPos = 118;
  GlobalKey<DraggableBottomSheetState> sheetKey =
      GlobalKey<DraggableBottomSheetState>();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ChangeNotifierProvider(
      create: (context) => CalculateModel(),
      child:
      DraggableBottomSheet(
        key: sheetKey,
        collapsed: true,
        barrierColor: Colors.transparent,
        barrierDismissible: true,
        minExtent: 118,
        useSafeArea: false,
        curve: Curves.easeIn,
        previewWidget: ColorWidget(child: PreviewWidget()),
        expandedWidget: ColorWidget(child: EmiBottomSheet()),
        backgroundWidget: BackgroundWidget(),
        duration: const Duration(milliseconds: 500),
        maxExtent: MediaQuery.of(context).size.height * 0.8,
        onDragging: (pos) {
          var minExtent = sheetKey.currentState!.widget.minExtent;
          var maxExtent = sheetKey.currentState!.widget.maxExtent;
          if (pos < currentPos) {
            sheetKey.currentState?.changeCurrentExtent(minExtent);
            setState(() {
              currentPos = minExtent;
            });
          } else if (pos > currentPos) {
            sheetKey.currentState?.changeCurrentExtent(maxExtent);
            setState(() {
              currentPos = maxExtent;
            });
          }
          },
      ),
    );
  }
}
