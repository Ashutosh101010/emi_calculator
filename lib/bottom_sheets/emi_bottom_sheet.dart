import 'package:emi_calculator/calculate_model.dart';
import 'package:emi_calculator/emi_chart.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../constants/constant.dart';

class EmiBottomSheet extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return BottomSheetState();
  }
}

class BottomSheetState extends State<EmiBottomSheet> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        PreviewWidget(),
        const SizedBox(
          height: 10,
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 15, bottom: 15),
            child: Consumer<CalculateModel>(
              builder: (context, calculateModel, child) {
                List<ChartData> chartData = [
                  ChartData(
                      'Loan Amount',
                      calculateModel.getLoanAmountPercent(),
                      Colors.deepOrange.shade600),
                  ChartData(
                      'Total Amount',
                      (100 - calculateModel.getLoanAmountPercent()),
                      Colors.lightGreenAccent.shade400),
                ];
                return ListView(shrinkWrap: true, children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Loan Amount",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white70,
                                fontWeight: FontWeight.w500,
                              )),
                          const SizedBox(
                            height: 3,
                          ),
                          Text(
                            '${Constants.currency} ${calculateModel.formatter.format(calculateModel.getLoanAmount()).toString()}',
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Tenure",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white70,
                                fontWeight: FontWeight.w500,
                              )),
                          const SizedBox(
                            height: 3,
                          ),
                          Text(
                            '${calculateModel.tenureValue.toStringAsFixed(0)} ${calculateModel.selectedTenureType}',
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Interest Rate",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white70,
                                fontWeight: FontWeight.w500,
                              )),
                          const SizedBox(
                            height: 3,
                          ),
                          Text(
                            '${calculateModel.interestRate.toString()} %',
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 24, bottom: 8),
                    child: Divider(
                      color: Colors.white70,
                      height: 10,
                      thickness: 0.4,
                    ),
                  ),
                  const Center(
                      child: Text(
                    "Breakup of total payment",
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w500),
                  )),
                  EmiChart(calculateModel,chartData),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 15, top: 30),
                    child: Divider(
                      color: Colors.white70,
                      height: 10,
                      thickness: 0.4,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Principle loan amount",
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.white54,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        "${Constants.currency} ${calculateModel.formatter.format(calculateModel.getLoanAmount()).toString()}",
                        style: const TextStyle(
                            fontSize: 14,
                            color: Colors.white54,
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Total Interest Payable",
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.white54,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        "${Constants.currency} ${calculateModel.formatter.format(calculateModel.getPayableInterest()).toString()}",
                        style: const TextStyle(
                            fontSize: 14,
                            color: Colors.white54,
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Total Amount Payable",
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        "${Constants.currency} ${calculateModel.formatter.format(calculateModel.getTotalAmount()).toString()}",
                        style: const TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 24, bottom: 8),
                    child: Divider(
                      color: Colors.white70,
                      height: 10,
                      thickness: 0.4,
                    ),
                  ),
                ]);
              },
            ),
          ),
        ),
      ],
    );
  }
}

class ChartData {
  ChartData(this.x, this.y, [this.color = Colors.white]);

  final String x;
  final double y;
  final Color color;
}

class PreviewWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Consumer<CalculateModel>(builder: (context, calculateModel, child) {
      return Padding(
        padding: const EdgeInsets.only(top: 15.0, left: 15, right: 15),
        child: Column(
          children: [
            Center(
              child: Container(
                  height: 3,
                  width: 100,
                  decoration: BoxDecoration(
                      color: Colors.white54,
                      borderRadius: BorderRadius.circular(10))),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 15, bottom: 2),
              child: Center(
                  child: Text(
                "Loan EMI",
                style: TextStyle(
                    fontSize: 14,
                    color: Colors.white70,
                    fontWeight: FontWeight.w500),
              )),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                    "${Constants.currency} ${calculateModel.formatter.format(calculateModel.getEmi()).toString()}",
                    style: const TextStyle(
                        fontSize: 28,
                        color: Colors.white,
                        fontWeight: FontWeight.w500)),
                const Padding(
                  padding: EdgeInsets.only(top: 5.0),
                  child: Text(" /month",
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.white70,
                          fontWeight: FontWeight.w500)),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(top: 24),
              child: Divider(
                color: Colors.white70,
                height: 10,
                thickness: 0.4,
              ),
            ),
          ],
        ),
      );
    });
  }
}
