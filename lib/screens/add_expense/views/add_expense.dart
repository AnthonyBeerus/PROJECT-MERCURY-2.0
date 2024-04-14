import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class AddExpense extends StatefulWidget {
  const AddExpense({super.key});

  @override
  State<AddExpense> createState() => _AddExpenseState();
}

class _AddExpenseState extends State<AddExpense> {
  TextEditingController expenseController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  DateTime selectedDate = DateTime.now();

  List<String> myCategoryIcons = [
    "entertainment",
    "food",
    "home",
    "pet",
    "shopping",
    "tech",
    "travel",
  ];



  @override
  void initState() {
    dateController.text = DateFormat('dd/MM/yyyy').format(DateTime.now());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.background,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Add Expenses',
                style: Theme.of(context).textTheme.displayMedium,
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.7,
                child: TextFormField(
                  controller: expenseController,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Theme.of(context).colorScheme.secondary,
                      prefixIcon: Icon(
                        FontAwesomeIcons.dollarSign,
                        size: 16,
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none)),
                ),
              ),
              const SizedBox(height: 64),
              TextFormField(
                readOnly: true,
                controller: categoryController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Theme.of(context).colorScheme.secondary,
                  prefixIcon: Icon(
                    FontAwesomeIcons.list,
                    size: 16,
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      //* Show a dialog box for creating a new category
                      showDialog(
                        context: context,
                        builder: (ctx) {
                          bool isExpanded = false;
                          String iconSelected = '';
                          Color categoryColor = Theme.of(context).colorScheme.secondary;
                          return StatefulBuilder(builder: (context, setState) {
                            return AlertDialog(
                                backgroundColor:
                                    Theme.of(context).colorScheme.background,
                                elevation: 0,
                                content: SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        'Add Category',
                                        style: Theme.of(context)
                                            .textTheme
                                            .displaySmall,
                                      ),
                                      const SizedBox(height: 16),
                                      TextFormField(
                                        decoration: InputDecoration(
                                          hintText: 'Category Name',
                                          isDense: true,
                                          filled: true,
                                          fillColor: Theme.of(context)
                                              .colorScheme
                                              .secondary,
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              borderSide: BorderSide.none),
                                        ),
                                      ),
                                      const SizedBox(height: 16),
                                      //* Select Icon
                                      TextFormField(
                                        onTap: () {
                                          setState(() {
                                            isExpanded = !isExpanded;
                                          });
                                        },
                                        readOnly: true,
                                        decoration: InputDecoration(
                                            hintText: 'Select Icon',
                                            isDense: true,
                                            filled: true,
                                            fillColor: Theme.of(context)
                                                .colorScheme
                                                .secondary,
                                            border: OutlineInputBorder(
                                                borderRadius: isExpanded
                                                    ? const BorderRadius
                                                        .vertical(
                                                        top:
                                                            Radius.circular(12))
                                                    : BorderRadius.circular(12),
                                                borderSide: BorderSide.none),
                                            suffixIcon: const Icon(
                                                FontAwesomeIcons.chevronDown,
                                                size: 16)),
                                      ),
                                      isExpanded
                                          ? AnimatedContainer(
                                              duration: const Duration(
                                                  milliseconds: 5000),
                                              curve: Curves.bounceIn,
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              height: 200,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    const BorderRadius.vertical(
                                                  bottom: Radius.circular(12),
                                                ),
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .secondary,
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(16.0),
                                                child: GridView.builder(
                                                    gridDelegate:
                                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                                      crossAxisCount: 3,
                                                      mainAxisSpacing: 10,
                                                      crossAxisSpacing: 10,
                                                    ),
                                                    itemCount:
                                                        myCategoryIcons.length,
                                                    itemBuilder:
                                                        (context, int i) {
                                                      return GestureDetector(
                                                        onTap: () {
                                                          setState(() {
                                                            iconSelected =
                                                                myCategoryIcons[
                                                                    i];
                                                          });
                                                        },
                                                        child: Container(
                                                          height: 50,
                                                          width: 50,
                                                          decoration:
                                                              BoxDecoration(
                                                            border: Border.all(
                                                                width: 3,
                                                                color: iconSelected ==
                                                                        myCategoryIcons[
                                                                            i]
                                                                    ? Theme.of(
                                                                            context)
                                                                        .colorScheme
                                                                        .primary
                                                                    : Theme.of(
                                                                            context)
                                                                        .colorScheme
                                                                        .tertiary),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12),
                                                            image:
                                                                DecorationImage(
                                                              image: AssetImage(
                                                                'assets/${myCategoryIcons[i]}.png',
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    }),
                                              ),
                                            )
                                          : Container(),
                                      const SizedBox(height: 16),
                                      TextFormField(
                                        readOnly: true,
                                        onTap: () {
                                          showDialog(
                                            context: context,
                                            builder: (ctx2) {
                                              return AlertDialog(
                                                backgroundColor:
                                                    Theme.of(context)
                                                        .colorScheme
                                                        .background,
                                                elevation: 0,
                                                content: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    ColorPicker(
                                                      pickerColor:Theme.of(context)
                                                        .colorScheme
                                                        .background,
                                                      onColorChanged:(value) {
                                                        setState(() {
                                                          categoryColor = value;
                                                        });
                                                      }
                                                    ),
                                                    SizedBox(
                                                      width: double.infinity,
                                                      child: TextButton(
                                                        onPressed: () {
                                                          Navigator.pop(ctx2);
                                                        },
                                                        style: TextButton
                                                            .styleFrom(
                                                          backgroundColor:
                                                              Theme.of(context)
                                                                  .colorScheme
                                                                  .primary,
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12.0),
                                                            side:
                                                                BorderSide.none,
                                                          ),
                                                        ),
                                                        child: Text(
                                                          'save',
                                                          style:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .labelSmall,
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              );
                                            },
                                          );
                                        },
                                        decoration: InputDecoration(
                                          isDense: true,
                                          filled: true,
                                          fillColor: categoryColor,
                                          hintText: 'Color',
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              borderSide: BorderSide.none),
                                        ),
                                      ),
                                    ],
                                  ),
                                ));
                          });
                        },
                      );
                    },
                    icon: Icon(
                      FontAwesomeIcons.plus,
                      size: 16,
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
                  hintText: 'Category',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none),
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: dateController,
                readOnly: true,
                onTap: () async {
                  DateTime? newDate = await showDatePicker(
                    context: context,
                    initialDate: selectedDate,
                    firstDate: DateTime.now(),
                    lastDate: DateTime.now().add(const Duration(days: 365)),
                  );

                  if (newDate != null) {
                    dateController.text =
                        DateFormat('dd/MM/yyyy').format(newDate);
                    selectedDate = newDate;
                  }
                },
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Theme.of(context).colorScheme.secondary,
                  prefixIcon: Icon(
                    FontAwesomeIcons.calendar,
                    size: 16,
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none),
                ),
              ),
              const SizedBox(height: 32),
              SizedBox(
                  width: double.infinity,
                  height: kToolbarHeight,
                  child: TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        side: BorderSide.none,
                      ),
                    ),
                    child: Text(
                      'save',
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
