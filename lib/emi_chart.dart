import 'package:emi_calculator/bottom_sheets/emi_bottom_sheet.dart';
import 'package:emi_calculator/calculate_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
class EmiChart extends StatelessWidget{

  final CalculateModel calculateModel;
  final List<ChartData> chartData;


  const EmiChart(this.calculateModel,this.chartData);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
  return SfCircularChart(
    borderWidth: 0,
    tooltipBehavior:
    TooltipBehavior(enable: false, format: 'point.y %'),
    legend: Legend(
        legendItemBuilder:
            (legendText, series, point, seriesIndex) {
          return Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 10,
                width: 10,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: point.color),
                margin: const EdgeInsets.only(left: 50, right: 5),
              ),
              Text(
                legendText,
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 14),
              )
            ],
          );
        },
        isVisible: true,
        alignment: ChartAlignment.center,
        position: LegendPosition.bottom,
        orientation: LegendItemOrientation.horizontal,
        borderWidth: 0,
        height: '0',
        padding: 0),
    series: [
      DoughnutSeries(
          enableTooltip: false,
          radius: '100',
          innerRadius: '72',
          pointColorMapper: (data, index) => data.color,
          dataLabelSettings: DataLabelSettings(
              builder: (data, point, series, pointIndex,
                  seriesIndex) {
                return Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.grey.shade600),
                    child: Text(
                      '${calculateModel.formatter.format(data.y)} %',
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500),
                    ));
              },
              color: Colors.blueGrey,
              labelAlignment: ChartDataLabelAlignment.top,
              labelIntersectAction: LabelIntersectAction.shift,
              labelPosition: ChartDataLabelPosition.outside,
              isVisible: true,
              textStyle: const TextStyle(color: Colors.white)),
          xValueMapper: (data, index) => data.x,
          yValueMapper: (data, index) => data.y,
          dataSource: chartData)
    ],
  );
  }

}