import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:widget/constants/color_constant.dart';
import 'package:widget/constants/style_constant.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:widget/models/carousel_model.dart';
import 'package:widget/models/news_model.dart';
import 'package:widget/models/popular_destination_model.dart';
import 'package:widget/widget/bottom_navigation.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _current = 0;

  List<data> paging<data>(List list, Function handler) {
    List<data> hasil = [];
    for (int i = 0; i < list.length; i++) {
      hasil.add(handler(i, list[i]));
    }
    return hasil;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SvgPicture.asset('assets/svg/travelkuy_logo.svg'),
        backgroundColor: cBackground,
        elevation: 0,
      ),
      bottomNavigationBar: BottomNavigationWidget(),
      body: Container(
        padding: EdgeInsets.all(20),
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Text(
                'Hi Mulyawan',
                style: sTitle,
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 200,
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 200,
                      child: Swiper(
                        itemCount: carousels.length,
                        onIndexChanged: (index) {
                          setState(() {
                            _current = index;
                          });
                        },
                        layout: SwiperLayout.DEFAULT,
                        autoplay: true,
                        itemBuilder: (BuildContext context, index) {
                          return Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              image: DecorationImage(
                                image: AssetImage(carousels[index].image),
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: paging(carousels, (index, apa) {
                          return Container(
                            margin: EdgeInsets.only(right: 2),
                            alignment: Alignment.centerLeft,
                            width: 10,
                            height: 10,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: _current == index ? cBlue : cGrey,
                            ),
                          );
                        }),
                      ),
                      Text(
                        'Selengkapnya...',
                        style: sMoreDiscount,
                      )
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 24),
              child: Text(
                'Let\' Booking',
                style: sTitle,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 12),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(12),
                          margin: EdgeInsets.only(right: 6),
                          height: 60,
                          decoration: BoxDecoration(
                              color: cFill,
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                color: cBorder,
                                width: 1,
                              )),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SvgPicture.asset(
                                  'assets/svg/service_flight_icon.svg'),
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Flight',
                                      style: sServiceTitle,
                                    ),
                                    Text(
                                      'Feel Freedom',
                                      style: sServiceSubTitle,
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(12),
                          margin: EdgeInsets.only(left: 6),
                          height: 60,
                          decoration: BoxDecoration(
                            color: cFill,
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                              color: cBorder,
                              width: 1,
                            ),
                          ),
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                  'assets/svg/service_train_icon.svg'),
                              Container(
                                margin: EdgeInsets.only(left: 10),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Train',
                                      style: sServiceTitle,
                                    ),
                                    Text(
                                      'Intercity',
                                      style: sServiceSubTitle,
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(12),
                          height: 64,
                          margin: EdgeInsets.only(right: 6),
                          decoration: BoxDecoration(
                              color: cFill,
                              border: Border.all(
                                width: 1,
                                color: cBorder,
                              ),
                              borderRadius: BorderRadius.circular(16)),
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                  'assets/svg/service_hotel_icon.svg'),
                              Container(
                                margin: EdgeInsets.only(left: 10),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Hotel',
                                      style: sServiceTitle,
                                    ),
                                    Text(
                                      'Let\'s take a break',
                                      style: sServiceSubTitle,
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(12),
                          height: 64,
                          margin: EdgeInsets.only(left: 6),
                          decoration: BoxDecoration(
                              color: cFill,
                              border: Border.all(
                                width: 1,
                                color: cBorder,
                              ),
                              borderRadius: BorderRadius.circular(16)),
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                  'assets/svg/service_hotel_icon.svg'),
                              Container(
                                margin: EdgeInsets.only(left: 10),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Hotel',
                                      style: sServiceTitle,
                                    ),
                                    Text(
                                      'Let\'s take a break',
                                      style: sServiceSubTitle,
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 24),
              child: Text(
                'Popular Destination',
                style: sTitle,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 12),
              height: 170,
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: populars.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.all(12),
                    margin: EdgeInsets.only(right: 12),
                    width: MediaQuery.of(context).size.width / 3,
                    decoration: BoxDecoration(
                      color: cFill,
                      border: Border.all(
                        width: 1,
                        color: cBorder,
                      ),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      children: [
                        Image.asset(populars[index].image),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Text(
                            populars[index].name,
                            style: sPopularDestinationTitle,
                          ),
                        ),
                        Align(
                          alignment: Alignment.topCenter,
                          child: Text(
                            populars[index].country,
                            style: sPopularDestinationSubTitle,
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 24),
              child: Text(
                'News',
                style: sTitle,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 12),
              width: MediaQuery.of(context).size.width / 2,
              height: 200,
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: newsModel.length,
                itemBuilder: (context, index) {
                  return Container(
                    width: MediaQuery.of(context).size.width / 2,
                    margin: EdgeInsets.only(right: 12),
                    child: Column(
                      children: [
                        Expanded(
                          child: Stack(
                            children: [
                              Container(
                                height: 200,
                                width: MediaQuery.of(context).size.width / 2,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(newsModel[index].image),
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              Positioned(
                                child: SvgPicture.asset(
                                    'assets/svg/travlog_top_corner.svg'),
                                top: 0,
                                right: 0,
                              ),
                              Positioned(
                                child: SvgPicture.asset(
                                    'assets/svg/travelkuy_logo_white.svg'),
                                top: 8,
                                right: 8,
                              ),
                              Positioned(
                                child: SvgPicture.asset(
                                    'assets/svg/travlog_bottom_gradient.svg'),
                                bottom: 0,
                                left: 0,
                              ),
                              Positioned(
                                child: Text(
                                  'News: ' + newsModel[index].name,
                                  style: sTravLogTitle,
                                ),
                                bottom: 8,
                                left: 8,
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Text(
                          newsModel[index].content,
                          style: sTravLogContent,
                          maxLines: 2,
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          newsModel[index].place,
                          style: sTravLogPlace,
                          maxLines: 3,
                        ),
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
