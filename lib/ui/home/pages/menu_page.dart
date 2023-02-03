import 'dart:convert';
import 'package:classroom/models/menu.dart';
import 'package:classroom/states/auth/auth_bloc.dart';
import 'package:classroom/ui/home/widgets/segmented_selector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class FoodMenuPage extends StatefulWidget {
  const FoodMenuPage({super.key});

  @override
  _FoodMenuPageState createState() => _FoodMenuPageState();
}

// Widget to show food image.
class FoodImage extends StatelessWidget {
  const FoodImage({super.key, required this.img});

  final String img;

  Widget build(BuildContext context) {
    if (img != "null") {
      return ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: Image.network(
          img,
        ),
      );
    } else {
      return Row(
        children: [
          Icon(Icons.fastfood),
          SizedBox(width: 10),
          Text(
            "No image",
            style: TextStyle(
              color: Colors.white,
              fontStyle: FontStyle.italic,
            ),
          ),
        ],
      );
    }
  }
}

class _FoodMenuPageState extends State<FoodMenuPage> {
  // TextController
  TextEditingController controller = TextEditingController();

  late Future<FoodModel> _menu; // List of food in menu (lunch / breakfast)
  late String school = "grayson-high"; // Variable to hold user's school.
  String currentOption = "Breakfast"; // Current menu option.
  DateTime currentDate = DateTime.now(); // Current date.

  // List of menu options.
  final List<MenuOptionsModel> options = [
    MenuOptionsModel(
        key: "Breakfast", value: "Breakfast", icon: Icons.free_breakfast),
    MenuOptionsModel(key: "Lunch", value: "Lunch", icon: Icons.dining_rounded),
  ];

  // Function to fetch menu based on school, type, and date.
  Future<FoodModel> fetchMenu(String school, String type, String date) async {
    var url =
        "https://gwinnett.nutrislice.com/menu/api/digest/school/$school/menu-type/$type/date/$date";
    var result = await http.get(Uri.parse(url));

    var items = FoodModel();

    if (result.statusCode == 200) {
      var menu = json.decode(result.body);
      items = FoodModel.fromJson(menu);
    }
    return items;
  }

  // Function to allow user to pick any date.
  Future<void> selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: currentDate,
        firstDate: DateTime(2015),
        lastDate: DateTime(2050));
    if (pickedDate != null && pickedDate != currentDate) {
      setState(() {
        currentDate = pickedDate; // Set picked date to current date variable.
      });
      // Set menu to result of new date.
      _menu = fetchMenu(
          school, currentOption.toLowerCase(), convertDate(currentDate));
    }
  }

  // Function to convert date for API.
  String convertDate(DateTime date) {
    String year, month, day;
    year = date.year.toString();
    month = date.month.toString();
    day = date.day.toString();
    return "$year/$month/$day";
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _menu = fetchMenu(
        school, currentOption.toLowerCase(), convertDate(currentDate));
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: Colors.black,
            body: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                  Colors.transparent,
                                ),
                              ),
                              child: const Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              "Food Menu".toUpperCase(),
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 2),
                      ],
                    ),
                  ],
                ),
                // If it's a weekend then tell the user there is no school.
                if (currentDate.weekday == DateTime.saturday ||
                    currentDate.weekday == DateTime.sunday)
                  Container(
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("No school."),
                          ElevatedButton(
                            onPressed: () => selectDate(context),
                            child: Text('Select date'),
                          )
                        ],
                      ),
                    ),
                  )
                else
                  // Show list of food from menu variable.
                  Flexible(
                    child: FutureBuilder<FoodModel>(
                      future: _menu,
                      builder: (context, snapshot) {
                        if (snapshot.data == null) {
                          // If waiting for data then show the user.
                          return Container(
                            child: Center(
                              child: Text(
                                "Loading...",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          );
                        } else {
                          return Column(
                            children: [
                              // Show the user's school and date.
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      new DateFormat("E MMM d")
                                              .format(currentDate) +
                                          " at " +
                                          (school),
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    SegmentedSelector(
                                      selectedOption: currentOption,
                                      menuOptions: options,
                                      onValueChanged: (value) {
                                        setState(() {
                                          currentOption = value;
                                        });
                                      },
                                    ),
                                    // Button to pick a custom date.
                                    IconButton(
                                        onPressed: () => selectDate(context),
                                        icon: Icon(Icons.date_range))
                                  ]),
                              // List of items.
                              Flexible(
                                child: ListView.builder(
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.all(14),
                                      child: Card(
                                        child: Padding(
                                          padding: const EdgeInsets.all(18),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                snapshot
                                                    .data!.menuItems![index],
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 22,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              FoodImage(
                                                img: snapshot
                                                    .data!.images![index]
                                                    .toString(),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                  itemCount: snapshot.data!.menuItems!.length,
                                ),
                              ),
                            ],
                          );
                        }
                      },
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
