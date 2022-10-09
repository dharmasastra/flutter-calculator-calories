import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kalori/constants.dart';

class KaloriScreen extends StatefulWidget {
  const KaloriScreen({Key? key}) : super(key: key);

  @override
  State<KaloriScreen> createState() => _KaloriScreenState();
}

class _KaloriScreenState extends State<KaloriScreen> {
  FocusNode textFieldAgeNode = FocusNode();
  FocusNode textFieldHeightNode = FocusNode();
  FocusNode textFieldWeightNode = FocusNode();

  final List<String> genderItems = ['Laki - Laki', 'Perempuan'];

  String? selectedGenderValue;

  List<DropdownMenuItem<String>> _addDividersAfterItems(List<String> items) {
    List<DropdownMenuItem<String>> _menuItems = [];
    for (var item in items) {
      _menuItems.addAll(
        [
          DropdownMenuItem<String>(
            value: item,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                item,
                style: const TextStyle(
                  fontSize: 14,
                ),
              ),
            ),
          ),
          //If it's last item, we will not add Divider after it.
          if (item != items.last)
            const DropdownMenuItem<String>(
              enabled: false,
              child: Divider(),
            ),
        ],
      );
    }
    return _menuItems;
  }

  List<double> _getCustomItemsHeights() {
    List<double> _itemsHeights = [];
    for (var i = 0; i < (genderItems.length * 2) - 1; i++) {
      if (i.isEven) {
        _itemsHeights.add(40);
      }
      //Dividers indexes will be the odd indexes
      if (i.isOdd) {
        _itemsHeights.add(4);
      }
    }
    return _itemsHeights;
  }

  @override
  Widget build(BuildContext context) {
    print(textFieldAgeNode.hasFocus);
    return GestureDetector(
      onTap: () {
        setState(() {});
      },
      child: Scaffold(
        body: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.height * 0.18,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Calculator Calories",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: textColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Container(
                          height: 400,
                          padding: const EdgeInsets.all(16),
                          decoration: const BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                alignment: Alignment.center,
                                width: double.infinity,
                                child: TextFormField(
                                  focusNode: textFieldAgeNode,
                                  // onChanged: (value) => print(textFieldNode.hasFocus),
                                  onTap: () => setState(() {}),
                                  decoration: InputDecoration(
                                    labelText: "Umur",
                                    labelStyle: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: textFieldAgeNode.hasFocus
                                          ? secondaryColor
                                          : textColor,
                                    ),
                                    border: const OutlineInputBorder(),
                                    focusedBorder: const OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: secondaryColor),
                                    ),
                                    suffixIcon: Icon(
                                      FontAwesomeIcons.user,
                                      color: textFieldAgeNode.hasFocus
                                          ? secondaryColor
                                          : textColor,
                                      size: 16,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: defaultPadding,
                              ),
                              Container(
                                alignment: Alignment.center,
                                width: double.infinity,
                                child: TextFormField(
                                  focusNode: textFieldWeightNode,
                                  // onChanged: (value) => print(textFieldNode.hasFocus),
                                  onTap: () => setState(() {}),
                                  decoration: InputDecoration(
                                    labelText: "Berat Badan",
                                    labelStyle: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: textFieldWeightNode.hasFocus
                                          ? secondaryColor
                                          : textColor,
                                    ),
                                    border: const OutlineInputBorder(),
                                    focusedBorder: const OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: secondaryColor),
                                    ),
                                    suffixIcon: Icon(
                                      FontAwesomeIcons.weightScale,
                                      color: textFieldWeightNode.hasFocus
                                          ? secondaryColor
                                          : textColor,
                                      size: 16,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: defaultPadding,
                              ),
                              Container(
                                alignment: Alignment.center,
                                width: double.infinity,
                                child: TextFormField(
                                  focusNode: textFieldHeightNode,
                                  // onChanged: (value) => print(textFieldNode.hasFocus),
                                  onTap: () => setState(() {}),
                                  decoration: InputDecoration(
                                    labelText: "Tinggi Badan",
                                    labelStyle: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: textFieldHeightNode.hasFocus
                                          ? secondaryColor
                                          : textColor,
                                    ),
                                    border: const OutlineInputBorder(),
                                    focusedBorder: const OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: secondaryColor),
                                    ),
                                    suffixIcon: Icon(
                                      FontAwesomeIcons.textHeight,
                                      color: textFieldHeightNode.hasFocus
                                          ? secondaryColor
                                          : textColor,
                                      size: 16,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: defaultPadding,
                              ),
                              DropdownButtonFormField2(
                                onMenuStateChange: (isOpen) => setState(() {}),
                                decoration: const InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: secondaryColor),
                                  ),
                                  isDense: true,
                                  contentPadding: EdgeInsets.zero,
                                  border: OutlineInputBorder(),
                                ),
                                isExpanded: true,
                                hint: const Text(
                                  'Select Your Gender',
                                  style: TextStyle(fontSize: 14),
                                ),
                                icon: const Icon(
                                  Icons.arrow_drop_down,
                                  color: Colors.black45,
                                ),
                                iconSize: 30,
                                buttonHeight: 60,
                                buttonPadding:
                                    const EdgeInsets.only(left: 20, right: 10),
                                dropdownDecoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                items: genderItems
                                    .map((item) => DropdownMenuItem<String>(
                                          value: item,
                                          child: Text(
                                            item,
                                            style: const TextStyle(
                                              fontSize: 14,
                                            ),
                                          ),
                                        ))
                                    .toList(),
                                validator: (value) {
                                  if (value == null) {
                                    return 'Please select gender.';
                                  }
                                },
                                onChanged: (value) {
                                  //Do something when changing the item if you want.
                                },
                                onSaved: (value) {
                                  selectedGenderValue = value.toString();
                                },
                              ),
                              const SizedBox(
                                height: defaultPadding,
                              ),
                              DropdownButtonFormField2(
                                onMenuStateChange: (isOpen) => setState(() {}),
                                decoration: const InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: secondaryColor),
                                  ),
                                  isDense: true,
                                  contentPadding: EdgeInsets.zero,
                                  border: OutlineInputBorder(),
                                ),
                                isExpanded: true,
                                hint: const Text(
                                  'Select Your Activity',
                                  style: TextStyle(fontSize: 14),
                                ),
                                icon: const Icon(
                                  Icons.arrow_drop_down,
                                  color: Colors.black45,
                                ),
                                iconSize: 30,
                                buttonHeight: 60,
                                buttonPadding:
                                    const EdgeInsets.only(left: 20, right: 10),
                                dropdownDecoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                items: genderItems
                                    .map((item) => DropdownMenuItem<String>(
                                          value: item,
                                          child: Text(
                                            item,
                                            style: const TextStyle(
                                              fontSize: 14,
                                            ),
                                          ),
                                        ))
                                    .toList(),
                                validator: (value) {
                                  if (value == null) {
                                    return 'Please select gender.';
                                  }
                                },
                                onChanged: (value) {
                                  //Do something when changing the item if you want.
                                },
                                onSaved: (value) {
                                  selectedGenderValue = value.toString();
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Expanded(
                        flex: 3,
                        child: Container(
                          height: 400,
                          color: secondaryColor,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
