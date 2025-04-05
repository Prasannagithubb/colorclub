import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_one/Constant/Screen.dart';
import 'package:new_one/Controller/LanguageControllers/languagecontroller.dart';
import 'package:new_one/Controller/MyTransactionCtrlr.dart';
import 'package:new_one/generated/l10n.dart';
import 'package:provider/provider.dart';

class TransactionScreen extends StatefulWidget {
  const TransactionScreen({super.key});

  @override
  State<TransactionScreen> createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  @override
  // List<Map<String, dynamic>> transactions = [
  //   {
  //     "date": "Dar ES Salaa,, +255 654 123 456",
  //     "type": "Purchase",
  //     "amount": "12-03-2025",
  //     "details": "Tanzania Paints Ltd.,",
  //     "site": "www.coral.com",
  //   },
  //   {
  //     "date": "Dar ES Salaa,, +255 654 123 456",
  //     "type": "Purchase",
  //     "amount": "12-03-2025",
  //     "details": "Tanzania Paints Ltd.,",
  //     "site": "www.coral.com",
  //   },
  //   {
  //     "date": "Dar ES Salaa,, +255 654 123 456",
  //     "type": "Purchase",
  //     "amount": "12-03-2025",
  //     "details": "Tanzania Paints Ltd.,",
  //     "site": "www.coral.com",
  //   },
  //   {
  //     "date": "Dar ES Salaa,, +255 654 123 456",
  //     "type": "Purchase",
  //     "amount": "12-03-2025",
  //     "details": "Tanzania Paints Ltd.,",
  //     "site": "www.coral.com",
  //   },
  //   {
  //     "date": "Dar ES Salaa,, +255 654 123 456",
  //     "type": "Purchase",
  //     "amount": "12-03-2025",
  //     "details": "Tanzania Paints Ltd.,",
  //     "site": "www.coral.com",
  //   },
  //   {
  //     "date": "Dar ES Salaa,, +255 654 123 456",
  //     "type": "Purchase",
  //     "amount": "12-03-2025",
  //     "details": "Tanzania Paints Ltd.,",
  //     "site": "www.coral.com",
  //   },
  //   {
  //     "date": "Dar ES Salaa,, +255 654 123 456",
  //     "type": "Purchase",
  //     "amount": "12-03-2025",
  //     "details": "Tanzania Paints Ltd.,",
  //     "site": "www.coral.com",
  //   },
  //   {
  //     "date": "Dar ES Salaa,, +255 654 123 456",
  //     "type": "Purchase",
  //     "amount": "12-03-2025",
  //     "details": "Tanzania Paints Ltd.,",
  //     "site": "www.coral.com",
  //   },
  //   {
  //     "date": "Dar ES Salaa,, +255 654 123 456",
  //     "type": "Purchase",
  //     "amount": "12-03-2025",
  //     "details": "Tanzania Paints Ltd.,",
  //     "site": "www.coral.com",
  //   },
  //   {
  //     "date": "Dar ES Salaa,, +255 654 123 456",
  //     "type": "Purchase",
  //     "amount": "12-03-2025",
  //     "details": "Tanzania Paints Ltd.,",
  //     "site": "www.coral.com",
  //   },
  //   {
  //     "date": "Dar ES Salaa,, +255 654 123 456",
  //     "type": "Purchase",
  //     "amount": "12-03-2025",
  //     "details": "Tanzania Paints Ltd.,",
  //     "site": "www.coral.com",
  //   },
  // ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<MyTransactionCtrl>().init();
      context.read<MyTransactionCtrl>().selectedname =
          context.read<MyTransactionCtrl>().selectednameList[0].toString();
    });
  }

  Future<void> _selecteddate(String dateType) async {
    DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2100));
    if (picked != null) {
      if (dateType == 'From') {
        context.read<MyTransactionCtrl>().datecontroller.text =
            picked.toString();
        context.read<MyTransactionCtrl>().datecontroller.text = context
            .read<MyTransactionCtrl>()
            .config
            .alignDate(context.read<MyTransactionCtrl>().datecontroller.text);
      } else if (dateType == 'To') {
        context.read<MyTransactionCtrl>().todatecontroller.text =
            picked.toString();
        context.read<MyTransactionCtrl>().todatecontroller.text = context
            .read<MyTransactionCtrl>()
            .config
            .alignDate(context.read<MyTransactionCtrl>().todatecontroller.text);
      }
      setState(() {});
    }
  }

  // List<dummydata> dummlist = [];
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    var groupvalue = context.read<Languagecontroller>().locale.languageCode;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: Container(
        padding: const EdgeInsets.only(bottom: 30),
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 1, 53, 143),
        ),
        height: Screens.fullHeight(context),
        child: Container(
          padding: const EdgeInsets.only(top: 30),
          decoration: const BoxDecoration(
              color: Color.fromARGB(255, 212, 14, 0),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20))),
          child: Container(
            height: Screens.fullHeight(context) * 0.9,
            width: Screens.width(context),
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: Screens.padingHeight(context) * 0.01,
                // horizontal: Screens.width(context) * 0.05,
              ),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: Screens.width(context) * 0.05,
                    ),
                    // color: Colors.amber,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: Screens.bodyheight(context) * 0.01,
                        ),
                        Image.asset(
                          'assets/Img1.png',
                          height: 120,
                          width: 90,
                        ),
                        Image.asset(
                          'assets/CoralLogo_Outline.png',
                          height: 100,
                        ),
                        Image.asset(
                          'assets/Img2.png',
                          height: 120,
                          width: 90,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: Screens.fullHeight(context) * 0.01,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: Screens.padingHeight(context) * 0.00),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Text(
                        //   S.current.searchbydate,
                        //   style: TextStyle(
                        //       fontSize: 16,
                        //       fontWeight: FontWeight.bold,
                        //       color: Color.fromARGB(255, 95, 95, 95)),
                        // ),
                        SizedBox(
                          width: Screens.width(context) * 0.02,
                        ),
                        DropdownMenu<String>(
                            initialSelection:
                                context.read<MyTransactionCtrl>().selectedname,
                            onSelected: (String? value) {
                              setState(() {
                                context.read<MyTransactionCtrl>().selectedname =
                                    value;
                                context
                                    .read<MyTransactionCtrl>()
                                    .datecontroller
                                    .text = "";
                                context
                                    .read<MyTransactionCtrl>()
                                    .todatecontroller
                                    .text = "";
                                value;
                                context.read<MyTransactionCtrl>().transdata =
                                    [];
                              });
                            },
                            dropdownMenuEntries: context
                                .read<MyTransactionCtrl>()
                                .selectednameList
                                .map((location) {
                              return DropdownMenuEntry<String>(
                                value: location,
                                label: location,
                              );
                            }).toList()),

                        // DropdownButton(
                        //   iconEnabledColor:
                        //       const Color.fromARGB(255, 5, 52, 153),
                        //   iconSize: 30,
                        //   // hint: Text(
                        //   //     'Search by Date'), // Not necessary for Option 1
                        //   value: selectedname,
                        //   onChanged: (newValue) {
                        //     setState(() {
                        //       selectedname = newValue!;

                        //       datecontroller.text = "";
                        //       todatecontroller.text = "";
                        //     });
                        //   },
                        //   dropdownColor: Colors.lightBlue,
                        //   items: _selectedname.map((location) {
                        //     return DropdownMenuItem(
                        //       value: location,
                        //       child: Text(location),
                        //     );
                        //   }).toList(),
                        // ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: Screens.fullHeight(context) * 0.02,
                  ),
                  Container(
                    height: Screens.fullHeight(context) * 0.075,
                    width: Screens.width(context),
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: const Color.fromARGB(255, 228, 228, 228),
                          width: 0.5),
                      color: const Color.fromARGB(255, 248, 248, 248),
                    ),
                    child: context.read<MyTransactionCtrl>().selectedname ==
                            "Date"
                        ? Row(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        S.current.fromdate,
                                        style: GoogleFonts.openSans(
                                          color: const Color.fromARGB(
                                              255, 95, 95, 95),
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        //   style: TextStyle(
                                        //       color: Color.fromARGB(255, 95, 95, 95),
                                        //       fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        width: Screens.width(context) * 0.01,
                                      ),
                                      Container(
                                        height:
                                            Screens.fullHeight(context) * 0.04,
                                        width: Screens.width(context) * 0.3,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: const Color.fromARGB(
                                                    255, 92, 92, 92)),
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(6)),
                                            color: const Color.fromARGB(
                                                255, 255, 255, 255)),
                                        child: TextFormField(
                                          controller: context
                                              .read<MyTransactionCtrl>()
                                              .datecontroller,
                                          decoration: InputDecoration(
                                            suffixIcon: const Icon(
                                              Icons.date_range,
                                              size: 20,
                                            ),

                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                    vertical:
                                                        Screens.padingHeight(
                                                                context) *
                                                            0.0,
                                                    horizontal:
                                                        Screens.width(context) *
                                                            0.02),
                                            focusedBorder:
                                                const OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                10)),
                                                    borderSide:
                                                        BorderSide.none),
                                            enabledBorder: const OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10)),
                                                borderSide: BorderSide
                                                    .none), // hoverColor: Colors.red,
                                            border: InputBorder.none,

                                            filled: true,
                                            fillColor: const Color.fromARGB(
                                                255, 255, 255, 255),
                                          ),
                                          readOnly: true,
                                          onTap: () {
                                            _selecteddate('From');
                                          },
                                        ),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        S.current.todate,
                                        style: GoogleFonts.openSans(
                                          color: const Color.fromARGB(
                                              255, 95, 95, 95),
                                          // fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        //   style: TextStyle(
                                        //       color: Color.fromARGB(255, 95, 95, 95),
                                        //       fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        width: Screens.width(context) * 0.01,
                                      ),
                                      Container(
                                        height:
                                            Screens.fullHeight(context) * 0.04,
                                        width: Screens.width(context) * 0.3,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: const Color.fromARGB(
                                                    255, 92, 92, 92)),
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(6)),
                                            color: const Color.fromARGB(
                                                255, 255, 255, 255)),
                                        child: TextFormField(
                                          readOnly: true,
                                          controller: context
                                              .read<MyTransactionCtrl>()
                                              .todatecontroller,
                                          onTap: () {
                                            _selecteddate('To');
                                          },
                                          decoration: InputDecoration(
                                            suffixIcon: const Icon(
                                              Icons.date_range,
                                              size: 20,
                                            ),

                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                    vertical:
                                                        Screens.padingHeight(
                                                                context) *
                                                            0.0,
                                                    horizontal:
                                                        Screens.width(context) *
                                                            0.02),
                                            focusedBorder:
                                                const OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                10)),
                                                    borderSide:
                                                        BorderSide.none),
                                            enabledBorder: const OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10)),
                                                borderSide: BorderSide
                                                    .none), // hoverColor: Colors.red,
                                            border: InputBorder.none,

                                            filled: true,
                                            fillColor: const Color.fromARGB(
                                                255, 255, 255, 255),
                                          ),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ],
                          )
                        : context.read<MyTransactionCtrl>().selectedname ==
                                "Points"
                            ? Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        "Min",
                                        style: GoogleFonts.openSans(
                                          color: const Color.fromARGB(
                                              255, 95, 95, 95),
                                          // fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        // style: TextStyle(
                                        //     color:
                                        //         Color.fromARGB(255, 95, 95, 95),
                                        //     fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        width: Screens.width(context) * 0.01,
                                      ),
                                      Container(
                                        height:
                                            Screens.fullHeight(context) * 0.04,
                                        width: Screens.width(context) * 0.3,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: const Color.fromARGB(
                                                    255, 92, 92, 92)),
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(6)),
                                            color: const Color.fromARGB(
                                                255, 255, 255, 255)),
                                        child: TextFormField(
                                          controller: context
                                              .read<MyTransactionCtrl>()
                                              .datecontroller,
                                          decoration: InputDecoration(
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                    vertical:
                                                        Screens.padingHeight(
                                                                context) *
                                                            0.0,
                                                    horizontal:
                                                        Screens.width(context) *
                                                            0.02),
                                            focusedBorder:
                                                const OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                10)),
                                                    borderSide:
                                                        BorderSide.none),
                                            enabledBorder: const OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10)),
                                                borderSide: BorderSide
                                                    .none), // hoverColor: Colors.red,
                                            border: InputBorder.none,

                                            filled: true,
                                            fillColor: const Color.fromARGB(
                                                255, 255, 255, 255),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "max",
                                        style: GoogleFonts.openSans(
                                          color: const Color.fromARGB(
                                              255, 95, 95, 95),
                                          // fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        // style: TextStyle(
                                        //     color:
                                        //         Color.fromARGB(255, 95, 95, 95),
                                        //     fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        width: Screens.width(context) * 0.01,
                                      ),
                                      Container(
                                        height:
                                            Screens.fullHeight(context) * 0.04,
                                        width: Screens.width(context) * 0.3,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: const Color.fromARGB(
                                                    255, 92, 92, 92)),
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(6)),
                                            color: const Color.fromARGB(
                                                255, 255, 255, 255)),
                                        child: TextFormField(
                                          controller: context
                                              .read<MyTransactionCtrl>()
                                              .todatecontroller,
                                          decoration: InputDecoration(
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                    vertical:
                                                        Screens.padingHeight(
                                                                context) *
                                                            0.0,
                                                    horizontal:
                                                        Screens.width(context) *
                                                            0.02),
                                            focusedBorder:
                                                const OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                10)),
                                                    borderSide:
                                                        BorderSide.none),
                                            enabledBorder: const OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10)),
                                                borderSide: BorderSide
                                                    .none), // hoverColor: Colors.red,
                                            border: InputBorder.none,

                                            filled: true,
                                            fillColor: const Color.fromARGB(
                                                255, 255, 255, 255),
                                          ),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              )
                            : context.read<MyTransactionCtrl>().selectedname ==
                                    "Amount"
                                ? Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text(
                                            "Min",
                                            style: GoogleFonts.openSans(
                                              color: const Color.fromARGB(
                                                  255, 95, 95, 95),
                                              // fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            // style: TextStyle(
                                            //     color:
                                            //         Color.fromARGB(255, 95, 95, 95),
                                            //     fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            width:
                                                Screens.width(context) * 0.01,
                                          ),
                                          Container(
                                            height:
                                                Screens.fullHeight(context) *
                                                    0.04,
                                            width: Screens.width(context) * 0.3,
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: const Color.fromARGB(
                                                        255, 92, 92, 92)),
                                                borderRadius:
                                                    const BorderRadius.all(
                                                        Radius.circular(6)),
                                                color: const Color.fromARGB(
                                                    255, 255, 255, 255)),
                                            child: TextFormField(
                                              controller: context
                                                  .read<MyTransactionCtrl>()
                                                  .datecontroller,
                                              decoration: InputDecoration(
                                                contentPadding:
                                                    EdgeInsets.symmetric(
                                                        vertical: Screens
                                                                .padingHeight(
                                                                    context) *
                                                            0.0,
                                                        horizontal:
                                                            Screens.width(
                                                                    context) *
                                                                0.02),
                                                focusedBorder:
                                                    const OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    10)),
                                                        borderSide:
                                                            BorderSide.none),
                                                enabledBorder:
                                                    const OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    10)),
                                                        borderSide: BorderSide
                                                            .none), // hoverColor: Colors.red,
                                                border: InputBorder.none,

                                                filled: true,
                                                fillColor: const Color.fromARGB(
                                                    255, 255, 255, 255),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "Max",
                                            style: GoogleFonts.openSans(
                                              color: const Color.fromARGB(
                                                  255, 95, 95, 95),
                                              // fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            // style: TextStyle(
                                            //     color:
                                            //         Color.fromARGB(255, 95, 95, 95),
                                            //     fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            width:
                                                Screens.width(context) * 0.01,
                                          ),
                                          Container(
                                            height:
                                                Screens.fullHeight(context) *
                                                    0.04,
                                            width: Screens.width(context) * 0.3,
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: const Color.fromARGB(
                                                        255, 92, 92, 92)),
                                                borderRadius:
                                                    const BorderRadius.all(
                                                        Radius.circular(6)),
                                                color: const Color.fromARGB(
                                                    255, 255, 255, 255)),
                                            child: TextFormField(
                                              controller: context
                                                  .read<MyTransactionCtrl>()
                                                  .todatecontroller,
                                              decoration: InputDecoration(
                                                contentPadding:
                                                    EdgeInsets.symmetric(
                                                        vertical: Screens
                                                                .padingHeight(
                                                                    context) *
                                                            0.0,
                                                        horizontal:
                                                            Screens.width(
                                                                    context) *
                                                                0.02),
                                                focusedBorder:
                                                    const OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    10)),
                                                        borderSide:
                                                            BorderSide.none),
                                                enabledBorder:
                                                    const OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    10)),
                                                        borderSide: BorderSide
                                                            .none), // hoverColor: Colors.red,
                                                border: InputBorder.none,

                                                filled: true,
                                                fillColor: const Color.fromARGB(
                                                    255, 255, 255, 255),
                                              ),
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  )
                                : Container(),
                  ),
                  SizedBox(
                    height: Screens.fullHeight(context) * 0.02,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        if (context.read<MyTransactionCtrl>().selectedname ==
                            'All') {
                          context.read<MyTransactionCtrl>().callAllapi();
                        } else if (context
                                .read<MyTransactionCtrl>()
                                .selectedname ==
                            "Amount") {
                          context.read<MyTransactionCtrl>().callAmtapi();
                        } else if (context
                                .read<MyTransactionCtrl>()
                                .selectedname ==
                            "Points") {
                          context.read<MyTransactionCtrl>().callPointapi();
                        } else if (context
                                .read<MyTransactionCtrl>()
                                .selectedname ==
                            "Date") {
                          context.read<MyTransactionCtrl>().callDateapi();
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 212, 14, 0),
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(4)))),
                      child: Text(
                        S.current.submit,
                        // "Submit",
                        style: GoogleFonts.openSans(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        // style: TextStyle(
                        //     color: Colors.white,
                        //     fontSize: 18,
                        //     fontWeight: FontWeight.bold),
                      )),
                  SizedBox(
                    height: Screens.fullHeight(context) * 0.02,
                  ),
                  Text(
                    S.current.mytransaction1,
                    style: GoogleFonts.openSans(
                      color: const Color.fromARGB(255, 255, 22, 5),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    // style: TextStyle(
                    //   color: const Color.fromARGB(255, 255, 22, 5),
                    //   fontSize: 20,
                    //   fontWeight: FontWeight.bold,
                    // ),
                  ),
                  Column(
                    children: [
                      context.watch<MyTransactionCtrl>().transdata.length > 0
                          ? Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: Screens.width(context) * 0.05,
                              ),
                              height: Screens.fullHeight(context) * 0.45,
                              child: ListView.builder(
                                padding: EdgeInsets.symmetric(
                                    vertical: Screens.fullHeight(context) * 0,
                                    horizontal: Screens.width(context) * 0),
                                itemCount: context
                                    .watch<MyTransactionCtrl>()
                                    .transdata
                                    .length,
                                itemBuilder: (context, index) {
                                  var transaction = context
                                      .read<MyTransactionCtrl>()
                                      .transdata[index];
                                  // Color containerColor = index % 2 == 0
                                  // ? Colors.grey.shade200
                                  // : Colors.white;
                                  // if (selectedFilter != "All" &&
                                  //     transaction['type'] != selectedFilter) {
                                  //   return const SizedBox.shrink();
                                  // }
                                  return Container(
                                    // height: Screens.fullHeight(context) * 0.11,
                                    width: Screens.width(context),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: const Color.fromARGB(
                                              255, 192, 192, 192)),
                                      color: Colors.white,
                                      // containerColor, // Same as Card's background color
                                      borderRadius: BorderRadius.circular(
                                          7), // Rounded corners
                                      // border: Border.all(
                                      //   color: Colors.grey.shade600,
                                      // ), // Border color and width
                                    ),
                                    child: Card(
                                      elevation: 0,
                                      color: Colors.white,
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 0),
                                      child: Container(
                                        decoration: const BoxDecoration(),
                                        padding: EdgeInsets.symmetric(
                                            vertical:
                                                Screens.padingHeight(context) *
                                                    0.01),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                    child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      transaction.dealerName ==
                                                                  null ||
                                                              transaction
                                                                      .dealerName ==
                                                                  'null' ||
                                                              transaction
                                                                  .dealerName!
                                                                  .isEmpty
                                                          ? ''
                                                          : transaction
                                                              .dealerName
                                                              .toString(),
                                                      style:
                                                          GoogleFonts.openSans(
                                                        color: const Color
                                                            .fromARGB(
                                                            255, 0, 0, 0),
                                                        fontSize: 17,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height:
                                                          Screens.padingHeight(
                                                                  context) *
                                                              0.001,
                                                    ),
                                                    context
                                                                    .watch<
                                                                        MyTransactionCtrl>()
                                                                    .selectedname ==
                                                                'Points' ||
                                                            context
                                                                    .watch<
                                                                        MyTransactionCtrl>()
                                                                    .selectedname ==
                                                                'All'
                                                        ? Text(
                                                            'Pts ${transaction.recievedPoints.toString()}',
                                                            style: GoogleFonts
                                                                .openSans(
                                                              color: const Color
                                                                  .fromARGB(
                                                                  255,
                                                                  114,
                                                                  114,
                                                                  114),
                                                              fontSize: 15,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                            // style: const TextStyle(
                                                            //     fontSize: 15,
                                                            //     fontWeight: FontWeight.bold,
                                                            //     color: const Color.fromARGB(
                                                            //         255, 114, 114, 114)
                                                          )
                                                        : Text(''),
                                                    Text(
                                                      context
                                                          .read<
                                                              MyTransactionCtrl>()
                                                          .config
                                                          .alignDateT(
                                                              transaction
                                                                  .docDate),
                                                      style:
                                                          GoogleFonts.openSans(
                                                        color: const Color
                                                            .fromARGB(
                                                            255, 122, 122, 122),
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                      // style: TextStyle(
                                                      //     fontSize: 14,
                                                      //     color: const Color.fromARGB(
                                                      //         255, 122, 122, 122)),
                                                    ),
                                                    // Text(
                                                    //   transaction['site'],
                                                    //   style: GoogleFonts.openSans(
                                                    //     color: const Color.fromARGB(
                                                    //         255, 114, 114, 114),
                                                    //     fontSize: 14,
                                                    //     fontWeight: FontWeight.bold,
                                                    //   ),

                                                    // ),
                                                  ],
                                                )),
                                                Container(
                                                  child: Column(
                                                    children: [
                                                      context
                                                                  .watch<
                                                                      MyTransactionCtrl>()
                                                                  .selectedname ==
                                                              'All'
                                                          ? Text(
                                                              'Amt ${transaction.amount.toString()}',
                                                              style: GoogleFonts
                                                                  .openSans(
                                                                color: const Color
                                                                    .fromARGB(
                                                                    255,
                                                                    114,
                                                                    114,
                                                                    114),
                                                                fontSize: 15,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ))
                                                          : Container(),
                                                      context
                                                                      .watch<
                                                                          MyTransactionCtrl>()
                                                                      .selectedname ==
                                                                  'Date' ||
                                                              context
                                                                      .watch<
                                                                          MyTransactionCtrl>()
                                                                      .selectedname ==
                                                                  'Amount' ||
                                                              context
                                                                      .watch<
                                                                          MyTransactionCtrl>()
                                                                      .selectedname ==
                                                                  'All'
                                                          ? Text(
                                                              'R. Amt${transaction.redeemedAmount.toString()}',
                                                              style: GoogleFonts
                                                                  .openSans(
                                                                color: const Color
                                                                    .fromARGB(
                                                                    255,
                                                                    114,
                                                                    114,
                                                                    114),
                                                                fontSize: 15,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                              // style: const TextStyle(
                                                              //     fontSize: 15,
                                                              //     fontWeight: FontWeight.bold,
                                                              //     color: const Color.fromARGB(
                                                              //         255, 114, 114, 114)
                                                            )
                                                          : const Text(''),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),

                                      // ListTile(

                                      //   shape: Border(),
                                      //   :

                                      //   // minTileHeight: 0,
                                      //   subtitle:
                                      //   trailing:
                                      // ),
                                    ),
                                  );
                                },
                              ),
                            )
                          : Container(),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:new_one/Constant/Screen.dart';
// import 'package:new_one/Controller/LanguageControllers/languagecontroller.dart';
// import 'package:new_one/Controller/MyTransactionCtrlr.dart';
// import 'package:provider/provider.dart';

// class TransactionScreen extends StatefulWidget {
//   const TransactionScreen({super.key});

//   @override
//   State<TransactionScreen> createState() => _TransactionScreenState();
// }

// class _TransactionScreenState extends State<TransactionScreen> {
//   @override
//   // List<Map<String, dynamic>> transactions = [
//   //   {
//   //     "date": "2025-03-10",
//   //     "type": "Purchase",
//   //     "amount": "\$90",
//   //     "details": "Paint Purchase"
//   //   },
//   //   {
//   //     "date": "2025-03-08",
//   //     "type": "Redemption",
//   //     "amount": "-250 Points",
//   //     "details": "Points Redeemed"
//   //   },
//   //   {
//   //     "date": "2025-03-07",
//   //     "type": "Coupon Scan",
//   //     "amount": "+10 Points",
//   //     "details": "Scanned Coupon"
//   //   },
//   //   {
//   //     "date": "2025-03-10",
//   //     "type": "Purchase",
//   //     "amount": "\$70",
//   //     "details": "Paint Purchase"
//   //   },
//   //   {
//   //     "date": "2025-03-08",
//   //     "type": "Redemption",
//   //     "amount": "-500 Points",
//   //     "details": "Points Redeemed"
//   //   },
//   //   {
//   //     "date": "2025-03-07",
//   //     "type": "Coupon Scan",
//   //     "amount": "+30 Points",
//   //     "details": "Scanned Coupon"
//   //   },
//   //   {
//   //     "date": "2025-03-10",
//   //     "type": "Purchase",
//   //     "amount": "\$50",
//   //     "details": "Paint Purchase"
//   //   },
//   //   {
//   //     "date": "2025-03-08",
//   //     "type": "Redemption",
//   //     "amount": "-50 Points",
//   //     "details": "Points Redeemed"
//   //   },
//   //   {
//   //     "date": "2025-03-07",
//   //     "type": "Coupon Scan",
//   //     "amount": "+100 Points",
//   //     "details": "Scanned Coupon"
//   //   },
//   // ];

//   String selectedFilter = "All";

//   @override
//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
//       context.read<MyTransactionCtrl>().init();
//     });
//   }

//   // TextEditingController pointsController = TextEditingController();
//   // List<dummydata> dummlist = [];
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//     var groupvalue = context.read<Languagecontroller>().locale.languageCode;
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       // backgroundColor: const Color.fromARGB(255, 255, 255, 255),
//       body: Container(
//         padding: const EdgeInsets.only(bottom: 30),
//         decoration: const BoxDecoration(
//           color: Color.fromARGB(255, 1, 53, 143),
//         ),
//         height: Screens.fullHeight(context),
//         child: Container(
//           padding: const EdgeInsets.only(top: 30),
//           decoration: const BoxDecoration(
//               color: Color.fromARGB(255, 212, 14, 0),
//               borderRadius: BorderRadius.only(
//                   bottomLeft: Radius.circular(20),
//                   bottomRight: Radius.circular(20))),
//           child: Container(
//             height: Screens.fullHeight(context) * 0.93,
//             width: Screens.width(context),
//             decoration: const BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.all(Radius.circular(20))),
//             child: Padding(
//               padding: EdgeInsets.symmetric(
//                   vertical: Screens.padingHeight(context) * 0.01,
//                   horizontal: Screens.width(context) * 0.05),
//               child: Column(
//                 children: [
//                   Container(
//                     // color: Colors.amber,
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         SizedBox(
//                           height: Screens.bodyheight(context) * 0.01,
//                         ),
//                         Image.asset(
//                           'assets/Img1.png',
//                           height: 120,
//                           width: 90,
//                         ),
//                         Image.asset(
//                           'assets/CoralLogo_Outline.png',
//                           height: 100,
//                         ),
//                         Image.asset(
//                           'assets/Img2.png',
//                           height: 120,
//                           width: 90,
//                         ),
//                       ],
//                     ),
//                   ),
//                   // Row(
//                   //   mainAxisAlignment: MainAxisAlignment.center,
//                   //   children: [
//                   //     InkWell(
//                   //       onTap: () {
//                   //         showDialog(
//                   //             context: context,
//                   //             builder: (context) {
//                   //               return AlertDialog(
//                   //                 insetPadding: const EdgeInsets.all(10),
//                   //                 contentPadding: const EdgeInsets.all(0),
//                   //                 shape: RoundedRectangleBorder(
//                   //                     borderRadius: BorderRadius.circular(8)),
//                   //                 alignment: Alignment.center,
//                   //                 content: Container(
//                   //                   // height: 300,
//                   //                   // color: Colors.amber,
//                   //                   width: Screens.width(context) * 0.1,
//                   //                   constraints: BoxConstraints(
//                   //                       maxHeight:
//                   //                           Screens.padingHeight(context) *
//                   //                               0.3),
//                   //                   child: Column(
//                   //                     mainAxisSize: MainAxisSize.min,
//                   //                     children: [
//                   //                       Expanded(
//                   //                         child: ListView.builder(
//                   //                             shrinkWrap: true,
//                   //                             // ise:true,
//                   //                             itemCount: LanguageModel.length,
//                   //                             itemBuilder: (context, i) {
//                   //                               var item = LanguageModel[i];
//                   //                               return RadioListTile(
//                   //                                   value: item.languagecode,
//                   //                                   activeColor:
//                   //                                       theme.primaryColor,
//                   //                                   groupValue: groupvalue,
//                   //                                   title: Text(item.language!),
//                   //                                   subtitle:
//                   //                                       Text(item.sublanguage!),
//                   //                                   onChanged: (val) {
//                   //                                     groupvalue =
//                   //                                         val.toString();
//                   //                                     context
//                   //                                         .read<
//                   //                                             Languagecontroller>()
//                   //                                         .setlocate(Locale(item
//                   //                                             .languagecode!));
//                   //                                     Navigator.pop(context);
//                   //                                   });
//                   //                             }),
//                   //                       )
//                   //                     ],
//                   //                   ),
//                   //                 ),
//                   //               );
//                   //             });
//                   //       },
//                   //       child: Container(
//                   //         alignment: Alignment.topRight,
//                   //         width: Screens.width(context) * 0.3,
//                   //         height: Screens.fullHeight(context) * 0.04,
//                   //         // child: const Icon(
//                   //         //   Icons.language,
//                   //         //   color: Colors.black,
//                   //         //   size: 30,
//                   //         // )
//                   //         decoration: BoxDecoration(
//                   //             color: const Color.fromARGB(255, 248, 248, 248),
//                   //             border: Border.all(
//                   //                 color:
//                   //                     const Color.fromARGB(255, 172, 172, 172),
//                   //                 width: 0.5),
//                   //             borderRadius: BorderRadius.circular(7)),
//                   //         child: Padding(
//                   //           padding: EdgeInsets.symmetric(
//                   //               vertical: Screens.padingHeight(context) * 0.00),
//                   //           child: Row(
//                   //             mainAxisAlignment: MainAxisAlignment.center,
//                   //             children: [
//                   //               const Text(
//                   //                 "English",
//                   //                 style: TextStyle(
//                   //                     fontSize: 16,
//                   //                     fontWeight: FontWeight.bold,
//                   //                     color: Color.fromARGB(255, 95, 95, 95)),
//                   //               ),
//                   //               SizedBox(
//                   //                 width: Screens.width(context) * 0.02,
//                   //               ),
//                   //               const Icon(
//                   //                 Icons.arrow_drop_down,
//                   //                 color: const Color.fromARGB(255, 212, 14, 0),
//                   //                 size: 35,
//                   //               ),
//                   //             ],
//                   //           ),
//                   //         ),
//                   //       ),
//                   //     ),
//                   //   ],
//                   // ),

//                   SizedBox(
//                     height: Screens.fullHeight(context) * 0.03,
//                   ),
//                   const Text(
//                     " MY TRANSACTION",
//                     style: TextStyle(
//                       color: Color.fromARGB(255, 255, 22, 5),
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),

//                   // SizedBox(
//                   //   height: Screens.fullHeight(context) * 0.015,
//                   // ),
//                   SizedBox(
//                     height: Screens.fullHeight(context) * 0.03,
//                   ),

//                   // SizedBox(
//                   //   height: Screens.fullHeight(context) * 0.008,
//                   // ),
//                   Container(
//                     height: Screens.fullHeight(context) * 0.64,
//                     decoration: const BoxDecoration(
//                         color: Color.fromARGB(255, 12, 9, 9),
//                         borderRadius: BorderRadius.all(Radius.circular(20))),

//                     // alignment: Alignment.topLeft,
//                     // constraints: BoxConstraints(
//                     //     maxHeight: Screens.padingHeight(context) * 0.3),
//                     child: Column(
//                       children: [
//                         Container(
//                           color: Colors.white,
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               const Text(
//                                 "TRANSACTION HISTORY",
//                                 style: TextStyle(
//                                   color: Color.fromARGB(255, 38, 162, 136),
//                                   fontSize: 15,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                               DropdownButton<String>(
//                                 value: selectedFilter,
//                                 onChanged: (value) {
//                                   setState(() {
//                                     selectedFilter = value!;
//                                   });
//                                 },
//                                 items: ["All", "Points", "Redemption"]
//                                     .map((type) => DropdownMenuItem(
//                                           value: type,
//                                           child: Text(type),
//                                         ))
//                                     .toList(),
//                               ),
//                             ],
//                           ),
//                         ),
//                         context.read<MyTransactionCtrl>().transactions.length >
//                                 0
//                             ? Container(
//                                 height: Screens.fullHeight(context) * 0.58,
//                                 child: ListView.builder(
//                                   padding: EdgeInsets.symmetric(
//                                       vertical: Screens.fullHeight(context) * 0,
//                                       horizontal: Screens.width(context) * 0),
//                                   itemCount: context
//                                       .read<MyTransactionCtrl>()
//                                       .transactions
//                                       .length,
//                                   itemBuilder: (context, index) {
//                                     var transaction = context
//                                         .read<MyTransactionCtrl>()
//                                         .transactions[index];
//                                     Color containerColor = index % 2 == 0
//                                         ? Colors.grey.shade200
//                                         : Colors.white;
//                                     // if (selectedFilter != "All" &&
//                                     //     transaction['type'] != selectedFilter) {
//                                     //   return const SizedBox.shrink();
//                                     // }
//                                     return Container(
//                                       height: Screens.fullHeight(context) * 0.1,
//                                       width: Screens.width(context),
//                                       decoration: BoxDecoration(
//                                         color:
//                                             containerColor, // Same as Card's background color
//                                         borderRadius: BorderRadius.circular(
//                                             7), // Rounded corners
//                                         // border: Border.all(
//                                         //   color: Colors.grey.shade600,
//                                         // ), // Border color and width
//                                       ),
//                                       child: Card(
//                                         elevation: 0,
//                                         color: containerColor,
//                                         margin: const EdgeInsets.symmetric(
//                                             horizontal: 10, vertical: 0),
//                                         child: Container(
//                                           padding: EdgeInsets.symmetric(
//                                               vertical: Screens.padingHeight(
//                                                       context) *
//                                                   0.02),
//                                           child: Column(
//                                             crossAxisAlignment:
//                                                 CrossAxisAlignment.start,
//                                             children: [
//                                               Row(
//                                                 mainAxisAlignment:
//                                                     MainAxisAlignment
//                                                         .spaceBetween,
//                                                 children: [
//                                                   Column(
//                                                     crossAxisAlignment:
//                                                         CrossAxisAlignment
//                                                             .start,
//                                                     children: [
//                                                       Text(
//                                                         transaction.details ??
//                                                             '',
//                                                         style: const TextStyle(
//                                                             fontSize: 17,
//                                                             fontWeight:
//                                                                 FontWeight.bold,
//                                                             color:
//                                                                 Color.fromARGB(
//                                                                     255,
//                                                                     0,
//                                                                     0,
//                                                                     0)),
//                                                       ),
//                                                       SizedBox(
//                                                         height: Screens
//                                                                 .padingHeight(
//                                                                     context) *
//                                                             0.01,
//                                                       ),
//                                                       Text(
//                                                         transaction.docDate,
//                                                         style: const TextStyle(
//                                                             fontSize: 16,
//                                                             color:
//                                                                 Color.fromARGB(
//                                                                     255,
//                                                                     0,
//                                                                     0,
//                                                                     0)),
//                                                       ),
//                                                     ],
//                                                   ),
//                                                   Container(
//                                                     child: Text(
//                                                         transaction.amount
//                                                             .toString(),
//                                                         style: const TextStyle(
//                                                             fontSize: 16,
//                                                             fontWeight:
//                                                                 FontWeight.bold,
//                                                             color:
//                                                                 Color.fromARGB(
//                                                                     255,
//                                                                     38,
//                                                                     162,
//                                                                     136))),
//                                                   )
//                                                 ],
//                                               )
//                                             ],
//                                           ),
//                                         ),

//                                         // ListTile(

//                                         //   shape: Border(),
//                                         //   :

//                                         //   // minTileHeight: 0,
//                                         //   subtitle:
//                                         //   trailing:
//                                         // ),
//                                       ),
//                                     );
//                                   },
//                                 ),
//                               )
//                             : Container(
//                                 color: Colors.red,
//                               ),
//                       ],
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
