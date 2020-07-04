import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CalculaterPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CalculaterState();
  }
}

class CalculaterState extends State<CalculaterPage> {
  static TextEditingController buysellController = TextEditingController();
  static TextEditingController stoplossPriceController =
      TextEditingController();
  static TextEditingController stoplossController = TextEditingController();
  static TextEditingController targetPointsController = TextEditingController();
  static TextEditingController targetPriceController = TextEditingController();
  static TextEditingController riskRewardController = TextEditingController();
  static TextEditingController noSharesController = TextEditingController();
  static TextEditingController riskTradeController = TextEditingController();
  static TextEditingController riskPerController = TextEditingController();
  static TextEditingController riskCapitalController = TextEditingController();

  static String stopLossdata = "";

  @override
  void initState() {
    super.initState();

    buysellController.addListener(() {
      setStopLossPoints();
      setTargetPoints();
      setTargetPrice();
    });

    stoplossPriceController.addListener(() {
      setStopLossPoints();
      setTargetPoints();
      setTargetPrice();
      setNoShares();
    });

    riskRewardController.addListener(() {
      setTargetPoints();
      setTargetPrice();
    });

    riskPerController.addListener(() {
      setNoShares();
      setRiskTrade();
    });

    riskCapitalController.addListener(() {
      setNoShares();
      setRiskTrade();
    });
  }

  setStopLossPoints() {
    if (buysellController.text.isNotEmpty &&
        stoplossPriceController.text.isNotEmpty) {
      stoplossController.text = (double.parse(buysellController.text) -
              double.parse(stoplossPriceController.text))
          .toStringAsFixed(2)
          .toString()
          .replaceAll("-", "");
      setState(() {});
    }
  }

  setTargetPoints() {
    if (buysellController.text.isNotEmpty &&
        stoplossPriceController.text.isNotEmpty &&
        riskRewardController.text.isNotEmpty) {
      targetPointsController.text = ((double.parse(buysellController.text) -
                  double.parse(stoplossPriceController.text)) *
              double.parse(riskRewardController.text))
          .toStringAsFixed(2)
          .toString()
          .replaceAll("-", "");
      setState(() {});
    }
  }

  setTargetPrice() {
    if (buysellController.text.isNotEmpty &&
        stoplossPriceController.text.isNotEmpty &&
        riskRewardController.text.isNotEmpty) {
      targetPriceController.text = (double.parse(buysellController.text) +
              ((double.parse(buysellController.text) -
                      double.parse(stoplossPriceController.text)) *
                  double.parse(riskRewardController.text)))
          .toStringAsFixed(2)
          .toString();
      setState(() {});
    }
  }

  setNoShares() {
    if (riskCapitalController.text.isNotEmpty &&
        riskPerController.text.isNotEmpty &&
        stoplossController.text.isNotEmpty) {
      noSharesController.text = ((double.parse(riskCapitalController.text) *
                  (double.parse(riskPerController.text) / 100)) /
              double.parse(stoplossController.text))
          .toStringAsFixed(2)
          .toString();
      setState(() {});
    }
  }

  setRiskTrade() {
    if (riskCapitalController.text.isNotEmpty &&
        riskPerController.text.isNotEmpty) {
      riskTradeController.text = (double.parse(riskCapitalController.text) *
              (double.parse(riskPerController.text) / 100))
          .toStringAsFixed(2)
          .toString();
      setState(() {});
    }
  }

