import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Mobile extends StatefulWidget {
  const Mobile({super.key});

  @override
  State<Mobile> createState() => _MobileState();
}

final Color clr = Color(0xff0B1F5B);
String selectedOption = 'Filter';
List<String> options = ['Filter', 'Option 1', 'Option 2', 'Option 3'];
var clgslt = 'Select';
List<String> clgopt = ['Select', 'Option 1', 'Option 2', 'Option 3'];
var dptslt = 'Select';
List<String> dptopt = ['Select', 'CSE', 'EEE', 'ECE'];
var eveslt = 'Select';
List<String> eveopt = ['Select', 'Paper', 'Treasure', 'Hunt'];

class _MobileState extends State<Mobile> {
  final Color clr = Color(0xff0B1F5B);
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: clr,
        title: Text(
          'EventSync',
          style: GoogleFonts.reemKufi(
              fontSize: 25, fontWeight: FontWeight.w700, color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              SizedBox(
                height: 25,
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  'Welcome to the',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.reemKufi(
                      fontSize: 15, fontWeight: FontWeight.w800),
                ),
              ),
              Text(
                'Event Sync',
                style: GoogleFonts.reemKufi(
                    color: clr, fontSize: 30, fontWeight: FontWeight.w800),
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                width: 400,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Form(
                        key: formKey,
                        child: Container(
                            width: 150,
                            decoration: BoxDecoration(
                              border: Border.all(color: clr, width: 2),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            padding:
                                const EdgeInsets.symmetric(horizontal: 12.0),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                  value: selectedOption,
                                  onChanged: (newValue) {
                                    setState(() {
                                      selectedOption = newValue!;
                                    });
                                  },
                                  items: options.map<DropdownMenuItem<String>>(
                                      (String value) {
                                    return DropdownMenuItem(
                                        value: value,
                                        child: Text(
                                          value,
                                          style: GoogleFonts.reemKufi(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w600),
                                        ));
                                  }).toList()),
                            ))),
                    IconButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return DataSheet();
                              });
                        },
                        icon: Image.asset(
                          'dsheet.png',
                          width: 25,
                          height: 25,
                        )),
                  ],
                ),
              ),
              SizedBox(
                height: 80,
              ),
              Container(
                width: 200,
                height: 200,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    PieChart(
                      PieChartData(
                        sections: [
                          PieChartSectionData(
                              value: 360 / 500,
                              color: clr,
                              title: '',
                              radius: 50,
                              titlePositionPercentageOffset: 0.5),
                          PieChartSectionData(
                            value: 1 - (360 / 500),
                            color: Colors
                                .transparent, // Transparent to create the donut effect
                            title: '',
                          ),
                        ],
                        centerSpaceRadius: 70,
                        sectionsSpace: 2,
                        borderData: FlBorderData(
                          show: true,
                        ),
                      ),
                      swapAnimationCurve: Curves.bounceIn,
                      swapAnimationDuration: Duration(seconds: 5),
                    ),
                    Text(
                      '500',
                      style: GoogleFonts.reemKufi(
                          fontSize: 15.sp,
                          color: clr,
                          fontWeight: FontWeight.w700),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 55,
              ),
              Container(
                width: 270.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Seats Filled:',
                      style: GoogleFonts.reemKufi(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w700),
                    ),
                    Text(
                      '360',
                      style: GoogleFonts.reemKufi(
                          color: clr,
                          fontSize: 20,
                          fontWeight: FontWeight.w800),
                    ),
                    Text(
                      '/ 500',
                      style: GoogleFonts.reemKufi(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w800),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Exlist(
                img: 'qrcode.png',
                h: 80,
                w: 80,
                id: 'QR',
                titletxt: 'SnapQR',
              ),
              Exlist(
                img: 'manbook.png',
                h: 55,
                w: 55,
                id: 'Book',
                titletxt: 'Bookify',
              )
            ],
          ),
        ),
      ),
    );
  }
}

class DataSheet extends StatefulWidget {
  const DataSheet({super.key});

  @override
  State<DataSheet> createState() => _DataSheetState();
}

class _DataSheetState extends State<DataSheet> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: clr,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Colors.white,
              ),
              width: 900,
              height: 500,
            ),
          )
        ],
      ),
    );
  }
}

class Exlist extends StatefulWidget {
  final img, titletxt, h, w, id;

  Exlist(
      {super.key,
      required this.titletxt,
      required this.img,
      required this.h,
      required this.w,
      this.id});

  @override
  State<Exlist> createState() => _ExlistState();
}

class _ExlistState extends State<Exlist> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return SizedBox(
          width: 400,
          child: Card(
            color: Colors.white,
            child: ExpansionTile(
              title: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(1.0),
                    child: Image.asset(
                      widget.img,
                      height: widget.h,
                      width: widget.w,
                    ),
                  ),
                  SizedBox(
                    width: 17.w,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      widget.titletxt,
                      style: GoogleFonts.reemKufi(
                        color: clr,
                        fontWeight: FontWeight.w800,
                        fontSize: 25,
                      ),
                    ),
                  )
                ],
              ),
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: [widget.id == 'QR' ? SnapQr() : Bookify()],
                  ),
                )
              ],
            ),
          ));
    });
  }
}

