// ignore_for_file: unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:flutter_money_tracking_app/models/monney.dart';
import 'package:flutter_money_tracking_app/services/supabaseservices.dart';
import 'package:intl/intl.dart';

class MoneyBalanceUi extends StatefulWidget {
  const MoneyBalanceUi({super.key});

  @override
  State<MoneyBalanceUi> createState() => _MoneyBalanceUiState();
}

class _MoneyBalanceUiState extends State<MoneyBalanceUi> {
  bool edit = false;
  final service = Supabaseservice();

  List<Tracking> trackingList = [];

  List<String> listname = [];

  late TextEditingController nameacc;

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
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Text(
                "Money In/Money Out",
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: ListView.builder(
                      itemCount: trackingList.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: trackingList[index].status == 'deposit'
                              ? Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: const Color.fromARGB(
                                      255,
                                      34,
                                      77,
                                      35,
                                    ),
                                  ),
                                  child: Icon(
                                    Icons.arrow_upward_sharp,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                )
                              : Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: const Color.fromARGB(
                                      255,
                                      94,
                                      26,
                                      21,
                                    ),
                                  ),
                                  child: Icon(
                                    Icons.arrow_downward_sharp,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                ),

                          title: Text(
                            "${trackingList[index].title}",
                            style: TextStyle(fontSize: 20, color: Colors.black),
                          ),

                          subtitle: Text(
                            "${DateFormat.yMMMMd('th').format(DateTime.parse(trackingList[index].date!))}",
                          ),

                          trailing: Text(
                            "${numberFormat.format(trackingList[index].money)}",
                            style: TextStyle(
                              fontSize: 20,
                              color: trackingList[index].status == 'deposit'
                                  ? const Color.fromARGB(255, 34, 77, 35)
                                  : const Color.fromARGB(255, 94, 26, 21),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
