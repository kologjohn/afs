import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:africanstraw/components/global.dart';
import 'package:africanstraw/tables/checkout_table.dart';
import 'package:provider/provider.dart';

import '../components/login_field.dart';
import '../controller/controller.dart';

class CheckoutForm extends StatefulWidget {
  @override
  _CheckoutFormState createState() => _CheckoutFormState();
}

class _CheckoutFormState extends State<CheckoutForm> {
  TextEditingController firstname = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController contact = TextEditingController();
  TextEditingController postcode = TextEditingController();
  TextEditingController street = TextEditingController();
  TextEditingController city = TextEditingController();

  final GlobalKey<FormState> formskey = GlobalKey<FormState>();

  String _selectedCountry = 'Ghana'; // Default country
  String _selectedRegion = 'Accra'; // Default region for Ghana

  Map<String, List<String>> _regionsByCountry = {
    'Ghana': ['Accra', 'Kumasi', 'Tamale', 'Cape Coast'],
    'Nigeria': ['Abuja', 'Lagos', 'Kano', 'Ibadan'],
    // Add more countries and their regions here
  };
@override
  void initState() {
    // TODO: implement initState
  print("hello");
  Ecom().alreadypaid(context);
    super.initState();
  }
  bool validator() {
    return formskey.currentState!.validate();
  }

  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return ProgressHUD(
      child: Consumer<Ecom>(
        builder: (BuildContext context,  ecom, child) {
          String fname="";
          String lname="";
          if(ecom.mycarttotal==0){
            ecom.carttotal();
            ecom.cartidmethod();
            ecom.currecy();
          }
          double convertedamt=double.parse(ecom.cardvalue)*ecom.currecyval;
          String finalconverted=ecom.numformat.format(convertedamt);
          if(ecom.auth.currentUser!=null){
            String? fullname=ecom.auth.currentUser!.displayName;
            List<String> split=fullname!.split(" ");
            fname=split[1];
            lname=split[0];
            firstname.text=fname;
            lastname.text=lname;
            email.text=ecom.auth.currentUser!.email!;
          }
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.lightGreen[50],
              centerTitle: true,
              title: const Text('Checkout Form'),
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: 1250,
                          color: Colors.white54,
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                //const SizedBox(width: 10),
                                Expanded(
                                    flex: 5,
                                    child: Wrap(
                                      spacing: 5,
                                      runSpacing: 5,
                                      children: [
                                        Container(
                                          //color: Colors.lightBlue[50],
                                          width: 600,
                                          child: Padding(
                                            padding: const EdgeInsets.all(20.0),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                const Text(
                                                  "Billing Details",
                                                  style: TextStyle(
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 16
                                                  ),
                                                ),
                                                const SizedBox(height: 20),
                                                Form(
                                                  key: formskey,
                                                  child: ListView(
                                                    shrinkWrap: true,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Expanded(
                                                            child: LoginField(
                                                              hintText: 'First Name',
                                                              controller: firstname,
                                                              textInputType: TextInputType.name,
                                                              obscure: false,
                                                              labelText: 'First Name',
                                                              enabled: true,
                                                            ),
                                                          ),
                                                          const SizedBox(width: 16.0),
                                                          Expanded(
                                                            child: LoginField(
                                                              hintText: 'Last Name',
                                                              controller: lastname,
                                                              textInputType: TextInputType.name,
                                                              obscure: false,
                                                              labelText: 'Last Name',
                                                              enabled: true,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      const SizedBox(height: 16.0),
                                                      Row(
                                                        children: <Widget>[
                                                          Expanded(
                                                            child: DropdownButtonFormField<String>(
                                                              value: _selectedCountry,
                                                              onChanged: (value) {
                                                                setState(() {
                                                                  _selectedCountry = value!;
                                                                  _selectedRegion = _regionsByCountry[value]![0];
                                                                });
                                                              },
                                                              items: _regionsByCountry.keys.map((String country) {
                                                                return DropdownMenuItem<String>(
                                                                  value: country,
                                                                  child: Text(country),
                                                                );
                                                              }).toList(),
                                                              decoration: InputDecoration(
                                                                labelText: 'Country',
                                                                enabledBorder: OutlineInputBorder(
                                                                  borderSide: const BorderSide(
                                                                    color: Global.borderColor,
                                                                    width: 1,
                                                                  ),
                                                                  borderRadius: BorderRadius.circular(6),
                                                                ),
                                                                focusedBorder: OutlineInputBorder(
                                                                  borderSide: const BorderSide(
                                                                    color: Colors.orange,
                                                                    width: 1,
                                                                  ),
                                                                  borderRadius: BorderRadius.circular(6),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          const SizedBox(width: 16.0),
                                                          Expanded(
                                                            child: DropdownButtonFormField<String>(
                                                              value: _selectedRegion,
                                                              onChanged: (value) {
                                                                setState(() {
                                                                  _selectedRegion = value!;
                                                                });
                                                              },
                                                              items: _regionsByCountry[_selectedCountry]!.map((String region) {
                                                                return DropdownMenuItem<String>(
                                                                  value: region,
                                                                  child: Text(region),
                                                                );
                                                              }).toList(),
                                                              decoration: InputDecoration(
                                                                labelText: 'Region/State',
                                                                enabledBorder: OutlineInputBorder(
                                                                  borderSide: const BorderSide(
                                                                    color: Global.borderColor,
                                                                    width: 1,
                                                                  ),
                                                                  borderRadius: BorderRadius.circular(6),
                                                                ),
                                                                focusedBorder: OutlineInputBorder(
                                                                  borderSide: const BorderSide(
                                                                    color: Colors.orange,
                                                                    width: 1,
                                                                  ),
                                                                  borderRadius: BorderRadius.circular(6),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      const SizedBox(height: 16.0),
                                                      LoginField(
                                                        hintText: 'Street Address',
                                                        controller: street,
                                                        textInputType: TextInputType.text,
                                                        obscure: false,
                                                        labelText: 'Street Address',
                                                        enabled: true,
                                                      ),
                                                      const SizedBox(height: 16.0),
                                                      LoginField(
                                                        hintText: 'Town/City',
                                                        controller: city,
                                                        textInputType: TextInputType.text,
                                                        obscure: false,
                                                        labelText: 'Town/City',
                                                        enabled: true,
                                                      ),
                                                      const SizedBox(height: 16.0),
                                                      LoginField(
                                                        hintText: 'Postcode/ZIP',
                                                        controller: postcode,
                                                        textInputType: TextInputType.number,
                                                        obscure: false,
                                                        labelText: 'Postcode/ZIP',
                                                        enabled: true,
                                                      ),
                                                      const SizedBox(height: 16.0),
                                                      LoginField(
                                                        hintText: 'Phone',
                                                        controller: contact,
                                                        textInputType: TextInputType.phone,
                                                        obscure: false,
                                                        labelText: 'Phone',
                                                        enabled: true,
                                                      ),
                                                      const SizedBox(height: 16.0),
                                                      LoginField(
                                                        hintText: 'Email',
                                                        controller: email,
                                                        textInputType: TextInputType.emailAddress,
                                                        obscure: false,
                                                        labelText: 'Email', enabled: true,
                                                      ),
                                                      const SizedBox(height: 16),
                                                      const Text(
                                                        "Additional Information",
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            fontWeight: FontWeight.bold
                                                        ),
                                                      ),
                                                      const SizedBox(height: 15),
                                                      const Text("Order notes (Optional)"),
                                                      const SizedBox(height: 15),
                                                      Container(
                                                        width: double.infinity,
                                                        height: 150,
                                                        decoration: const BoxDecoration(
                                                          //color: Colors.grey,
                                                          border: Border(
                                                            top: BorderSide(width: 1.0, color: Colors.black54),
                                                            right: BorderSide(width: 1.0, color: Colors.black54),
                                                            bottom: BorderSide(width: 1.0, color: Colors.black54),
                                                            left: BorderSide(width: 1.0, color: Colors.black54),
                                                          ),
                                                        ),
                                                        child: const Padding(
                                                          padding: EdgeInsets.all(8.0),
                                                          child: TextField(
                                                            decoration: InputDecoration(
                                                              contentPadding: EdgeInsets.only(right: 40),
                                                              hintText: 'Notes for your order, e.g. Special notes for delivery...',
                                                              border: InputBorder.none,
                                                            ),
                                                            keyboardType: TextInputType.multiline,
                                                            maxLines: null,
                                                          ),
                                                        ),
                                                      ),
                                                      const SizedBox(height: 16.0),
                                                      Row(
                                                        children: [
                                                          Checkbox(
                                                            value: _isChecked,
                                                            onChanged: (bool? value) {
                                                              setState(() {
                                                                _isChecked = value!;
                                                              });
                                                            },
                                                          ),
                                                          const Text(
                                                            'Ship to a different address?',
                                                            style: TextStyle(
                                                                fontWeight: FontWeight.bold,
                                                                fontSize: 16
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      const SizedBox(height: 16),
                                                      Container(
                                                        decoration: BoxDecoration(
                                                            color: Global.mainColor,
                                                            borderRadius: BorderRadius.circular(6)
                                                        ),
                                                        child: ElevatedButton(
                                                          onPressed: () async{
                                                            if (validator()) {
                                                              String email_txt=email.text.trim().toString();
                                                              String fname_txt=firstname.text.trim().toString();
                                                              String lname_txt=lastname.text.trim().toString();
                                                              String addres_txt=street.text.trim().toString();
                                                              String phone_txt=contact.text.trim().toString();
                                                              String country_txt=_selectedCountry;
                                                              String region_txt=_selectedRegion;
                                                              String city_txt=city.text.trim().toString();
                                                              String postcode_txt=postcode.text.trim().toString();
                                                              final pgress=ProgressHUD.of(context);
                                                              pgress!.show();
                                                              Future.delayed(Duration(seconds: 10),(){
                                                                pgress.dismiss();
                                                              });
                                                              await ecom.checkout(email_txt, fname_txt,lname_txt, addres_txt, phone_txt, country_txt, region_txt, city_txt, postcode_txt);
                                                              double paystackvalue=convertedamt*100;

                                                              ecom.paystacks(phone_txt, "$paystackvalue",ecom.mycardid);

                                                              pgress.dismiss();

                                                            } else {
                                                              print('Form is invalid');
                                                            }
                                                          },
                                                          style: ElevatedButton.styleFrom(
                                                            fixedSize: const Size(395, 55),
                                                            backgroundColor: Colors.transparent,
                                                            shadowColor: Colors.transparent,
                                                          ),
                                                          child: const Text('Place Order', style: TextStyle(color: Colors.white)),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Container(
                                          //color: Colors.lightBlue[50],
                                          width: 600,
                                          child: Padding(
                                              padding: const EdgeInsets.all(20.0),
                                              child: Container(
                                                //color: Colors.lightBlue[50],
                                                //height: 300,
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    const Text(
                                                      "Your Order",
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          fontWeight: FontWeight.bold
                                                      ),
                                                    ),
                                                    const SizedBox(height: 20),
                                                    Table(
                                                      border: TableBorder.all(),
                                                      children:  [
                                                        const TableRow(
                                                          children: [
                                                            TableCell(
                                                              child: Padding(
                                                                padding: EdgeInsets.all(8.0),
                                                                child: Text('Product'),
                                                              ),
                                                            ),
                                                            TableCell(
                                                              child: Padding(
                                                                padding: EdgeInsets.all(8.0),
                                                                child: Text('Subtotal'),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        TableRow(
                                                          children: [
                                                            const TableCell(
                                                              child: Padding(
                                                                padding: EdgeInsets.all(8.0),
                                                                child: Text('Subtotal'),
                                                              ),
                                                            ),
                                                            TableCell(
                                                              child: Padding(
                                                                padding: EdgeInsets.all(8.0),
                                                                child: Text("USD ${ecom.cardvalue}"),
                                                              ),
                                                            ),

                                                          ],
                                                        ),
                                                         const TableRow(
                                                          children: [
                                                            TableCell(
                                                              child: Padding(
                                                                padding: EdgeInsets.all(8.0),
                                                                child: Text('Shipping'),
                                                              ),
                                                            ),
                                                            TableCell(
                                                              child: Padding(
                                                                padding: EdgeInsets.all(8.0),
                                                                child: Text('Free shipping'),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        TableRow(
                                                          children: [
                                                            const TableCell(
                                                              child: Padding(
                                                                padding: EdgeInsets.all(8.0),
                                                                child: Text('Total USD'),
                                                              ),
                                                            ),
                                                            TableCell(
                                                              child: Padding(
                                                                padding: EdgeInsets.all(8.0),
                                                                child: Text("USD ${ecom.cardvalue}"),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        TableRow(
                                                          children: [
                                                            const TableCell(
                                                              child: Padding(
                                                                padding: EdgeInsets.all(8.0),
                                                                child: Text('Total GHS'),
                                                              ),
                                                            ),
                                                            TableCell(
                                                              child: Padding(
                                                                padding: EdgeInsets.all(8.0),
                                                                child: Text("GHS ${finalconverted}"),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    )
                                                    //TableExample()
                                                  ],
                                                ),
                                                //width: 50,
                                              )
                                          ),
                                        ),
                                      ],
                                    )
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