final isreg = 'false';

class SnapQr extends StatefulWidget {
  const SnapQr({super.key});

  @override
  State<SnapQr> createState() => _SnapQrState();
}

class _SnapQrState extends State<SnapQr> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 15),
          child: Container(
            width: 250,
            height: 250,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                border: Border.all(color: clr, width: 5)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Container(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Name :',
                      style: GoogleFonts.reemKufi(
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Text('XXXXX',
                        style: GoogleFonts.reemKufi(
                          fontSize: 20,
                        ))
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Dept :',
                      style: GoogleFonts.reemKufi(
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Text('XVXV',
                        style: GoogleFonts.reemKufi(
                          fontSize: 20,
                        ))
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'College :',
                      style: GoogleFonts.reemKufi(
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Text('YYYY',
                        style: GoogleFonts.reemKufi(
                          fontSize: 20,
                        ))
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Event :',
                      style: GoogleFonts.reemKufi(
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Text('XYXY',
                        style: GoogleFonts.reemKufi(
                          fontSize: 20,
                        ))
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Registered :',
                      style: GoogleFonts.reemKufi(
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    isreg != 'false'
                        ? Text('Yes',
                            style: GoogleFonts.reemKufi(
                                fontSize: 20, color: Colors.green))
                        : Text('No',
                            style: GoogleFonts.reemKufi(
                                fontSize: 20, color: Colors.red))
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        elevation: 0, backgroundColor: Colors.white),
                    onPressed: () {
                      print('Book the Qr');
                    },
                    child: Container(
                      width: 150,
                      height: 75,
                      decoration: BoxDecoration(
                          color: clr, borderRadius: BorderRadius.circular(20)),
                      child: Center(
                        child: Text(
                          'Book',
                          style: GoogleFonts.reemKufi(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.w800),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    ));
  }
}

class Bookify extends StatefulWidget {
  const Bookify({super.key});

  @override
  State<Bookify> createState() => _BookifyState();
}

class _BookifyState extends State<Bookify> {
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final _namecontroller = TextEditingController();
    final _emailcontroller = TextEditingController();
    final _phonecontroller = TextEditingController();
    final _eventcontroller = TextEditingController();

    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Container(
          height: 700.h,
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextFormField(
                  controller: _namecontroller,
                  keyboardType: TextInputType.name,
                  autocorrect: true,
                  autovalidateMode: AutovalidateMode.always,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: 'Name'),
                  validator: (e) {},
                ),
                Container(
                  child: DropdownButtonFormField<String>(
                    decoration: const InputDecoration(
                      labelText: 'Dept',
                      border: OutlineInputBorder(),
                    ),
                    value: dptslt,
                    onChanged: (newValue) {
                      dptslt = newValue!;
                    },
                    items: dptopt.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      );
                    }).toList(),
                    validator: (value) {
                      if (value == 'Select') {
                        return 'Please select an option';
                      }
                      return null;
                    },
                  ),
                ),
                TextFormField(
                  controller: _emailcontroller,
                  autocorrect: true,
                  keyboardType: TextInputType.emailAddress,
                  autovalidateMode: AutovalidateMode.always,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: 'Email'),
                  validator: (e) {},
                ),
                TextFormField(
                  controller: _phonecontroller,
                  keyboardType: TextInputType.phone,
                  autocorrect: true,
                  autovalidateMode: AutovalidateMode.always,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: 'Phone'),
                  validator: (e) {},
                ),
                Container(
                  child: DropdownButtonFormField<String>(
                    decoration: const InputDecoration(
                      labelText: 'College',
                      border: OutlineInputBorder(),
                    ),
                    value: clgslt,
                    onChanged: (newValue) {
                      clgslt = newValue!;
                    },
                    items: clgopt.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      );
                    }).toList(),
                    validator: (value) {
                      if (value == 'Select') {
                        return 'Please select an option';
                      }
                      return null;
                    },
                  ),
                ),
                Container(
                  child: DropdownButtonFormField<String>(
                    decoration: const InputDecoration(
                      labelText: 'Event',
                      border: OutlineInputBorder(),
                    ),
                    value: eveslt,
                    onChanged: (newValue) {
                      eveslt = newValue!;
                    },
                    items: eveopt.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      );
                    }).toList(),
                    validator: (value) {
                      if (value == 'Select') {
                        return 'Please select an option';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        elevation: 0, backgroundColor: Colors.white),
                    onPressed: () {
                      print('Book the Bookify');
                    },
                    child: Container(
                      width: 150,
                      height: 75,
                      decoration: BoxDecoration(
                          color: clr, borderRadius: BorderRadius.circular(20)),
                      child: Center(
                        child: Text(
                          'Book',
                          style: GoogleFonts.reemKufi(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.w800),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
