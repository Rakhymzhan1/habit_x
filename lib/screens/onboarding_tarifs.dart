import 'package:flutter/material.dart';
import 'package:habit_x/screens/bottom_navigation_bar_page.dart';

class OnboardingTarifs extends StatelessWidget {
  static MaterialPageRoute get route =>
      MaterialPageRoute(builder: (context) => const OnboardingTarifs());
  const OnboardingTarifs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 50),
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'HabitX Pro',
                    style: TextStyle(
                      height: 1,
                      fontSize: 32,
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  Text(
                    '   vs HabitX Free',
                    style: TextStyle(
                      height: 1,
                      fontSize: 32,
                      fontWeight: FontWeight.w400,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: SizedBox(
                height: 360,
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 40),
                        textRow(context, text: 'Cloud Sync'),
                        textRow(context, text: 'Unlimited Tasks'),
                        textRow(context, text: 'Calendar Import'),
                        textRow(context, text: 'Custom Notifications'),
                        textRow(context, text: 'Recurring Tasks'),
                        textRow(context, text: 'Reminders Sync'),
                        textRow(context, text: 'Structured AI'),
                        textRow(context, text: '550+ Icons'),
                      ],
                    ),
                    Expanded(child: SizedBox()),
                    Container(
                      height: double.infinity,
                      width: 60,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 30,
                            child: Center(
                              child: Text(
                                'Free',
                                style: TextStyle(
                                  color:
                                      Theme.of(context).scaffoldBackgroundColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ),
                          ),
                          _vWidget(context, true),
                          _vWidget(context, true),
                          _xWidget(context),
                          _xWidget(context),
                          _xWidget(context),
                          _xWidget(context),
                          _xWidget(context),
                          _xWidget(context),
                        ],
                      ),
                    ),
                    SizedBox(width: 20),
                    Container(
                      height: double.infinity,
                      width: 60,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 30,
                            child: Center(
                              child: Text(
                                'Pro',
                                style: TextStyle(
                                  color: Theme.of(context).colorScheme.primary,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ),
                          ),
                          _vWidget(context, false),
                          _vWidget(context, false),
                          _vWidget(context, false),
                          _vWidget(context, false),
                          _vWidget(context, false),
                          _vWidget(context, false),
                          _vWidget(context, false),
                          _vWidget(context, false),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(child: SizedBox()),
            Container(
              width: double.infinity,
              height: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                color: Color(0xff232323),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    Text(
                      'Try 7 days for free,  then just\n(1,990.00T) / year',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    SizedBox(height: 20),
                    SizedBox(
                      height: 45,
                      width: double.infinity,
                      child: FilledButton(
                        onPressed:()=> _startFreeTrial(context),
                        style: ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(Colors.white),
                          shape: WidgetStatePropertyAll(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                        child: Text(
                          'Start your free trial',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    SizedBox(
                      height: 45,
                      width: double.infinity,
                      child: FilledButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(Colors.white),
                          shape: WidgetStatePropertyAll(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                        child: Text(
                          'Skip For Now',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () => _showBottomSheet(context),
                          child: Text(
                            'All Plans',
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Text(
                          'Restore',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          '      Help',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _vWidget(context, bool isDark) {
    final checkColor = Colors.white;
    final fillcolor = WidgetStatePropertyAll(
      Theme.of(context).scaffoldBackgroundColor,
    );
    return SizedBox(
      height: 40,
      width: 40,
      child: Center(
        child: Checkbox(
          checkColor: isDark ? checkColor : fillcolor.value,
          value: true,
          onChanged: (_) {},
          fillColor: WidgetStatePropertyAll(
            isDark ? fillcolor.value : Theme.of(context).colorScheme.primary,
          ),
        ),
      ),
    );
  }

  _xWidget(context) {
    return SizedBox(
      height: 40,
      child: Icon(
        Icons.close,
        size: 30,
        weight: 20,
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
    );
  }

  SizedBox textRow(BuildContext context, {required String text}) {
    return SizedBox(
      height: 40,
      child: Text(
        text,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
    );
  }

  _showBottomSheet(context) {
    showModalBottomSheet(
      backgroundColor: Color(0xff232323),
      context: context,

      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(20),
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.9,
            width: double.infinity,
            child: Column(
              children: [
                Text(
                  'Choose a plan',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 10),
                _planWidget('Monthly', 'Most flexible. Try it out.', '650.00'),
                SizedBox(height: 10,),
                _planWidget('Yearly', 'Try three days for free.', '1,990.00'),
                  SizedBox(height: 10,),
                _planWidget('Lifetime', 'Buy once, keep forever! No subscription.', 'once 6,590.00T'),
              ],
            ),
          ),
        );
      },
    );
  }

  _planWidget(String title, String description, String price) {
    return Container(
      height: 120,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
      ),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                title=='Lifetime'?Text('$price', style: TextStyle(color: Colors.black, fontSize: 18),):
                Text('$price T/month', style: TextStyle(color: Colors.black, fontSize: 18),)
              ],
            ),
            Expanded(child: SizedBox()),
            Text(description,  style: TextStyle(color: Colors.black, fontSize: 12))
          ],
        ),
      ),
    );
  }

  void _startFreeTrial(context) {
    Navigator.pushAndRemoveUntil(context, BottomNavigationBarPage.route, (_)=>false);
  }
}
