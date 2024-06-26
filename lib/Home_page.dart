import 'package:flutter/material.dart';
import 'package:invoice_ui/cus_detail.dart';
import 'List.dart';

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  TextEditingController Quanlist=TextEditingController();
  TextEditingController Pricelist=TextEditingController();
  String? custname;
  String? cdate;
  String? cbankname;
  String? acno;
  List<TextEditingController> productlist=[];
  List<TextEditingController> qunlist=[];
  List<TextEditingController> pricelist=[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Invioce Generater",style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.w500,letterSpacing: 3),),
        centerTitle: true,
      ),body: SingleChildScrollView(
        child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              onChanged: (value) {
                custname=value;
              },
              decoration: InputDecoration(
                  hintText: "Coustmer name",border: OutlineInputBorder()),
            ),
          ),
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              onChanged: (value) {
                cdate=value;
              },
              decoration: InputDecoration(hintText: "Date",border: OutlineInputBorder()),
            ),
          ),
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Column(
                        children: [
                          Column(
                            children: productlist.map((e) => Row(
                              children: [
                                SizedBox(height: 10,),
                                Expanded(
                                  child: TextFormField(
                                    controller: e,
                                    decoration: InputDecoration(border: OutlineInputBorder(),hintText: "product"),
                                  ),
                                ),
                              ],
                            ),).toList(),
                          ),

                        ],
                      ),
                      Column(
                        children: [
                          Column(
                            children: qunlist.map((e) => Row(
                              children: [
                                SizedBox(height: 10,),
                                Expanded(
                                  child: TextFormField(
                                    controller: e,
                                    decoration: InputDecoration(border: OutlineInputBorder(),hintText: "Quantity"),
                                  ),
                                ),
                              ],
                            ),).toList(),
                          ),
                          Column(
                            children: pricelist.map((e) => Row(
                              children: [
                                SizedBox(height: 10,),
                                Expanded(
                                  child: TextFormField(
                                    controller: e,
                                    decoration: InputDecoration(border: OutlineInputBorder(),hintText: "Price"),
                                  ),
                                ),
                              ],
                            ),).toList(),
                          ),

                        ],
                      ),

                      ElevatedButton(onPressed: () {
                        productlist.add(TextEditingController());
                        qunlist.add(TextEditingController());
                        pricelist.add(TextEditingController());
                        setState(() {
        
                        });
        
                      }, child: Icon(Icons.add,color: Colors.white,),style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.black54),fixedSize: MaterialStatePropertyAll(Size(390,20))),)
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              onChanged: (value) {
                cbankname=value;
              },
              decoration: InputDecoration(hintText: "Bank name",border: OutlineInputBorder()),
            ),
          ),
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              onChanged: (value) {
                acno=value;
              },
              decoration: InputDecoration(hintText: "Bank Account number",border: OutlineInputBorder()),
            ),
          ),
          SizedBox(height: 10,),
          InkWell(
            onTap: () {
              cdetail.products.clear();
              cdetail.amount.clear();
              cdetail.Qun.clear();
              for (var element in productlist) {
                cdetail.products.add(element.text);
              }

              for (var element in qunlist) {
                cdetail.Qun.add(element.text);
              }

              for (var element in pricelist) {
                cdetail.amount.add(element.text);
              }


              cdetail.name=custname;
              cdetail.date=cdate;
              cdetail.bankname=cbankname;
              cdetail.acnum=acno;



              Navigator.pushNamed(context, "my_pdf");

            },
            child: Container(
              height: 60,
              width: 300,
              decoration: BoxDecoration(color: Colors.black87,borderRadius: BorderRadius.circular(30)),
              child: Center(child: Text("Make invoice",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),)),

            ),
          ),
        ],
            ),
      )
    );
  }
}
