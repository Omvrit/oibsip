import 'package:flutter/material.dart';
import 'package:unitconverter.dart/store.dart';
import 'package:velocity_x/velocity_x.dart';



class UnitConverter extends StatelessWidget {
  UnitConverterStore unitConverterStore = VxState.store as UnitConverterStore;
  late double toBeConverted = 0;
  late double afterConverted = 0;
  Unit? selectedUnit;
  double convertUnit(Unit fromUnit, double value, Unit toUnit) {

    const conversionMap = {
      Unit.kg: {
        Unit.g: 1000,
      },

      Unit.g: {
        Unit.kg: 0.001,
      },
      Unit.m: {
        Unit.km: 0.001,
        Unit.cm: 100,
        Unit.mm: 1000,
      },
      Unit.km: {
        Unit.m: 1000,
        Unit.cm: 100000,
        Unit.mm: 1000000,
      },
      Unit.cm: {
        Unit.m: 0.01,
        Unit.km: 0.00001,
        Unit.mm: 10,
      },
      Unit.mm: {
        Unit.m: 0.001,
        Unit.km: 0.000001,
        Unit.cm: 0.1,
      }
    };


    if (fromUnit == toUnit) {
      return value;
    }


    if (conversionMap.containsKey(fromUnit) && conversionMap[fromUnit]!.containsKey(toUnit)) {
      return value * conversionMap[fromUnit]![toUnit]!;
    } else {
      throw ArgumentError('Cannot convert from $fromUnit to $toUnit. Incompatible units.');
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: "Unit Converter".text.make(),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 30),
          // DropdownButton for selecting the unit
          VxBuilder(
            builder: (context, store, status) =>

             DropdownButton<Unit>(
              hint: const Text("Select Unit"),
              value: unitConverterStore.unitTobeConverted,
              items: Units.li.map((Unit unit) {
                return DropdownMenuItem<Unit>(
                  value: unit,
                  child: Text(unit.name.toUpperCase()),
                );
              }).toList(),
              onChanged: (Unit? value) {
                print("printing $value");
                selectedUnit = value;
                ChangeUnitToBeConverted(value!);
                },
            ), mutations: const {ChangeUnitToBeConverted},
          ),
          VxBuilder(
            builder: (BuildContext context, store, VxStatus? status) => Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                onChanged: (value) {

                  toBeConverted = double.tryParse(value) ?? 0;

                  ChangeToBeConverted(toBeConverted);
                },

                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  label: "To Be Converted".text.make(),
                  hintText: "Enter a number",
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  disabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black54)),
                  enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                ),
              ),
            ),
            mutations: const {ChangeToBeConverted},
          ),
          const SizedBox(height: 30),
          VxBuilder(
            builder: (context, store, status) =>

                DropdownButton<Unit>(
                  hint: const Text("Select Unit"),
                  value: unitConverterStore.unitAfterConverted,
                  items: Units.li.map((Unit unit) {
                    return DropdownMenuItem<Unit>(
                      value: unit,
                      child: Text(unit.name.toUpperCase()),
                    );
                  }).toList(),
                  onChanged: (Unit? value) {
                    print("printing $value");
                    selectedUnit = value;
                    ChangeUnitAfterConverted(value!);
                  },
                ), mutations: const {ChangeUnitToBeConverted},
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: VxBuilder(
              mutations: const {ChangeAfterConverted},
              builder:(context, store, status) =>
                    Container(
                      width:300,
                        height: 40,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 1.0), // Border size and color
                          borderRadius: BorderRadius.circular(8.0), // Rounded corners
                        ),
                        child: Text("${unitConverterStore.afterConverted}",style: const TextStyle(color: Colors.black,fontSize: 20),)),
                  )
            ),

          ElevatedButton(onPressed: (){
            var a = convertUnit(unitConverterStore.unitTobeConverted, unitConverterStore.tobeConverted,unitConverterStore.unitAfterConverted);
            print(a);
                ChangeAfterConverted(a);
          }, child: const Text("Convert"))
        ],
      ),
    );
  }
}

// Helper function to capitalize unit names
// extension StringExtension on String {
//   String capitalize() {
//     return "${this[0].toUpperCase()}${substring(1)}";
//   }
// }
