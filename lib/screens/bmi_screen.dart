import 'package:drower/shared/menu_bottom.dart';
import 'package:drower/shared/menu_drawer.dart';
import 'package:flutter/material.dart';
import '../shared/menu_bottom.dart';
class BmiScreen extends StatefulWidget {
  const BmiScreen({Key? key}) : super(key: key);

  @override
  State<BmiScreen> createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {
  final TextEditingController txtHeight =TextEditingController();
  final TextEditingController txtWeight =TextEditingController();
  final double fontSize=18;
  String result='';
  bool isMetric = true;
  bool isImperial = true;
  double? height;
  double? weight;
  late List<bool>isSelected;
  String heightMessage='';
  String weightMessage='';
@override
  void initState() {
   isSelected =[isMetric,isImperial];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    heightMessage='please insert your height in '+((isMetric)?'meters':'inches');
    weightMessage='please insert your weight in '+((isMetric)?'kilos':'pounds');
    return Scaffold(
    appBar:AppBar(title:Text('BMi Calculator')),
      bottomNavigationBar:MenuBottom(),
      drawer: MenuDrawer(),
      body: SingleChildScrollView(
        child: Column(children: [
          ToggleButtons(
            children: [
              Padding(padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text('Metric',style:TextStyle(fontSize:fontSize)),

              ),
              Padding(padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text('Imperial',style:TextStyle(fontSize:fontSize)),

              ),
            ],isSelected:isSelected,onPressed:toggleMeasure),

              Padding(
                padding: const EdgeInsets.all(24.0),
                child: TextField(controller:txtHeight ,keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: heightMessage
                ),
                ),
              ),
               Padding(
                 padding: const EdgeInsets.all(32.0),
                 child: TextField(controller:txtWeight ,keyboardType: TextInputType.number,
                   decoration: InputDecoration(
                       hintText: weightMessage
                   ),
                 ),
               ),
        ElevatedButton(
            child: Text('Calculate BMI',
            style: TextStyle(
              fontSize: fontSize
            )),
          onPressed: findBMI,
        ),
          Text(result,
          style: TextStyle(
            fontSize: fontSize
          ))
        ]),
      ),
    );
  }
  void toggleMeasure (value){
    if (value ==0){
      isMetric = true;
      isImperial=false;
    }else{
      isMetric = false;
      isImperial=true;
    }
    setState(() {
      isSelected=[isMetric,isImperial];
    });
  }
  void findBMI(){
  double bmi =1;
  double height =double.tryParse(txtHeight.text)??0;
  double weight =double.tryParse(txtWeight.text)??0;
  if (isMetric){
    bmi=weight/(height*height);

  }else{
    bmi =703*(weight/(height*height));
  }
  setState(() {
    result='your BMI is' +bmi.toStringAsFixed(2);
  });
  }
}
