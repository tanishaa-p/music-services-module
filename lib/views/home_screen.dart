import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import '../view_models/home_view_model.dart';
import '../widgets/promotional_banner.dart';
import '../widgets/service_card.dart';
import '../services/locator.dart';
import 'package:flutter_svg/flutter_svg.dart';

const String vinylSvg='''
<svg width="121" height="121" viewBox="0 0 121 121" fill="none" xmlns="http://www.w3.org/2000/svg">
<path d="M60.5 105.875C85.5599 105.875 105.875 85.5599 105.875 60.5C105.875 35.4401 85.5599 15.125 60.5 15.125C35.4401 15.125 15.125 35.4401 15.125 60.5C15.125 85.5599 35.4401 105.875 60.5 105.875Z" fill="#A90140"/>
<path d="M29.9475 69.8019L22.385 72.1274C24.2867 78.3858 27.6967 84.0813 32.3153 88.7131C36.9339 93.3449 42.6196 96.7711 48.8727 98.6906L51.1981 91.1281C46.1716 89.6024 41.6006 86.8566 37.8928 83.1355C34.1849 79.4145 31.4554 74.8338 29.9475 69.8019Z" fill="#B95F81"/>
<path d="M88.727 32.273C84.1066 27.6254 78.4018 24.2012 72.1273 22.3094L69.8019 29.8719C74.8284 31.3976 79.3994 34.1434 83.1072 37.8645C86.8151 41.5855 89.5446 46.1662 91.0525 51.1981L98.615 48.8727C96.7449 42.6058 93.3472 36.9017 88.727 32.273Z" fill="#B95F81"/>
<path d="M40.9509 66.4555L36.0542 67.9491C37.2726 71.9658 39.4629 75.62 42.4309 78.588C45.3989 81.556 49.0531 83.7463 53.0698 84.9647L54.5634 80.068C51.351 79.1014 48.4281 77.3539 46.056 74.9818C43.6839 72.6097 41.9364 69.6868 40.9698 66.4744L40.9509 66.4555Z" fill="#B95F81"/>
<path d="M78.5744 42.4256C75.6082 39.4633 71.9594 37.2753 67.9491 36.0542L66.4555 40.9509C69.6679 41.9175 72.5908 43.665 74.9629 46.0371C77.335 48.4092 79.0825 51.3321 80.0491 54.5445L84.9458 53.0509C83.7247 49.0406 81.5367 45.3918 78.5744 42.4256Z" fill="#B95F81"/>
<path d="M60.5 76.6648C69.4276 76.6648 76.6648 69.4276 76.6648 60.5C76.6648 51.5724 69.4276 44.3352 60.5 44.3352C51.5724 44.3352 44.3352 51.5724 44.3352 60.5C44.3352 69.4276 51.5724 76.6648 60.5 76.6648Z" fill="#B95F81"/>
<path d="M60.5 76.6648C69.4276 76.6648 76.6648 69.4276 76.6648 60.5C76.6648 51.5724 69.4276 44.3352 60.5 44.3352C51.5724 44.3352 44.3352 51.5724 44.3352 60.5C44.3352 69.4276 51.5724 76.6648 60.5 76.6648Z" fill="#DCDFE2"/>
<path d="M60.5 66.5689C63.8518 66.5689 66.5689 63.8518 66.5689 60.5C66.5689 57.1482 63.8518 54.4311 60.5 54.4311C57.1482 54.4311 54.4311 57.1482 54.4311 60.5C54.4311 63.8518 57.1482 66.5689 60.5 66.5689Z" fill="white"/>
</svg>

''';

