import 'package:flutter/material.dart';
import 'package:unitconverter.dart/store.dart';
// import 'package:unitconverter/store.dart';
import 'package:velocity_x/velocity_x.dart';

class UnitConverter extends StatelessWidget {
  UnitConverterStore unitConverterStore = VxState.store as UnitConverterStore;
  late double toBeConverted = 0;
  late double afterConverted = 0;
  Unit? selectedUnit;

  double convertUnit(Unit fromUnit, double value, Unit toUnit) {
    const conversionMap = {
      Unit.kg: {Unit.g: 1000},
      Unit.g: {Unit.kg: 0.001},
      Unit.m: {Unit.km: 0.001, Unit.cm: 100, Unit.mm: 1000},
      Unit.km: {Unit.m: 1000, Unit.cm: 100000, Unit.mm: 1000000},
      Unit.cm: {Unit.m: 0.01, Unit.km: 0.00001, Unit.mm: 10},
      Unit.mm: {Unit.m: 0.001, Unit.km: 0.000001, Unit.cm: 0.1},
    };

    if (fromUnit == toUnit) return value;
    if (conversionMap.containsKey(fromUnit) &&
        conversionMap[fromUnit]!.containsKey(toUnit)) {
      return value * conversionMap[fromUnit]![toUnit]!;
    } else {
      throw ArgumentError('Cannot convert from $fromUnit to $toUnit.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: "Unit Converter".text.make(),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            VxBuilder(
              builder: (context, store, status) => DropdownButtonFormField<Unit>(
                decoration: const InputDecoration(
                  labelText: "Select Unit to Convert From",
                  border: OutlineInputBorder(),
                ),
                value: unitConverterStore.unitTobeConverted,
                items: Units.li.map((Unit unit) {
                  return DropdownMenuItem<Unit>(
                    value: unit,
                    child: Text(unit.name.toUpperCase()),
                  );
                }).toList(),
                onChanged: (Unit? value) {
                  selectedUnit = value;
                  ChangeUnitToBeConverted(value!);
                },
              ),
              mutations: const {ChangeUnitToBeConverted},
            ),
            const SizedBox(height: 16),
            VxBuilder(
              builder: (BuildContext context, store, VxStatus? status) =>
                  TextFormField(
                    onChanged: (value) {
                      toBeConverted = double.tryParse(value) ?? 0;
                      ChangeToBeConverted(toBeConverted);
                    },
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: "Enter Value to Convert",
                      hintText: "Enter a number",
                      border: OutlineInputBorder(),
                    ),
                  ),
              mutations: const {ChangeToBeConverted},
            ),
            const SizedBox(height: 16),
            VxBuilder(
              builder: (context, store, status) => DropdownButtonFormField<Unit>(
                decoration: const InputDecoration(
                  labelText: "Select Unit to Convert To",
                  border: OutlineInputBorder(),
                ),
                value: unitConverterStore.unitAfterConverted,
                items: Units.li.map((Unit unit) {
                  return DropdownMenuItem<Unit>(
                    value: unit,
                    child: Text(unit.name.toUpperCase()),
                  );
                }).toList(),
                onChanged: (Unit? value) {
                  selectedUnit = value;
                  ChangeUnitAfterConverted(value!);
                },
              ),
              mutations: const {ChangeUnitToBeConverted},
            ),
            const SizedBox(height: 16),
            VxBuilder(
              mutations: const {ChangeAfterConverted},
              builder: (context, store, status) => Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  border: Border.all(color: Colors.black, width: 1.0),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Text(
                  "Converted Value: ${unitConverterStore.afterConverted}",
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                var result = convertUnit(
                    unitConverterStore.unitTobeConverted,
                    unitConverterStore.tobeConverted,
                    unitConverterStore.unitAfterConverted);
                ChangeAfterConverted(result);
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 12),
                textStyle: const TextStyle(fontSize: 16),
              ),
              child: const Text("Convert"),
            ),
          ],
        ),
      ),
    );
  }
}
