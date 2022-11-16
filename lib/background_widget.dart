import 'package:emi_calculator/bottom_sheets/loan_type_sheet.dart';
import 'package:emi_calculator/sliders.dart';
import 'package:emi_calculator/bottom_sheets/tenure_type_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'calculate_model.dart';
import 'constants/constant.dart';

class BackgroundWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return BackgroundWidgetState();
  }
}

class BackgroundWidgetState extends State<BackgroundWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CalculateModel>(
      builder: (context, calculateModel, child) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: Column(
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
                                    fontSize: 16, fontWeight: FontWeight.w500)),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                              const Text("${Constants.currency} ",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700)),
                                Text(
                                    calculateModel.loanValue.toInt().toString(),
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w400)),
                                GestureDetector(
                                  onTap: () {
                                    showModalBottomSheet(
                                      backgroundColor: Colors.transparent,
                                      isDismissible: true,
                                      context: context,
                                      builder: (context) {
                                        return LoanTypeSheet();
                                      },
                                    );
                                  },
                                  child: Row(
                                    children: [
                                      Text(
                                          "  ${calculateModel.selectedAmountType} ",
                                          style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.black54)),
                                      Transform.rotate(
                                          angle: 4.7,
                                          child: const Icon(
                                            Icons.arrow_back_ios,
                                            size: 10,
                                          ))
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                        Sliders.getLoanSlider(calculateModel),
                      const SizedBox(
                        height: 40,
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 20.0, right: 20, bottom: 10),
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
                                    fontSize: 16, fontWeight: FontWeight.w500)),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                    calculateModel.tenureValue
                                        .toInt()
                                        .toString(),
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w400)),
                                GestureDetector(
                                  onTap: () {
                                    showModalBottomSheet(
                                      backgroundColor: Colors.transparent,
                                      isDismissible: true,
                                      context: context,
                                      builder: (context) {
                                        return TenureTypeSheet();
                                      },
                                    );
                                  },
                                  child: Row(
                                    children: [
                                      Text(
                                          "  ${calculateModel.selectedTenureType} ",
                                          style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.black54)),
                                      Transform.rotate(
                                          angle: 4.7,
                                          child: const Icon(
                                            Icons.arrow_back_ios,
                                            size: 10,
                                            color: Colors.black54,
                                          ))
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Sliders.getTenureSlider(calculateModel),
                      const SizedBox(
                        height: 40,
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 20.0, right: 20, bottom: 10),
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
                                    fontSize: 16, fontWeight: FontWeight.w500)),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                    calculateModel.interestRate
                                        .toStringAsFixed(1),
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w400)),
                                const Text("  %",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black54)),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Sliders.getInterestSlider(calculateModel),
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
    );
  }


}
