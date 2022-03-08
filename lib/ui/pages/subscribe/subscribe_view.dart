import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

import '../../shared/colors.dart';

class Subscribe extends StatefulWidget {
  const Subscribe({Key? key}) : super(key: key);

  @override
  State<Subscribe> createState() => _SubscribeState();
}

class _SubscribeState extends State<Subscribe> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final pickerData = [
    'Gönderim Aralığı',
    'Haftalık Bildirim',
    'Aylık Bildirim'
  ];
  final frequencies = {
    'Gönderim Aralığı': 'choose',
    'Haftalık Bildirim': 'weekly',
    'Aylık Bildirim': 'monthly'
  };
  String dropdownValue = 'Gönderim Aralığı';

  onPressSubscribe(frequency, name, email) async {
    if (!name.isEmpty && !email.isEmpty && frequency != 'choose') {
      try {
        var response = await http.post(
          Uri.parse('https://api.kodilan.com/newsletters'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'Accept': "application/json",
          },
          body: jsonEncode(<String, String>{
            'name': name,
            'email': email,
            'frequency': frequency,
          }),
        );
        if (response.statusCode == 200) {
          setState(() {
            nameController.text = '';
            emailController.text = '';
            dropdownValue = 'Gönderim Aralığı';
          });
        } else {
          print(response.statusCode);
          print(response.body);
        }
      } on HttpException catch (e) {
        print('Uyarı! Hata: ' + e.message);
      }
    } else {
      print(
        'Uyarı! Lütfen isim, e-posta ve bildirim aralığı alanlarının hepsini doldurunuz.',
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const Text(
            'Güncel iş ilanlarından haberdar olmak için hemen e-posta listesine '
            'kayıt olun!',
            style: TextStyle(fontSize: 17),
          ),
          const SizedBox(
            height: 16,
          ),
          DropdownButton<String>(
            isExpanded: true,
            value: dropdownValue,
            elevation: 16,
            borderRadius: BorderRadius.circular(5),
            onChanged: (String? newValue) {
              setState(() {
                dropdownValue = newValue!;
              });
            },
            items: pickerData.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
            controller: nameController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'İsim Soyisim',
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
            controller: emailController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'E-Posta Adresi',
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(double.infinity, 50),
              primary: AppColors.mainColor,
            ),
            onPressed: () => onPressSubscribe(frequencies[dropdownValue],
                nameController.text, emailController.text),
            child: Row(
              children: const [
                Padding(
                  padding: EdgeInsets.only(right: 8.0),
                  child: Icon(Icons.add_alert_outlined),
                ),
                Text('Aboneligi Baslat'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
