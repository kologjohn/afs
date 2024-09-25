import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class CountryCityLocalPicker extends StatefulWidget {
  @override
  _CountryCityLocalPickerState createState() => _CountryCityLocalPickerState();
}

class _CountryCityLocalPickerState extends State<CountryCityLocalPicker> {
  Map<String, dynamic> countryCityData = {};
  List<String> countries = [];
  List<String> cities = [];
  String? selectedCountry;
  String? selectedCity;

  @override
  void initState() {
    super.initState();
    loadJsonData();
  }

  Future<void> loadJsonData() async {
    String data = await rootBundle.loadString('assets/country_city.json');
    setState(() {
      countryCityData = json.decode(data);
      countries = countryCityData['countries'].map<String>((country) => country['name']).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DropdownButton<String>(
          hint: const Text("Select Country"),
          value: selectedCountry,
          onChanged: (newValue) {
            setState(() {
              selectedCountry = newValue;
              cities = countryCityData['countries']
                  .firstWhere((country) => country['name'] == newValue)['cities']
                  .cast<String>();
              selectedCity = null;
            });
          },
          items: countries.map((String country) {
            return DropdownMenuItem<String>(
              value: country,
              child: Text(country),
            );
          }).toList(),
        ),
        SizedBox(height: 20),
        DropdownButton<String>(
          hint: const Text("Select City"),
          value: selectedCity,
          onChanged: (newValue) {
            setState(() {
              selectedCity = newValue;
            });
          },
          items: cities.map((String city) {
            return DropdownMenuItem<String>(
              value: city,
              child: Text(city),
            );
          }).toList(),
        ),
      ],
    );
  }
}

void main() {
  runApp(MaterialApp(home: CountryCityLocalPicker()));
}
