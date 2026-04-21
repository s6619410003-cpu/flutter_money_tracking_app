import 'package:flutter/material.dart';
import 'package:flutter_money_tracking_app/models/monney.dart';
import 'package:flutter_money_tracking_app/services/supabaseservices.dart';
import 'package:intl/intl.dart';

class MoneyOutUi extends StatefulWidget {
  const MoneyOutUi({super.key});

  @override
  State<MoneyOutUi> createState() => _MoneyOutUiState();
}

class _MoneyOutUiState extends State<MoneyOutUi> {
  bool edit = false;
  final service = Supabaseservice();

  List<Tracking> trackingList = [];

  List<String> listname = [];

  TextEditingController titleController = TextEditingController();

  TextEditingController moneyController = TextEditingController();

  late TextEditingController nameacc;

  final getdate = DateFormat('yyyy-MM-dd').format(DateTime.now());

  @override
  void initState() {
    super.initState();
    fetchdata();
  }

  void fetchdata() async {
    final data = await service.gettracking();

    setState(() {
      trackingList = data;
    });
  }

  void update() async {
    if (titleController.text.isEmpty || moneyController.text.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("กรุณากรอกข้อมูลให้ครบ")));
    }

    // pack data
    Tracking tracking = Tracking(
      title: titleController.text,
      money: double.parse(moneyController.text),
      date: getdate,
      status: "withdraw",
    );

    // call service
    await service.insertTracking(tracking);
    // clear textfield
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text("บันทึกเรียบร้อยแล้ว")));
  }

  final numberFormat = NumberFormat("#,###.00");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff034078),

        automaticallyImplyLeading: false,

        title: Text("Anucha Saelim", style: TextStyle(color: Colors.white)),

        actions: [
          Container(
            margin: EdgeInsets.all(3),
            width: 100,
            height: 100,

            decoration: BoxDecoration(
              shape: BoxShape.circle,

              image: DecorationImage(
                image: AssetImage("assets/images/sharkgey.jpg"),
                fit: BoxFit.scaleDown,
              ),
            ),
          ),
        ],
      ),

      body: Center(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 200,

                  decoration: BoxDecoration(
                    color: Color(0xff034078),
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.elliptical(
                        MediaQuery.of(context).size.width,
                        45,
                      ),
                    ),
                  ),
                ),

                Center(
                  heightFactor: 1,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 100),
                    child: Container(
                      height: 200,
                      width: MediaQuery.of(context).size.width * 0.9,
                      decoration: BoxDecoration(
                        color: Color(0xff001f54),
                        borderRadius: BorderRadius.circular(20),
                      ),

                      child: Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Column(
                          children: [
                            Text(
                              "Total Money Balance",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),

                            Text(
                              "${numberFormat.format(trackingList.totalBalance)}",

                              style: TextStyle(
                                fontSize: 34,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.02,
                            ),

                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    child: Row(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.white,
                                          ),
                                          child: Icon(
                                            Icons.arrow_upward,
                                            color: Colors.black,
                                            size: 25,
                                          ),
                                        ),

                                        SizedBox(width: 6),
                                        Text(
                                          "Money In",
                                          style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                  Container(
                                    child: Row(
                                      children: [
                                        Text(
                                          "Money Out",
                                          style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.white,
                                          ),
                                        ),

                                        SizedBox(width: 6),

                                        Container(
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.white,
                                          ),
                                          child: Icon(
                                            Icons.arrow_downward,
                                            color: Colors.black,
                                            size: 25,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 30,
                                vertical: 6,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "${numberFormat.format(trackingList.totalMoneyIn)}",
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                    ),
                                  ),

                                  Text(
                                    "${numberFormat.format(trackingList.totalMoneyOut)}",
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.only(top: 30, left: 20),
              child: Text(
                DateFormat.yMMMMd('th').format(DateTime.now()),
                style: TextStyle(
                  fontSize: 40,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            Text(
              "Money Out",
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),

            Padding(
              padding: EdgeInsetsGeometry.all(20),

              child: Column(
                children: [
                  TextField(
                    controller: titleController,

                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      contentPadding: EdgeInsets.all(20),
                      labelText: "รายการเงินออก",
                      hintText: "Details",
                    ),
                  ),

                  SizedBox(height: 20),

                  TextField(
                    controller: moneyController,

                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      contentPadding: EdgeInsets.all(20),
                      labelText: "จํานวนเงินออก",
                      suffixText: "บาท",
                    ),
                  ),

                  SizedBox(height: 20),

                  ElevatedButton(
                    onPressed: () {
                      update();
                    },
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(MediaQuery.of(context).size.width, 50),
                      backgroundColor: Color(0xff001f54),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      "Record",

                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
