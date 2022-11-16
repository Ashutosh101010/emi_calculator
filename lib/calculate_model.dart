import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class CalculateModel extends ChangeNotifier{
  double _loanValue = 1.0;
  double _tenureValue = 1.0;
  double _interestRate=1;
  List<String> _amountType=['lacs','thousand'];
  List _tenureType=['months','years'];
  String _selectedAmountType='lacs';
  String _selectedTenureType='years';
  var formatter = NumberFormat.decimalPattern();

  void changeLoanValue(value)
  {
    _loanValue=value;
    notifyListeners();
  }
    void changeTenureValue(value)
  {
    _tenureValue=value;
    notifyListeners();
  }


  double get interestRate => _interestRate;

  set interestRate(double value) {
    _interestRate = value;
    notifyListeners();
  }

  double get tenureValue => _tenureValue;

  set tenureValue(double value) {
    _tenureValue = value;
    notifyListeners();
  }

  double get loanValue => _loanValue;

  set loanValue(double value) {
    _loanValue = value;
    notifyListeners();
  }

  double getTotalAmount()
  {
   return num.parse((getLoanAmount()+getPayableInterest()).toStringAsFixed(2)).toDouble();
  }

  double getPayableInterest()
  {
    return num.parse((getEmi()*getMonths()-getLoanAmount()).toStringAsFixed(2)).toDouble();
    // return  num.parse((getLoanAmount()*getInterest()*pow((1+getInterest()),getMonths())).toStringAsFixed(1)).toDouble();
  }

  double getInterest()
  {
    return (_interestRate/100/12);
  }
  double getMonths()
  {
    return _selectedTenureType==_tenureType[0]?_tenureValue:_tenureValue*12;
  }
  double getEmi()
  {
    return num.parse(((getLoanAmount()*getInterest()*pow((1+getInterest()),getMonths()))/(pow((1+getInterest()),getMonths())-1)).toStringAsFixed(2)).toDouble();
  }

double getLoanAmount()
{
  return (_selectedAmountType==_amountType[0]?_loanValue*100000:_loanValue*1000);
}


double getLoanAmountPercent()
{
  return num.parse(((getLoanAmount()/getTotalAmount())*100).toStringAsFixed(2)).toDouble();
}

  String get selectedTenureType => _selectedTenureType;

  set selectedTenureType(String value) {
    _selectedTenureType = value;
    notifyListeners();
  }

  String get selectedAmountType => _selectedAmountType;

  set selectedAmountType(String value) {
    _selectedAmountType = value;
    notifyListeners();
  }

  List get tenureType => _tenureType;

  set tenureType(List value) {
    _tenureType = value;
  }

  List<String> get amountType => _amountType;

  set amountType(List<String> value) {
    _amountType = value;
  }

}