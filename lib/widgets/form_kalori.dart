import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kalori/constants.dart';
import 'package:kalori/services/fetch_kalori.dart';

typedef _CallbackCalories(
  int calories,
);

class FormCalories extends StatefulWidget {
  FormCalories({Key? key, required this.calories}) : super(key: key);

  final _CallbackCalories calories;
  @override
  State<FormCalories> createState() => _FormCaloriesState();
}

class _FormCaloriesState extends State<FormCalories> {
  FocusNode textFieldAgeNode = FocusNode();
  FocusNode textFieldHeightNode = FocusNode();
  FocusNode textFieldWeightNode = FocusNode();

  String? selectedGenderValue;
  String? selectedActivityValue;

  final List<String> genderItems = ['Laki - Laki', 'Perempuan'];
  final List<String> activityItems = [
    'Istirahat',
    'Aktifitas Ringan',
    "Aktifitas Sedang",
    "Aktifitas Berat",
    "Aktifitas Sangat Berat",
  ];

  String? age;
  String? weight;
  String? height;
  String? gender;
  String? activity;

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 450,
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Row(
        // crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            alignment: Alignment.center,
            width: 200,
            child: TextFormField(
              focusNode: textFieldAgeNode,
              // onChanged: (value) => print(textFieldNode.hasFocus),
              onTap: () => setState(() {}),
              onChanged: (value) {
                setState(() {
                  age = value;
                });
              },
              decoration: InputDecoration(
                labelText: "Umur",
                labelStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: textFieldAgeNode.hasFocus ? buttonColor : textColor,
                ),
                border: const OutlineInputBorder(),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: buttonColor),
                ),
                // suffixIcon: Icon(
                //   FontAwesomeIcons.user,
                //   color: textFieldAgeNode.hasFocus ? buttonColor : textColor,
                //   size: 16,
                // ),
                suffixIcon: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: SvgPicture.asset(
                    'assets/icons/age-icon.svg',
                    width: 16,
                    color: textFieldAgeNode.hasFocus ? buttonColor : textColor,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: defaultPadding,
          ),
          Container(
            alignment: Alignment.center,
            width: 200,
            child: TextFormField(
              focusNode: textFieldWeightNode,
              // onChanged: (value) => print(textFieldNode.hasFocus),
              onTap: () => setState(() {}),
              onChanged: (value) {
                setState(() {
                  weight = value;
                });
              },
              decoration: InputDecoration(
                labelText: "Berat Badan",
                labelStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: textFieldWeightNode.hasFocus ? buttonColor : textColor,
                ),
                border: const OutlineInputBorder(),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: buttonColor),
                ),
                // suffixIcon: Icon(
                //   FontAwesomeIcons.weightScale,
                //   color: textFieldWeightNode.hasFocus ? buttonColor : textColor,
                //   size: 16,
                // ),
                suffixIcon: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: SvgPicture.asset(
                    'assets/icons/body-weight-icon.svg',
                    width: 16,
                    color:
                        textFieldWeightNode.hasFocus ? buttonColor : textColor,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: defaultPadding,
          ),
          Container(
            alignment: Alignment.center,
            width: 200,
            child: TextFormField(
              focusNode: textFieldHeightNode,
              // onChanged: (value) => print(textFieldNode.hasFocus),
              onTap: () => setState(() {}),
              onChanged: (value) {
                setState(() {
                  height = value;
                });
              },
              decoration: InputDecoration(
                labelText: "Tinggi Badan",
                labelStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: textFieldHeightNode.hasFocus ? buttonColor : textColor,
                ),
                border: const OutlineInputBorder(),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: buttonColor),
                ),
                // suffixIcon: Icon(
                //   FontAwesomeIcons.textHeight,
                //   color: textFieldHeightNode.hasFocus ? buttonColor : textColor,
                //   size: 16,
                // ),
                suffixIcon: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: SvgPicture.asset(
                    'assets/icons/measure-height-icon.svg',
                    width: 16,
                    color:
                        textFieldHeightNode.hasFocus ? buttonColor : textColor,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: defaultPadding,
          ),
          SizedBox(
            width: 200,
            child: DropdownButtonFormField2(
              onMenuStateChange: (isOpen) => setState(() {}),
              decoration: InputDecoration(
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: buttonColor),
                ),
                isDense: true,
                contentPadding: EdgeInsets.zero,
                border: const OutlineInputBorder(),
                suffixIcon: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: SvgPicture.asset(
                    'assets/icons/man-and-woman-user-icon.svg',
                    width: 16,
                  ),
                ),
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
              buttonPadding: const EdgeInsets.only(
                left: 10,
              ),
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
              // items: _addDividersAfterItems(genderItems),
              validator: (value) {
                if (value == null) {
                  return 'Please select gender.';
                }
              },
              onChanged: (value) {
                //Do something when changing the item if you want.
                gender = value.toString();
              },
              onSaved: (value) {
                selectedGenderValue = value.toString();
              },
            ),
          ),
          const SizedBox(
            height: defaultPadding,
          ),
          SizedBox(
            width: 200,
            child: DropdownButtonFormField2(
              onMenuStateChange: (isOpen) => setState(() {}),
              decoration: InputDecoration(
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: buttonColor),
                ),
                isDense: true,
                contentPadding: EdgeInsets.zero,
                border: const OutlineInputBorder(),
                suffixIcon: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: SvgPicture.asset(
                    'assets/icons/routine-icon.svg',
                    width: 16,
                  ),
                ),
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
              buttonPadding: const EdgeInsets.only(
                left: 10,
              ),
              dropdownDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
              items: activityItems
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
                  return 'Please Select Your Activity.';
                }
              },
              onChanged: (value) {
                //Do something when changing the item if you want.
                activity = value.toString();
              },
              onSaved: (value) {
                selectedActivityValue = value.toString();
              },
            ),
          ),
          const SizedBox(
            height: defaultPadding,
          ),
          SizedBox(
            width: 200,
            height: 45,
            child: TextButton(
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                  side: const BorderSide(color: buttonColor),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onPressed: () async {
                String? tempGender;
                double? tempActivity;

                if (gender == 'Perempuan') {
                  tempGender = "P";
                } else {
                  tempGender = "L";
                }

                switch (activity) {
                  case 'Istirahat':
                    tempActivity = 1.8;
                    break;
                  case 'Aktifitas Ringan': 
                    tempActivity = 3.5;
                    break;
                  case 'Aktifitas Sedang': 
                    tempActivity = 6.5;
                    break;
                  case 'Aktifitas Berat': 
                    tempActivity = 8;
                    break;
                  case 'Aktifitas Sangat Berat': 
                    tempActivity = 10;
                    break;
                  default:
                }

                final kalori = await fetchKalori(tempGender, int.parse(age!),
                    int.parse(weight!), int.parse(height!), tempActivity!);
                widget.calories(kalori);
              },
              child: const Text(
                "Hitung",
                style: TextStyle(
                    fontSize: 14,
                    color: textButtonColor,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
