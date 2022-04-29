// ignore_for_file: prefer_const_constructors

import 'package:cryptowo/models/cryptocurrency.dart';
import 'package:cryptowo/services/coinlore_api.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: CoinloreAPI().getInfo(0, 20),
        builder: (context, AsyncSnapshot<List<Cryptocurrency>> snapshot) {
          if (snapshot.hasData) {
            return Container(
              padding: const EdgeInsets.only(left: 20, top: 70, right: 20),
              child: Column(
                children: <Widget>[
                  Center(
                    child: Text(
                      'Cryptocurrencies',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          width: 100,
                          color: Colors.white,
                          child: Text('Name'),
                        ),
                        Container(
                          width: 100,
                          color: Colors.white,
                          child: Text(
                            'Symbol',
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Container(
                          width: 100,
                          color: Colors.white,
                          child: Text(
                            'Price (US\$)',
                            textAlign: TextAlign.end,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Expanded(
                      child: ListView.builder(
                          padding: EdgeInsets.only(top: 0),
                          itemCount: snapshot.data?.length,
                          itemBuilder: (_, index) {
                            return Container(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
                              margin: EdgeInsets.only(bottom: 10),
                              height: 50,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.black, width: 1),
                                  borderRadius: BorderRadius.circular(4)),
                              child: Flex(
                                direction: Axis.horizontal,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Container(
                                    width: 100,
                                    color: Colors.white,
                                    child: Text(snapshot.data![index].name),
                                  ),
                                  Container(
                                    width: 100,
                                    color: Colors.white,
                                    child: Text(
                                      snapshot.data![index].symbol,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Container(
                                    width: 100,
                                    color: Colors.white,
                                    child: Text(
                                      '\$' + snapshot.data![index].priceUSD,
                                      textAlign: TextAlign.end,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )
                                ],
                              ),
                            );
                          }))
                ],
              ),
            );
          } else {
            return Container();
          }
        });
  }
}
