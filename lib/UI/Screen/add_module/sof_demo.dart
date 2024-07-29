import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vpn_scanner/Constant/app_constant.dart';
import 'package:vpn_scanner/Constant/app_image.dart';
import 'package:vpn_scanner/Constant/colors.dart';
import 'package:vpn_scanner/UI/Widget/common_text_field.dart';
import 'package:vpn_scanner/UI/Widget/custom_appbar.dart';
import 'package:vpn_scanner/UI/Widget/text_button.dart';
import 'add_module_logic.dart';

class SOF extends StatefulWidget {
  @override
  _SOFState createState() => _SOFState();
}

class _SOFState extends State<SOF> {
  var keyTECs = <TextEditingController>[];
  var valueTECs = <TextEditingController>[];
  var containerList = <Container>[];

  Container createCard() {
    var h = MediaQuery.of(Get.context!).size.height;
    var w = MediaQuery.of(Get.context!).size.width;
    var keyController = TextEditingController();
    var valueController = TextEditingController();
    keyTECs.add(keyController);
    valueTECs.add(valueController);
    return Container(
      child: Column(
        children: [
          SizedBox(height: h * 0.03),
          Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: CommonTextField(
                    label: 'key',
                    // maxLines: 2,
                    controller: keyController,
                    textInputType: TextInputType.text),
              ),
              SizedBox(width: w * 0.04),
              Expanded(
                child: CommonTextField(
                    label: 'value',
                    // maxLines: 2,
                    controller: valueController,
                    textInputType: TextInputType.text),
              ),
              // TextField(
              //     controller: keyController,
              //     decoration: InputDecoration(labelText: 'key')),
              // TextField(
              //     controller: valueController,
              //     decoration: InputDecoration(labelText: 'value')),
            ],
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    containerList.add(createCard());
  }

  _onDone() {
    List<PersonEntry> entries = [];
    for (int i = 0; i < containerList.length; i++) {
      var key = keyTECs[i].text;
      var value = valueTECs[i].text;
      entries.add(PersonEntry(key, value));
    }
    Navigator.pop(context, entries);
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: w * 0.04),
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                itemCount: containerList.length,
                itemBuilder: (BuildContext context, int index) {
                  return containerList[index];
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                child: Text('add new'),
                onPressed: () =>
                    setState(() => containerList.add(createCard())),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.done), onPressed: _onDone),
    );
  }
}

class PersonEntry {
  String? key, value;

  PersonEntry(this.key, this.value);

  @override
  String toString() {
    // return 'Person: name= $key, age= $value';
    return '{"key" : "${key.toString()}", "value" : "${value.toString()}"}';
  }
}
