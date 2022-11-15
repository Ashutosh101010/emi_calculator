import 'package:emi_calculator/bottom_sheet.dart';
import 'package:emi_calculator/calculate_model.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:syncfusion_flutter_core/theme.dart';

import 'package:provider/provider.dart';

import 'helper/draggable_bottom_sheet.dart';

class EmiCalulator extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
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
      child: DraggableBottomSheet(
        key: sheetKey,
        collapsed: true,
        barrierColor: Colors.transparent,
        barrierDismissible: true,
        minExtent: 118,
        useSafeArea: false,
        curve: Curves.easeIn,
        previewWidget: ColorWidget(child: PreviewWidget()),
        expandedWidget: ColorWidget(child: EmiBottomSheet()),
        backgroundWidget: Consumer<CalculateModel>(
          builder: (context, calculateModel, child) {
            return Scaffold(
              backgroundColor: Colors.white,
              body: Column(
                // shrinkWrap: true,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 20.0, right: 20, bottom: 10, top: 20),
                    child: Card(
                      color: Colors.grey.shade200,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text("Loan Amount",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500)),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    const Text("NPR ",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w700)),
                                    Text(
                                        calculateModel.loanValue.toInt().toString(),
                                        style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w400)),
                                    GestureDetector(onTap: (){
                                      showModalBottomSheet(backgroundColor: Colors.transparent,

                                        isDismissible: true,
                                        context: context, builder: (context) {
                                        return Container(decoration: BoxDecoration(borderRadius: BorderRadius.only(topRight: Radius.circular(20),topLeft: Radius.circular(20)),color: Colors.white),
                                          child: ListView(shrinkWrap: true,
                                            physics: const NeverScrollableScrollPhysics(),
                                            children: [
                                              const SizedBox(height: 10,),
                                            GestureDetector(onTap: (){
                                              calculateModel.selectedAmountType=calculateModel.amountType[0];
                                              Navigator.pop(context);
                                            },
                                              child: Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Text(""),
                                                    Padding(
                                                      padding: const EdgeInsets.only(left: 45),
                                                      child: Text(calculateModel.amountType[0],style: TextStyle(fontSize: 18,fontWeight: calculateModel.selectedAmountType==calculateModel.amountType[0]?FontWeight.w600:FontWeight.w400),),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                                                      child: Icon(Icons.check,color: calculateModel.selectedAmountType==calculateModel.amountType[0]?Colors.green:Colors.white,),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                            const Divider(color: Colors.grey,),
                                            GestureDetector(onTap: (){
                                                    calculateModel.selectedAmountType=calculateModel.amountType[1];
                                                    Navigator.pop(context);
                                            },
                                              child: Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Text(""),
                                                    Padding(
                                                      padding: const EdgeInsets.only(left:55.0),
                                                      child: Text(calculateModel.amountType[1],style: TextStyle(fontSize: 18,fontWeight:  calculateModel.selectedAmountType==calculateModel.amountType[1]?FontWeight.w600:FontWeight.w400)),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                                                      child: Icon(Icons.check,color: calculateModel.selectedAmountType==calculateModel.amountType[1]?Colors.green:Colors.white,),
                                                    )
                                                  ],
                                                ),
                                                
                                              ),
                                            ),
                                              const Divider(color: Colors.grey,),
                                              TextButton(style: ButtonStyle(
                                                  padding:MaterialStateProperty.all(EdgeInsets.zero)),
                                                  onPressed: (){
                                                Navigator.pop(context);
                                                  }, child: Text("Cancel",style: TextStyle(color: Colors.lightBlueAccent,fontSize: 18,fontWeight: FontWeight.w400,) ,)),
                                       SizedBox(height: 10,)
                                          ],),
                                        );

                                      },);
                                    },
                                      child:Row(
                                        children: [
                                          Text("  ${calculateModel.selectedAmountType} ",
                                              style: const TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,color: Colors.black54)),
                                          Transform.rotate(angle: 4.7,child: Icon(Icons.arrow_back_ios,size: 10,))
                                        ],
                                      ),
                                    ),

                                  ],
                                ),
                              ],
                            ),
                          ),
                          SfSliderTheme(
                            data: SfSliderThemeData(
                                thumbRadius: 11,
                                activeLabelStyle: TextStyle(
                                    fontSize: 10,
                                    color: Colors.grey.shade400,
                                    fontWeight: FontWeight.w600),
                                inactiveLabelStyle: TextStyle(
                                    fontSize: 10,
                                    color: Colors.grey.shade400,
                                    fontWeight: FontWeight.w600),
                                inactiveDividerColor: Colors.grey.shade700,
                                activeDividerColor: Colors.green),
                            child: SfSlider(
                              thumbIcon: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.white),
                                child: Padding(
                                  padding: const EdgeInsets.all(1.5),
                                  child: Image.asset("assets/icon.png"),
                                ),
                              ),
                              minorTicksPerInterval: 1,
                              stepSize: 1,
                              activeColor: Colors.pink.shade600,
                              inactiveColor: Colors.grey.shade400,
                              min: 0.0,
                              max: 100.0,
                              interval: 25,
                              showLabels: true,
                              showTicks: true,
                              value: calculateModel.loanValue,
                              onChanged: (dynamic newValue) {
                                if (newValue < 1) {
                                  return;
                                }

                                calculateModel.loanValue = num.parse(
                                        (newValue as double).toStringAsFixed(1))
                                    .toDouble();

                                // showBottomSheet((context) => EmiBottomSheet());
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 40,
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 20.0, right: 20, bottom: 10),
                    child: Card(
                      color: Colors.grey.shade200,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text("Tenure",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500)),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(calculateModel.tenureValue.toInt().toString(),
                                        style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w400)),
                                    GestureDetector(onTap: (){
                                      showModalBottomSheet(backgroundColor: Colors.transparent,

                                        isDismissible: true,
                                        context: context, builder: (context) {
                                          return Container(decoration: BoxDecoration(borderRadius: BorderRadius.only(topRight: Radius.circular(20),topLeft: Radius.circular(20)),color: Colors.white),
                                            child: ListView(shrinkWrap: true,
                                              physics: const NeverScrollableScrollPhysics(),
                                              children: [
                                                const SizedBox(height: 10,),
                                                GestureDetector(onTap: (){
                                                  calculateModel.selectedTenureType=calculateModel.tenureType[0];
                                                  Navigator.pop(context);
                                                },
                                                  child: Padding(
                                                    padding: const EdgeInsets.all(8.0),
                                                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Text(""),
                                                        Padding(
                                                          padding: const EdgeInsets.only(left: 45),
                                                          child: Text(calculateModel.tenureType[0],style: TextStyle(fontSize: 18,fontWeight: calculateModel.selectedTenureType==calculateModel.tenureType[0]?FontWeight.w600:FontWeight.w400),),
                                                        ),
                                                        Padding(
                                                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                                                          child: Icon(Icons.check,color: calculateModel.selectedTenureType==calculateModel.tenureType[0]?Colors.green:Colors.white,),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                const Divider(color: Colors.grey,),
                                                GestureDetector(onTap: (){
                                                  calculateModel.selectedTenureType=calculateModel.tenureType[1];
                                                  Navigator.pop(context);
                                                },
                                                  child: Padding(
                                                    padding: const EdgeInsets.all(8.0),
                                                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Text(""),
                                                        Padding(
                                                          padding: const EdgeInsets.only(left:55.0),
                                                          child: Text(calculateModel.tenureType[1],style: TextStyle(fontSize: 18,fontWeight:  calculateModel.selectedTenureType==calculateModel.tenureType[1]?FontWeight.w600:FontWeight.w400)),
                                                        ),
                                                        Padding(
                                                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                                                          child: Icon(Icons.check,color: calculateModel.selectedTenureType==calculateModel.tenureType[1]?Colors.green:Colors.white,),
                                                        )
                                                      ],
                                                    ),

                                                  ),
                                                ),
                                                const Divider(color: Colors.grey,),
                                                TextButton(style: ButtonStyle(
                                                    padding:MaterialStateProperty.all(EdgeInsets.zero)),
                                                    onPressed: (){
                                                      Navigator.pop(context);
                                                    }, child: Text("Cancel",style: TextStyle(color: Colors.lightBlueAccent,fontSize: 18,fontWeight: FontWeight.w400,) ,)),
                                                SizedBox(height: 10,)
                                              ],),
                                          );

                                        },);
                                    },
                                      child: Row(
                                        children: [
                                        Text("  ${calculateModel.selectedTenureType} ",
                                              style: const TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,color: Colors.black54)),
                                          Transform.rotate(angle: 4.7,child: Icon(Icons.arrow_back_ios,size: 10,color: Colors.black54,))
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SfSliderTheme(
                            data: SfSliderThemeData(
                                thumbRadius: 11,
                                activeLabelStyle: TextStyle(
                                    fontSize: 10,
                                    color: Colors.grey.shade400,
                                    fontWeight: FontWeight.w500),
                                inactiveLabelStyle: TextStyle(
                                    fontSize: 10,
                                    color: Colors.grey.shade400,
                                    fontWeight: FontWeight.w500),
                                inactiveDividerColor: Colors.grey.shade100,
                                activeDividerColor: Colors.green),
                            child: SfSlider(
                              thumbIcon: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.white),
                                child: Padding(
                                  padding: const EdgeInsets.all(1.5),
                                  child: Image.asset("assets/icon.png"),
                                ),
                              ),
                              minorTicksPerInterval: 1,
                              stepSize: 1,
                              activeColor: Colors.pink.shade600,
                              inactiveColor: Colors.grey.shade400,
                              min: 0.0,
                              max: 30.0,
                              interval: 5,
                              showLabels: true,
                              showTicks: true,
                              value: calculateModel.tenureValue,
                              onChanged: (dynamic newValue) {
                                if (newValue < 1) {
                                  return;
                                }

                                calculateModel.tenureValue =
                                    (newValue as double).truncateToDouble();
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 40,
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 20.0, right: 20, bottom: 10),
                    child: Card(
                      color: Colors.grey.shade200,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text("Interest Rate",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500)),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                        calculateModel.intrestRate
                                            .toStringAsFixed(1),
                                        style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w400)),
                                    const Text("  %",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,color: Colors.black54)),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SfSliderTheme(
                            data: SfSliderThemeData(
                                thumbRadius: 11,
                                activeLabelStyle: TextStyle(
                                    fontSize: 10,
                                    color: Colors.grey.shade400,
                                    fontWeight: FontWeight.w500),
                                inactiveLabelStyle: TextStyle(
                                    fontSize: 10,
                                    color: Colors.grey.shade400,
                                    fontWeight: FontWeight.w500),
                                inactiveDividerColor: Colors.grey.shade600,
                                activeDividerColor: Colors.green),
                            child: SfSlider(
                              thumbIcon: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.white),
                                child: Padding(
                                  padding: const EdgeInsets.all(1.5),
                                  child: Image.asset("assets/icon.png"),
                                ),
                              ),
                              minorTicksPerInterval: 1,
                              stepSize: 0.1,
                              activeColor: Colors.pink.shade600,
                              inactiveColor: Colors.grey.shade400,
                              min: 0.0,
                              max: 20,
                              interval: 5,
                              showLabels: true,
                              showTicks: true,
                              value: calculateModel.intrestRate,
                              onChanged: (dynamic newValue) {
                                if (newValue < 1) {
                                  return;
                                }

                                calculateModel.intrestRate = num.parse(
                                        (newValue as double).toStringAsFixed(1))
                                    .toDouble();
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            );
          },
        ),
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
          print(pos);
          //  sheetKey.currentState?.changeCurrentExtent(MediaQuery.of(context).size.height * 0.8);
        },
      ),
    );
  }
}