const String pianoSvg='''
<svg width="135" height="135" viewBox="0 0 135 135" fill="none" xmlns="http://www.w3.org/2000/svg">
<path d="M90.5823 10.5516L5.70511 69.9705C2.86076 71.9625 0.924107 75.0027 0.321066 78.4225C-0.281975 81.8423 0.497985 85.3615 2.48941 88.2063L25.9848 121.77C27.9768 124.614 31.0171 126.551 34.4368 127.154C37.8566 127.757 41.3758 126.977 44.2206 124.986L129.098 65.5668C131.942 63.5757 133.88 60.5361 134.483 57.1168C135.087 53.6974 134.307 50.1784 132.316 47.3337L108.81 13.77C106.819 10.9269 103.78 8.99086 100.362 8.38735C96.9444 7.78384 93.4266 8.5623 90.5823 10.5516Z" fill="#A90140"/>
<path d="M123.619 61.2711L40.2975 119.281C39.8548 119.589 39.3537 119.803 38.8251 119.91C38.2965 120.017 37.7516 120.015 37.2239 119.903C36.6962 119.792 36.197 119.573 35.7569 119.261C35.3169 118.949 34.9454 118.551 34.6653 118.09L31.7331 113.4L12.3795 82.4148L20.979 76.41L27.0432 72.1656L29.781 70.2513L34.2306 67.1463L35.8506 66.0123L42.4575 61.3926L44.0181 60.3126L48.5298 57.159L53.0631 54L55.7955 52.0938L59.13 49.7475L66.69 44.4663L73.5102 39.69L76.2696 37.7595L78.8103 35.991L80.5005 34.8057L85.7925 31.1067L87.1803 30.1455L89.9289 28.2231L92.4453 26.46L101.158 20.3715L120.887 50.1525L124.667 55.8549C125.234 56.7159 125.441 57.7642 125.245 58.7762C125.05 59.7881 124.466 60.6834 123.619 61.2711Z" fill="#FFF1E8"/>
<path d="M44.01 60.3045C48.6243 67.4001 58.4658 80.1387 58.4658 80.1387L64.1547 90.9387L57.8961 103.459L53.2629 97.6536L34.2198 67.1436" stroke="#5297B7" stroke-width="4.22" stroke-miterlimit="10"/>
<path d="M66.6873 44.4663L87.4989 76.7232L77.8248 88.1037L69.2874 73.8774L55.7955 52.0803" stroke="#5297B7" stroke-width="4.22" stroke-miterlimit="10"/>
<path d="M112.539 64.2033L89.9289 28.2312" stroke="#F13D23" stroke-width="4.22" stroke-miterlimit="10"/>
<path d="M76.2723 37.7676L98.3124 71.6013L45.387 111.437L30.0213 82.9818" stroke="#F13D23" stroke-width="4.22" stroke-miterlimit="10"/>
<path d="M40.77 94.6944L35.586 98.0235C35.5178 98.0675 35.4416 98.0977 35.3617 98.1121C35.2819 98.1266 35.1999 98.1251 35.1206 98.1078C35.0414 98.0905 34.9663 98.0577 34.8997 98.0112C34.8331 97.9648 34.7764 97.9056 34.7328 97.8372L20.979 76.41L27.0432 72.1656L40.959 93.8412C41.0456 93.9798 41.0743 94.1469 41.0389 94.3064C41.0036 94.466 40.907 94.6053 40.77 94.6944Z" fill="#242024"/>
<path d="M49.8771 89.0028L44.6931 92.34C44.6247 92.3841 44.5483 92.4143 44.4682 92.4288C44.3881 92.4433 44.306 92.4419 44.2265 92.4246C44.147 92.4072 44.0716 92.3744 44.0048 92.3279C43.938 92.2814 43.8811 92.2222 43.8372 92.1537L29.781 70.2513L34.2306 67.1463L35.8506 66.0123L50.0607 88.1523C50.1476 88.2898 50.1771 88.456 50.1428 88.6151C50.1084 88.7741 50.013 88.9134 49.8771 89.0028Z" fill="#242024"/>
<path d="M62.397 79.8984L57.213 83.2275C57.1446 83.2716 57.0682 83.3018 56.9881 83.3163C56.908 83.3308 56.8259 83.3294 56.7464 83.3121C56.6669 83.2947 56.5915 83.2619 56.5247 83.2154C56.4579 83.1689 56.401 83.1097 56.3571 83.0412L42.4602 61.3926L44.0208 60.3126L48.5325 57.159L62.5725 79.0533C62.6579 79.1896 62.6873 79.3536 62.6546 79.5111C62.6219 79.6686 62.5296 79.8073 62.397 79.8984Z" fill="#242024"/>
<path d="M72.63 71.9307L67.446 75.2598C67.3776 75.3039 67.3012 75.3341 67.2211 75.3486C67.141 75.3631 67.0589 75.3617 66.9794 75.3444C66.8999 75.327 66.8245 75.2942 66.7577 75.2477C66.6909 75.2013 66.634 75.142 66.5901 75.0735L53.0631 54L55.7955 52.0938L59.13 49.7475L72.8217 71.0775C72.9087 71.2163 72.9374 71.3838 72.9015 71.5436C72.8656 71.7034 72.768 71.8425 72.63 71.9307Z" fill="#242024"/>
<path d="M92.34 58.2093L87.9525 61.0335C87.8839 61.0775 87.8074 61.1075 87.7272 61.1218C87.647 61.1361 87.5648 61.1344 87.4853 61.1169C87.4057 61.0993 87.3305 61.0662 87.2638 61.0195C87.1971 60.9727 87.1402 60.9133 87.0966 60.8445L73.5102 39.69L76.2696 37.7595L78.8103 35.991L92.5182 57.348C92.5639 57.416 92.5955 57.4924 92.6113 57.5728C92.6271 57.6532 92.6267 57.7359 92.6101 57.8161C92.5935 57.8963 92.5611 57.9724 92.5147 58.0399C92.4683 58.1074 92.4089 58.165 92.34 58.2093Z" fill="#242024"/>
<path d="M99.1602 53.0874L94.77 55.9116C94.7017 55.9555 94.6253 55.9855 94.5453 55.9998C94.4654 56.014 94.3834 56.0123 94.304 55.9948C94.2247 55.9772 94.1497 55.9441 94.0832 55.8974C94.0168 55.8507 93.9602 55.7913 93.9168 55.7226L80.4978 34.8138L85.7898 31.1148L99.36 52.2342C99.4034 52.3032 99.4327 52.3801 99.4462 52.4605C99.4597 52.5409 99.457 52.6232 99.4384 52.7026C99.4199 52.7819 99.3857 52.8568 99.3379 52.9229C99.2902 52.989 99.2297 53.0449 99.1602 53.0874Z" fill="#242024"/>
<path d="M106.331 48.06L102.233 50.7924C102.098 50.8819 101.933 50.9152 101.774 50.8855C101.615 50.8558 101.473 50.7653 101.38 50.6331L87.1803 30.1671L89.9289 28.2447L92.4453 26.46L106.501 47.1717C106.55 47.2407 106.584 47.3188 106.602 47.4013C106.62 47.4838 106.621 47.569 106.605 47.6519C106.589 47.7348 106.557 47.8136 106.51 47.8838C106.463 47.9539 106.402 48.0138 106.331 48.06Z" fill="#242024"/>
<path d="M124.708 61.5411L39.3876 120.941C38.9341 121.256 38.4209 121.476 37.8795 121.585C37.3382 121.695 36.7801 121.692 36.2397 121.578C35.6993 121.464 35.1879 121.241 34.737 120.922C34.2861 120.603 33.9052 120.195 33.6177 119.723L30.618 114.92L121.91 50.1633L125.782 56.0034C126.358 56.885 126.568 57.9563 126.368 58.9901C126.167 60.0239 125.572 60.9389 124.708 61.5411Z" fill="#A90140"/>
</svg>

''';
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double gradientHeight = MediaQuery.of(context).size.height * 0.43;
    final double bannerHeight = MediaQuery.of(context).size.height * 0.23;
    return ChangeNotifierProvider<HomeViewModel>(
      create: (_) => locator<HomeViewModel>()..loadServices(),
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              height: gradientHeight, // Adjust height to cover search bar + banner
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFFA90140),
                    Color(0xFF550120),
                  ],
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(24),  // Adjust value to match your design
                  bottomRight: Radius.circular(24), // Adjust value to match your design
                  topLeft: Radius.circular(0),
                  topRight: Radius.circular(0),
                ),
              ),
            ),

            SafeArea(
              child: Column(
                children: [
                  // Search Bar
                  Container(
                    margin: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                              color: Colors.grey.shade800,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Search "Punjabi Lyrics"',
                                hintStyle: TextStyle(color: Colors.grey),
                                border: InputBorder.none,
                                prefixIcon: Icon(Icons.search, color: Colors.grey),
                                suffixIcon: Container(
                                  margin: const EdgeInsets.only(right: 8), // Optional: adjust spacing
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Container(
                                        width: 1,
                                        height: 24,
                                        color: Colors.grey.withOpacity(0.4), // Faint vertical line
                                        margin: const EdgeInsets.symmetric(horizontal: 8),
                                      ),
                                      Icon(Icons.mic, color: Colors.grey),
                                    ],
                                  ),
                                ),
                                contentPadding: EdgeInsets.symmetric(vertical: 12),
                              ),
                              style: GoogleFonts.syne(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        // Profile Icon
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.grey.shade800,
                            shape: BoxShape.circle,
                          ),
                          padding: const EdgeInsets.all(8),
                          child: const Icon(
                            Icons.account_circle,
                            color: Colors.white,
                            size: 32,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Promotional Banner
                  //const PromotionalBanner(),
                  SizedBox(
                    width: double.infinity,
                    height:bannerHeight,
                    child:Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Positioned(
                          left: -28,
                          top: 0,
                          bottom: 0,
                          child: Center(
                            child: SvgPicture.string(
                              vinylSvg,
                              width: 80,
                              height: 80,
                            ),
                          ),
                        ),
                        // Piano SVG overflowing right
                        Positioned(
                          right: -28,
                          top: 0,
                          bottom: 0,
                          child: Center(
                            child: SvgPicture.string(
                              pianoSvg,
                              width: 80,
                              height: 80,
                            ),
                          ),
                        ),
                        Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Claim your',
                                style: GoogleFonts.syne(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                'Free Demo',
                                style: GoogleFonts.lobster(
                                  color: Colors.white,
                                  fontSize: 45,
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.italic,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                'for custom Music Production',
                                style: GoogleFonts.syne(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 16),
                              ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  foregroundColor: Colors.black,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                                ),
                                child: Text(
                                  'Book Now',
                                  style: GoogleFonts.syne(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 13,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Services Section
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Hire hand-picked Pros for popular music services',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Services List
                  Expanded(
                    child: Consumer<HomeViewModel>(
                      builder: (context, viewModel, child) {
                        if (viewModel.isLoading) {
                          return const Center(
                            child: CircularProgressIndicator(color: Colors.pink),
                          );
                        }

                        if (viewModel.error != null) {
                          return Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Error: ${viewModel.error}',
                                  style: const TextStyle(color: Colors.red),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: 16),
                                ElevatedButton(
                                  onPressed: () => viewModel.loadServices(),
                                  child: const Text('Retry'),
                                ),
                              ],
                            ),
                          );
                        }

                        return ListView.builder(
                          itemCount: viewModel.services.length,
                          itemBuilder: (context, index) {
                            final service = viewModel.services[index];
                            return ServiceCard(
                              service: service,
                              onTap: () => viewModel.navigateToServiceDetail(
                                context,
                                service,
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),


        // Bottom Navigation
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.black,
          selectedItemColor: Colors.pink,
          unselectedItemColor: Colors.grey,
          currentIndex: 0,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.newspaper),
              label: 'News',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.feed),
              label: 'TrueFeed',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.work),
              label: 'Projects',
            ),
          ],
        ),
      ),
    );
  }
}
