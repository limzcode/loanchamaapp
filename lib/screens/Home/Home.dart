import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:trove_challenge/constants/Constants.dart';
import 'package:trove_challenge/provider/User.dart';
import 'package:trove_challenge/utils/SizeConfig.dart';
import 'package:trove_challenge/utils/ThemeUtils/ThemeUtils.dart';
import 'package:trove_challenge/widgets/BottomNavBar/BottomNavBar.dart';
import 'package:trove_challenge/widgets/PortfolioPosition/PortfolioPosition.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  ThemeUtils theme = new ThemeUtils();
  UserProvider _user;
  final formatCurrency = new NumberFormat.currency(locale: "en_US", symbol: "");



  Widget colorCard1(
      String text, double amount, int type, BuildContext context, Color color) {
    final _media = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(top: 15, right: 15),
      padding: EdgeInsets.all(15),
      height: 100,
      width: _media.width / 2 - 40,
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
                color: color.withOpacity(0.4),
                blurRadius: 16,
                spreadRadius: 0.2,
                offset: Offset(0, 8)),
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 24.0),
              child: Center(
                child: Text(
                  text,
                  style: TextStyle(
                    fontSize: SizeConfig.blockSizeHorizontal * 4.5,
                    color: Colors.white,

                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  Widget colorCard(
      String text, double amount, int type, BuildContext context, Color color) {
    final _media = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(top: 15, right: 15),
      padding: EdgeInsets.all(15),
      height: 100,
      width: _media.width / 2 - 40,
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
                color: color.withOpacity(0.4),
                blurRadius: 16,
                spreadRadius: 0.2,
                offset: Offset(0, 8)),
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            text,
            style: TextStyle(
              fontSize: SizeConfig.blockSizeHorizontal * 4.5,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            "sh${formatCurrency.format(amount)}",
            style: TextStyle(
              fontSize: SizeConfig.blockSizeHorizontal * 4.5,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    _user = Provider.of<UserProvider>(context);
    print(_user.getUser.fullName);
    print(_user.getUser.phoneNumber);
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment(0.4, 0.0),
              stops: [0.2, 0.7],
              colors: [Constants.bgColorGradient1, Constants.bgColorGradient2],
            ),
          ),
          child: Stack(children: [
            Container(
               color: Colors.purpleAccent,
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              child: Column(
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('Welcome,',
                            style: TextStyle(
                              color: Colors.grey[100],
                              fontSize: SizeConfig.blockSizeHorizontal * 4.6,
                            )),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [

                            SizedBox(width: 15),
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).pushNamed('/profile');
                              },
                              child: Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border:
                                      Border.all(color: Colors.white, width: 2),
                                  image: DecorationImage(
                                    image: AssetImage(_user.getUser.image),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ]),
                  Row(children: [
                    Text("Freddy",

                        style: TextStyle(
                            color: Colors.white,
                            // fontSize: 28,
                            fontSize: SizeConfig.blockSizeHorizontal * 4.6,

                            fontWeight: FontWeight.w500
                        )),
                  ]),
                ],
              ),
            )),
            Padding(
              padding: const EdgeInsets.only(top: 100),
              child: Container(
                decoration: BoxDecoration(
                    color: Color(0xfff1f1f1),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25))),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
                  child: Column(children: [
                    /// BALANCE
                    Column(
                      children: [
                        Row(
                          children: <Widget>[

                            colorCard1("Deposit", 10000.0, 1, context,
                                Constants.balanceCard),

                            colorCard1("Withdraw", 20500.0, -1, context,
                                Constants.activeCard),

                          ],
                        ),
                        Row(
                          children: <Widget>[

                            colorCard("Balance", 10000.0, 1, context,
                                Constants.balanceCard),
                            colorCard("Active loan", 20500.0, -1, context,
                                Constants.activeCard),

                          ],
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              /// Portfolio Value - It is the cumulative value of all the investments
                              /// or stocks held by an individual or company at a specific period.
                              Padding(
                                padding:
                                const EdgeInsets.fromLTRB(15.0, 10, 0, 0),
                                child: Text('Available Loan',
                                    style: TextStyle(
                                      color: Constants.bgColor,
                                      fontWeight: FontWeight.w600,
                                      fontSize:
                                      SizeConfig.blockSizeHorizontal * 6,
                                    )),
                              ),
                            ],
                          ),
                        ),

                      ],
                    ),

                    /// Stocks
                    Column(
                      children: [
                        PortfolioPosition(
                            theme: theme,
                            image: Icons.stacked_bar_chart,
                            symbol: "TSLA",
                            totalQuantity: 5.0,
                            equityValue: 300000.0,
                            ),

                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              /// Portfolio Value - It is the cumulative value of all the investments
                              /// or stocks held by an individual or company at a specific period.
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(15.0, 10, 0, 0),
                                child: Text('Invite friends',
                                    style: TextStyle(
                                      color: Constants.bgColor,
                                      fontWeight: FontWeight.w600,
                                      fontSize:
                                          SizeConfig.blockSizeHorizontal * 6,
                                    )),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            colorCard1("Earn points", 10.00, 1, context,
                                Constants.balanceCard),
                            SizedBox(width: 100,),
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).pushNamed('/logout');
                              },
                              child: Icon(Icons.logout,
                                  color: Colors.black, size: 30),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ]),
                ),
              ),
            ),
            BottomNavBar(theme: theme, index: 0)
          ]),
        ),
      ),
    );
  }
}
