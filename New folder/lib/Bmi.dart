import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
class Bmi extends StatefulWidget {
  const Bmi({Key? key}) : super(key: key);

  @override
  _BmiState createState() => _BmiState();
}

class _BmiState extends State<Bmi> {
  Color? boxcolor1=Color(0xff0A1840Fd);
  Color? boxcolor2=Color(0xff0A1840Fd);
   String result="";
   String result2="";

  TextEditingController _textcontoller=TextEditingController();
  TextEditingController _textcontoller2=TextEditingController();
  void calculatebmi(double h,double w){
    double finalresult=w/(h*h/10000);
    String bmi=finalresult.toStringAsFixed(1);
    setState(() {
      result=bmi;
      if(finalresult>=18.5&&finalresult<=24.9)
        result2="(Normal)";
      else if(finalresult<18.5)
        result2="(Underwight)";
      else if(finalresult>=25&&finalresult<=29.9)
        result2="(Overwight)";
      else if(finalresult>=30&&finalresult<=34.9)
        result2="(Obese)";
      else if(finalresult>=35&&finalresult<=39.9)
        result2="(Severely Obese)";
      else if(finalresult>=40)
        result2="(Morbid obese)";


    });;
  }

  @override
  Widget build(BuildContext context) {
   return Scaffold(
    appBar: AppBar(
    backgroundColor:Color(0xff0A1840Fd),
    title: Text("BMI calculator"),
    ),
    body: Column(
    children: [
     Expanded(
     child: InkWell(onTap: (){
       setState(() {
         boxcolor2=Colors.indigo;
         boxcolor1=Color(0xff0A1840Fd);
       });
     },
       child: Row(
       children: [
       Expanded(
       child: Padding(padding: const EdgeInsets.all(10), child: Container(
       child: Column(mainAxisAlignment: MainAxisAlignment.center,
       children: [
       Container(
       child: Expanded(
         child: Image.asset("images/a.png",height:100,width: 100,
              ),
       ),
             )
    ],),
           decoration: BoxDecoration(
           borderRadius: BorderRadius.circular(20),
           color: boxcolor2
           ),
           ),
         ),
       ),
         Expanded(
         child: Padding(padding: const EdgeInsets.all(10), child: Container(
         child: InkWell(onTap: (){
           setState(() {
          boxcolor1=Colors.indigo;
          boxcolor2=Color(0xff0A1840Fd);
           });
         },
           child: Column(mainAxisAlignment: MainAxisAlignment.center,
           children: [
           Container(
           child: Expanded(
             child: Image.asset("images/b.png",height: 100,width: 100,
             ),
           ),
           )
           ],),
         ),
         decoration: BoxDecoration(
         borderRadius: BorderRadius.circular(20),
         color: boxcolor1
         ),
         ),
         ),
         ),
       ],),
     ),
     ),
      SizedBox(height: 30,)
      //****************************frist text field*********************************
      ,Expanded(
        child: Padding(
          padding: EdgeInsets.only(left: 30,right: 30,bottom: 8),
          child: Container(
            color: Color(0xff0A1840Fd),
            child: Column(
              children: [
                Padding(
                 padding: const EdgeInsets.only(top: 10),
                 child:Center(
                 child: Text("your height in Cm",style: TextStyle(fontSize: 20,color: Colors.white),)),
                ),
                Expanded(
                    child:Container(
                      child: TextField(
                        style: TextStyle(fontSize: 30,color: Colors.white),
                        textAlign:TextAlign.center ,
                        controller: _textcontoller,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none
                          ),
                        ),
                      ),
                      //height:10,
                    )
                ),
          ],
          ),
          ),
        ),
        ),
      //****************************second text field*********************************
      Expanded(
      child: Padding(
          padding: EdgeInsets.only(left: 30,right: 30,bottom: 8),
          child: Container(
            width: 300,
            height: 10,
            color: Color(0xff0A1840FF),
            child: Column(
            children: [
            Padding(
              padding: const EdgeInsets.only(top:10.0),
              child: Center(child: Text("your whight in kg ",style: TextStyle(fontSize: 20,color: Colors.white,),)),
            ),
            Expanded(
            child:Container(
            child: TextField(
            style: TextStyle(fontSize: 30,color: Colors.white),
            textAlign:TextAlign.center ,
            controller: _textcontoller2,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
            border: OutlineInputBorder(
            borderSide: BorderSide.none
            ),
            ),
            ),
            //height:10,
            )
            ),
            ],
            ),
            ),
            ),
            )



     ,Expanded(
        child: Padding(
          padding: EdgeInsets.only(left: 30,right: 30,bottom: 8),
          child: Container(
            width: 300,
            height: 10,
            color: Color(0xff0A1840FF),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top:10.0),
                  child: Center(child: Text("your Bmi",style: TextStyle(fontSize: 30,color: Colors.white,),)),
                ),
                Expanded(
                child:Container(
                child: Text(
                "$result",style: TextStyle(color: Colors.white,fontSize: 30),

                ),

                    )
                ),Expanded(
                child:Container(
               child: Text(
                "$result2",style: TextStyle(color: Colors.white,fontSize: 30),

                      ),

                    )
                ),
              ],
            ),
          ),
        ),  ),
     Padding(
       padding: const EdgeInsets.all(8.0),
       child: Container(
           height: 50,
            color: Color(0xff316ba5),
            width: 300,
            child: MaterialButton(
            onPressed: (){setState(() {
              double height=double.parse(_textcontoller.value.text);
              double wight=double.parse(_textcontoller2.value.text);
              calculatebmi(height, wight);
            });


            },
            child: Text("calculate",
            style: TextStyle(
            color: Colors.white

            ),),
       ),
          ),
     )
     ]
     ),
    backgroundColor: Color(0xff09143C));
  }
}