  @override
  void dispose() {
    super.dispose();
    buysellController.dispose();
    stoplossController.dispose();
    stoplossPriceController.dispose();
    targetPointsController.dispose();
    targetPriceController.dispose();
    riskRewardController.dispose();
    noSharesController.dispose();
    riskTradeController.dispose();
    riskPerController.dispose();
    riskCapitalController.dispose();
  }

//  static buySellChange() {
//    if (buysellController != null && stoplossPriceController != null)
//      if (buysellController.text.isNotEmpty &&
//          stoplossPriceController.text.isNotEmpty) {
//        stoplossController.text = (int.parse(buysellController.text) -
//            int.parse(stoplossPriceController.text))
//            .toString();
//
//      }
//  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Position Calculator"),
          backgroundColor: Color(0xff1e16b2),
        ),
        body: new Theme(
            data: new ThemeData(backgroundColor: Colors.white),
            child: Container(
                padding: EdgeInsets.only(
                    left: 10.0, top: 5.0, right: 10.0, bottom: 5.0),
                child: ListView(
                  children: <Widget>[
                    Row(children: <Widget>[
                      Expanded(
                          child: Container(
                        child: getHeadData("BUY/SELL PRICE"),
                      )),
                      Expanded(
                          child: Container(
                        padding: EdgeInsets.only(left: 10.0),
                        child: getHeadData("STOP LOSS PRICE"),
                      ))
                    ]),
                    Row(children: <Widget>[
                      Expanded(
                          child: Container(
                        child: buysellField,
                      )),
                      Expanded(
                          child: Container(
                              padding: EdgeInsets.only(left: 10.0),
                              child: stoplossPriceField))
                    ]),
                    Container(
                      height: 20,
                    ),
                    Row(children: <Widget>[
                      Expanded(
                          child: Container(
                        child: getHeadData("STOP LOSS POINTS"),
                      )),
                      Expanded(
                          child: Container(
                        padding: EdgeInsets.only(left: 10.0),
                        child: stoplossField,
                      )),
                    ]),
                    Container(
                      height: 20,
                    ),
                    Row(children: <Widget>[
                      Expanded(
                          child: Container(
                        child: getHeadData("TARGET POINTS"),
                      )),
                      Expanded(
                          child: Container(
                        padding: EdgeInsets.only(left: 10.0),
                        child: targetField,
                      )),
                    ]),
                    Container(
                      height: 20,
                    ),
                    Row(children: <Widget>[
                      Expanded(
                          child: Container(
                        child: getHeadData("TARGET PRICE"),
                      )),
                      Expanded(
                          child: Container(
                        padding: EdgeInsets.only(left: 10.0),
                        child: targetPriceField,
                      )),
                    ]),
                    Container(
                      height: 20,
                    ),
                    Row(children: <Widget>[
                      Expanded(
                          child: Container(
                        width: 300,
                        child: TextField(
                          textAlign: TextAlign.center,
                          enabled: false,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              labelText: "RISK : REWARD",
                              labelStyle: TextStyle(
                                  color: Colors.black45,
                                  fontFamily: 'MyFonts',
                                  fontSize: 13.0,
                                  fontWeight: FontWeight.w800),
                              contentPadding: new EdgeInsets.symmetric(
                                  vertical: 5.0, horizontal: 10.0)),
                        ),
                      )),
                      Expanded(
                          child: Container(
                        padding: EdgeInsets.only(left: 10.0),
                        child: risk_RewardField1,
                      )),
                      Expanded(
                          child: Container(
                        padding: EdgeInsets.only(left: 10.0),
                        child: risk_RewardField,
                      )),
                    ]),
                    Container(
                      height: 20,
                    ),
                    Row(children: <Widget>[
                      Expanded(
                          child: Container(
                        child: getHeadData("NO. SHARES"),
                      )),
                      Expanded(
                          child: Container(
                        padding: EdgeInsets.only(left: 10.0),
                        child: no_shares_Field,
                      )),
                    ]),
                    Container(
                      height: 20,
                    ),
                    Row(children: <Widget>[
                      Expanded(
                          child: Container(
                        child: getHeadData("RISK PER TRADE"),
                      )),
                      Expanded(
                          child: Container(
                        padding: EdgeInsets.only(left: 10.0),
                        child: risk_trade_Field,
                      )),
                    ]),
                    Container(
                      height: 20,
                    ),
                    Row(children: <Widget>[
                      Expanded(
                          child: Container(
                        child: getHeadData("RISK PERCENTAGE"),
                      )),
                      Expanded(
                          child: Container(
                        padding: EdgeInsets.only(left: 10.0),
                        child: risk_per_Field,
                      )),
                    ]),
                    Container(
                      height: 20,
                    ),
                    Row(children: <Widget>[
                      Expanded(
                          child: Container(
                        child: getHeadData("CAPITAL"),
                      )),
                      Expanded(
                          child: Container(
                        padding: EdgeInsets.only(left: 10.0),
                        child: capital_Field,
                      )),
                    ]),
                  ],
                ))));
  }

  var buysellField = TextFormField(
      textAlign: TextAlign.center,
      keyboardType: TextInputType.number,
      controller: buysellController,
      decoration: InputDecoration(
          contentPadding:
              new EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: BorderSide(color: Colors.grey)),
          fillColor: Color(0xFFececec),
          filled: true));

  var stoplossPriceField = TextFormField(
      textAlign: TextAlign.center,
      keyboardType: TextInputType.number,
      controller: stoplossPriceController,
      decoration: InputDecoration(
          contentPadding:
              new EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: BorderSide(color: Colors.grey)),
          fillColor: Color(0xFFececec),
          filled: true));

  var stoplossField = TextFormField(
    textAlign: TextAlign.center,
    keyboardType: TextInputType.number,
    enabled: false,
    controller: stoplossController,
    decoration: InputDecoration(
        contentPadding:
            new EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: BorderSide(color: Colors.grey)),
        fillColor: Color(0xFFececec),
        filled: true),
  );

  var targetField = TextFormField(
      textAlign: TextAlign.center,
      keyboardType: TextInputType.number,
      enabled: false,
      controller: targetPointsController,
      decoration: InputDecoration(
          contentPadding:
              new EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: BorderSide(color: Colors.grey)),
          fillColor: Color(0xFFececec),
          filled: true));

  var targetPriceField = TextFormField(
      textAlign: TextAlign.center,
      keyboardType: TextInputType.number,
      enabled: false,
      controller: targetPriceController,
      decoration: InputDecoration(
          contentPadding:
              new EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: BorderSide(color: Colors.grey)),
          fillColor: Color(0xFFececec),
          filled: true));

  var risk_RewardField = TextFormField(
      textAlign: TextAlign.center,
      keyboardType: TextInputType.number,
      controller: riskRewardController,
      decoration: InputDecoration(
          contentPadding:
              new EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: BorderSide(color: Colors.grey)),
          fillColor: Color(0xFFececec),
          filled: true));

  var risk_RewardField1 = TextFormField(
    textAlign: TextAlign.center,
    keyboardType: TextInputType.number,
    enabled: false,
    initialValue: "1",
    decoration: InputDecoration(
        contentPadding:
            new EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0))),
  );

  var no_shares_Field = TextFormField(
      textAlign: TextAlign.center,
      keyboardType: TextInputType.number,
      enabled: false,
      controller: noSharesController,
      decoration: InputDecoration(
          contentPadding:
              new EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: BorderSide(color: Colors.grey)),
          fillColor: Color(0xFFececec),
          filled: true));

  var risk_trade_Field = TextFormField(
      textAlign: TextAlign.center,
      keyboardType: TextInputType.number,
      enabled: false,
      controller: riskTradeController,
      decoration: InputDecoration(
          contentPadding:
              new EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: BorderSide(color: Colors.grey)),
          fillColor: Color(0xFFececec),
          filled: true));

  var risk_per_Field = TextFormField(
      textAlign: TextAlign.center,
      keyboardType: TextInputType.number,
      controller: riskPerController,
      decoration: InputDecoration(
          contentPadding:
              new EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: BorderSide(color: Colors.grey)),
          fillColor: Color(0xFFececec),
          filled: true));

  var capital_Field = TextFormField(
      textAlign: TextAlign.center,
      keyboardType: TextInputType.number,
      controller: riskCapitalController,
      decoration: InputDecoration(
          contentPadding:
              new EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: BorderSide(color: Colors.grey)),
          fillColor: Color(0xFFececec),
          filled: true));

  Widget getHeadData(String head) {
    return TextField(
      textAlign: TextAlign.center,
      enabled: false,
      decoration: InputDecoration(
          border: InputBorder.none,
          labelText: head,
          labelStyle: TextStyle(
              color: Colors.black45,
              fontFamily: 'MyFonts',
              fontSize: 13.0,
              fontWeight: FontWeight.w800),
          contentPadding:
              new EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0)),
    );
  }
}
