import 'package:flutter/material.dart';

class DiabetesType2 extends StatefulWidget {
  static final String id = 'diabetestype2';
  @override
  _DiabetesType2State createState() => _DiabetesType2State();
}

class _DiabetesType2State extends State<DiabetesType2> {
  String snacks =
      "• Nuts \n• Fruit \n• Hummus and vegetables \n• String cheese \n• Beef jerky \n• Olives \n• Dark chocolate \n• Kale chips \n• Apples and peanut butter \n• Steamed edamame \n• Sardines";
  String dinner =
      "• Lasagna and salad \n• Roast chicken and vegetables, with or without potatoes \n• Beef stir-fry and vegetables, with or without brown rice \n• Chicken tortillas and salad \n• Salmon and vegetables, with or without noodles \n• Curry with chickpeas and brown rice";
  String lunch =
      "• A chicken or tuna salad sandwich \n• A small pasta salad \n• Soup with or without a wholegrain roll \n• A piece of salmon or tuna steak and salad.";
  String Breakfast =
      "\• A bowl of wholegrain cereal with milk \n\• Two slices of wholegrain toast with olive oil-based spread \n\• A pot of natural unsweetened yogurt and fruit \n\• Two slices of avocado with a hardboiled egg. \n\• Low-sodium cottage cheese";
  String recommended =
      "The range of calories per day for type 2 diabetic is 1500-1800 cal.( 50% of these calories from carbohydrates. This would be a total of 800 calories of carbohydrates (at 4 calories per gram) spread out over the day.)";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text('Diabetes Type 2'),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Diabetes type 2:',
                  style: TextStyle(fontSize: 30, color: Colors.blueAccent),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Patients with type 2 diabetes make insulin, but the cells in the body cannot respond to it adequately so they cannot take up glucose.',
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Symptoms:',
                  style: TextStyle(fontSize: 25, color: Colors.blueAccent),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "• Increased thirst \n• Frequent urination \n• Increased hunger \n• Unintended weight loss \n• Fatigue \n• Blurred vision \n• Slow-healing sores \n• Frequent infections \n• Areas of darkened skin, usually in the armpits and neck",
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Recommended health diet:',
                  style: TextStyle(fontSize: 30, color: Colors.blueAccent),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  recommended,
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                width: double.infinity,
                child: DataTable(
                  columns: [
                    DataColumn(label: Text("Food")),
                    DataColumn(label: Text("Amount")),
                    DataColumn(label: Text("Carb Grams")),
                  ],
                  rows: [
                    DataRow(
                      cells: [
                        DataCell(Text('1 % fat milk')),
                        DataCell(Text('1 cup')),
                        DataCell(Text('12')),
                      ],
                    ),
                    DataRow(
                      cells: [
                        DataCell(Text('Bran Chex')),
                        DataCell(Text('2/3 cup')),
                        DataCell(Text('23')),
                      ],
                    ),
                    DataRow(
                      cells: [
                        DataCell(Text('Frosted Flakes')),
                        DataCell(Text('3/4 cup')),
                        DataCell(Text('26')),
                      ],
                    ),
                    DataRow(
                      cells: [
                        DataCell(Text('Fruit juice')),
                        DataCell(Text('1/2 cup')),
                        DataCell(Text('15')),
                      ],
                    ),
                    DataRow(
                      cells: [
                        DataCell(Text('Banana')),
                        DataCell(Text('1/2')),
                        DataCell(Text('15')),
                      ],
                    ),
                    DataRow(
                      cells: [
                        DataCell(Text('Pancake syrup')),
                        DataCell(Text('2 Tbsp.')),
                        DataCell(Text('30')),
                      ],
                    ),
                    DataRow(
                      cells: [
                        DataCell(Text('Low-fat granola')),
                        DataCell(Text('1/2 cup')),
                        DataCell(Text('30')),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Breakfast:',
                  style: TextStyle(fontSize: 25, color: Colors.blueAccent),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  Breakfast,
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Lunch:',
                  style: TextStyle(fontSize: 25, color: Colors.blueAccent),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  lunch,
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Dinner:',
                  style: TextStyle(fontSize: 25, color: Colors.blueAccent),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  dinner,
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Snacks:',
                  style: TextStyle(fontSize: 25, color: Colors.blueAccent),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  snacks,
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
              ),
              SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
