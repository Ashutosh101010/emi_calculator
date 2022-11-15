import 'package:emi_calculator/calculate_model.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:provider/provider.dart';


class EmiBottomSheet extends StatefulWidget{


  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return BottomSheetState();
  }

}

class BottomSheetState extends State<EmiBottomSheet>
{
  //
  // var loanAmount=1000;
  // var tenure=10;
  // var interestRate=1;
  //
  // var principleAmount=1000;
  // var interest=1000;
  // var totalAmount=10000000;




  @override
  Widget build(BuildContext context) {
    // TODO: implement build
  return Column(
    children: [
      
      PreviewWidget(),
      const SizedBox(height: 10,),
      Expanded(flex: 1,
        child: Padding(
          padding: const EdgeInsets.only(left: 15.0,right: 15, bottom: 15),
          child:
          Consumer<CalculateModel>(builder: (context, calculateModel, child) {
            List<ChartData> chartData = [
              ChartData('Loan Amount', calculateModel.getLoanAmountPercent(),Colors.deepOrange.shade600),
              ChartData('Total Amount', (100-calculateModel.getLoanAmountPercent()),Colors.lightGreenAccent.shade400),
            ];
            return ListView(

                shrinkWrap: true,

                children: [
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Loan Amount",style: TextStyle(fontSize: 14,color: Colors.white70,fontWeight: FontWeight.w500,)),
                          const SizedBox(height: 3,),
                          Text('NPR ${calculateModel.formatter.format(calculateModel.getLoanAmount()).toString()}',style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w500),),
                        ],
                      ),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Tenure",style: TextStyle(fontSize: 14,color: Colors.white70,fontWeight: FontWeight.w500,)),
                          const SizedBox(height: 3,),
                          Text('${calculateModel.tenureValue.toStringAsFixed(0)} ${calculateModel.selectedTenureType}',style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w500),),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Interest Rate",style: TextStyle(fontSize: 14,color: Colors.white70,fontWeight: FontWeight.w500,)),
                          const SizedBox(height: 3,),
                          Text('${calculateModel.intrestRate.toString()} %',style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w500),),
                        ],
                      ),

                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 24,bottom: 8),
                    child: Divider(color: Colors.white70,height: 10,thickness: 0.4,),
                  ),

                  const Center(child: Text("Breakup of total payment",style: TextStyle(fontSize: 16,color: Colors.white,fontWeight: FontWeight.w500),)),


                  SfCircularChart(borderWidth: 0,
                    tooltipBehavior: TooltipBehavior(enable: false,format: 'point.y %'),
                    legend:
                    Legend( legendItemBuilder: (legendText, series, point, seriesIndex) {
                      return Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [

                          Container(height: 10,width: 10,decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: point.color),margin: EdgeInsets.only(left: 50,right: 5),),
                          Text(legendText,style: TextStyle(color: Colors.white,fontWeight: FontWeight.w400,fontSize: 14),)
                        ],
                      );
                    },
                      isVisible: true,alignment: ChartAlignment.center,position:LegendPosition.bottom,orientation: LegendItemOrientation.horizontal,borderWidth: 0,height: '0',padding: 0),
                    series: [
                      DoughnutSeries(

                          enableTooltip: false,
                          radius: '110',
                          innerRadius: '82',

                          pointColorMapper: (data, index) => data.color,
                          dataLabelSettings:DataLabelSettings(
                            builder: (data, point, series, pointIndex, seriesIndex) {
                              return Container(padding: EdgeInsets.all(5),
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),
                                      color: Colors.grey.shade600),
                                  child: Text('${calculateModel.formatter.format(data.y)} %',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500),));
                            },
                              color: Colors.blueGrey,
                              labelAlignment: ChartDataLabelAlignment.top,
                              labelIntersectAction: LabelIntersectAction.shift,
                              labelPosition: ChartDataLabelPosition.outside,
                              isVisible : true,textStyle: TextStyle(color: Colors.white)),
                          xValueMapper: ( data, index) => data.x,
                          yValueMapper: (data, index) => data.y,dataSource: chartData)
                    ],),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 15,top: 30),
                    child: Divider(color: Colors.white70,height: 10,thickness: 0.4,),
                  ),

                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Principle loan amount",style: TextStyle(fontSize: 14,color: Colors.white54,fontWeight: FontWeight.w500),),
                      Text("NPR ${calculateModel.formatter.format(calculateModel.getLoanAmount()).toString()}",style: TextStyle(fontSize: 14,color: Colors.white54,fontWeight: FontWeight.w500),)


                    ],),
                  const SizedBox(height: 20,),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Total Interest Payable",style: TextStyle(fontSize: 14,color: Colors.white54,fontWeight: FontWeight.w500),),
                      Text("NPR ${calculateModel.formatter.format(calculateModel.getPayableInterest()).toString()}",style: TextStyle(fontSize: 14,color: Colors.white54,fontWeight: FontWeight.w500),)


                    ],),
                  const SizedBox(height: 20,),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Total Amount Payable",style: TextStyle(fontSize: 14,color: Colors.white,fontWeight: FontWeight.w500),),
                      Text("NPR ${calculateModel.formatter.format(calculateModel.getTotalAmount()).toString()}",style: TextStyle(fontSize: 14,color: Colors.white,fontWeight: FontWeight.w500),)


                    ],),
                  const Padding(
                    padding: EdgeInsets.only(top: 24,bottom: 8),
                    child: Divider(color: Colors.white70,height: 10,thickness: 0.4,),
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
  ChartData(this.x, this.y,   [this.color=Colors.white]);
  final String x;
  final double y;
   final Color color;
}

class PreviewWidget extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
  return
    Consumer<CalculateModel>(builder: (context, calculateModel, child){
      return Padding(
        padding: const EdgeInsets.only(top:15.0,left: 15,right: 15),
        child: Column(children: [
          Center(child:
          Container(height: 3,width: 100,decoration: BoxDecoration(color: Colors.white54,borderRadius: BorderRadius.circular(10))),),
          const Padding(
            padding: EdgeInsets.only(top: 15,bottom: 2),
            child: Center(child: Text("Loan EMI",style: TextStyle(fontSize: 14,color: Colors.white70,fontWeight: FontWeight.w500),)),
          ),
          Row( mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("NPR ${calculateModel.formatter.format(calculateModel.getEmi()).toString()}",style: TextStyle(fontSize: 28,color: Colors.white,fontWeight: FontWeight.w500)),
              const Padding(
                padding: EdgeInsets.only(top:5.0),
                child: Text(" /month",style: TextStyle(fontSize: 14,color: Colors.white70,fontWeight: FontWeight.w500)),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(top: 24),
            child: Divider(color: Colors.white70,height: 10,thickness: 0.4,),
          ),
        ],),
      );
    }

    );
  }

}

class ColorWidget extends StatelessWidget{

  final Widget child;


  const ColorWidget({required this.child});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return   Container(
    decoration: BoxDecoration(
    borderRadius: const BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
    gradient: LinearGradient(begin: Alignment.topLeft,end: Alignment.bottomRight,
        colors: [Colors.blue.shade900,Colors.lightBlue.shade500])),
child: child);
  }

}