import 'package:emi_calculator/calculate_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class TenureTypeSheet extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return TenureTypeSheetState();
  }

}
class TenureTypeSheetState extends State<TenureTypeSheet>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Consumer<CalculateModel>(builder: (context, calculateModel, child) {
      return Container(decoration: const BoxDecoration(borderRadius: BorderRadius.only(topRight: Radius.circular(20),topLeft: Radius.circular(20)),color: Colors.white),
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
                    Container(),
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
                    Container(),
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
                }, child: const Text("Cancel",style: TextStyle(color: Colors.lightBlueAccent,fontSize: 18,fontWeight: FontWeight.w400,) ,)),
            const SizedBox(height: 10,)
          ],),
      );
    },);
  }

}