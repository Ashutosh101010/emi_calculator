import 'package:emi_calculator/calculate_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoanTypeSheet extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Consumer<CalculateModel>(
      builder: (context, calculateModel, child){
      return Container(decoration: const BoxDecoration(borderRadius: BorderRadius.only(topRight: Radius.circular(20),topLeft: Radius.circular(20)),color: Colors.white),
        child: ListView(

          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            const SizedBox(height: 10,),
            GestureDetector(onTap: (){
              calculateModel.selectedAmountType=calculateModel.amountType[0];
              Navigator.pop(context);
            },
              child:
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(),
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
                   Container(),
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
  });


  }

}