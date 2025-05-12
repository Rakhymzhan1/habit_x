import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_x/blocs/tracker_cubit/tracker_cubit.dart';
import 'package:habit_x/blocs/tracker_cubit/tracker_state.dart';
import 'package:habit_x/themes/text_temes.dart';
import 'package:habit_x/widgets/custom_float_button.dart';
import 'package:habit_x/widgets/custom_text_form_field.dart';
import 'package:habit_x/widgets/empty_message.dart';

class TrackerPage extends StatefulWidget {
  const TrackerPage({super.key});

  @override
  State<TrackerPage> createState() => _TrackerPageState();
}

class _TrackerPageState extends State<TrackerPage> {
  final TrackerCubit _trackerCubit = TrackerCubit();
  var selectedBarIndex = 0;

  get daysOfWeek => [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday',
  ];
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _trackerCubit,
      child: Scaffold(
        body: BlocBuilder<TrackerCubit, TrackerState>(
          builder: (BuildContext context, state) {
            switch (state.status) {
              case TrackerStatus.initial:
                return const EmptyMessage(
                  message: 'Reaching goals through \nforming habits.',
                  description:
                      '''“Goals have to be clear, simple, and in writing. If\nthey aren’t in writing and reviewed daily, they\naren’t really goals. They’ re wishes.”''',
                );
              case TrackerStatus.loading:
                return const Center(child: CircularProgressIndicator());
              case TrackerStatus.loaded:
                return ListView.builder(
                  itemCount: state.trackerItems.length + 1,
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: SizedBox(
                          height: 40,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              SizedBox(width: 10),
                              tabWidget(index: 0, label: 'Development'),
                              SizedBox(width: 10),
                              tabWidget(index: 1, label: 'Sport'),
                              SizedBox(width: 10),
                              tabWidget(index: 2, label: 'Health'),
                              SizedBox(width: 10),
                              tabWidget(index: 3, label: 'Other'),
                              SizedBox(width: 10),
                            ],
                          ),
                        ),
                      );
                    }
                    final indexa = index - 1;
                    final trackerItem = state.trackerItems[indexa];
                    return Container(
                      margin: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 20,
                      ),
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            trackerItem.name,
                            style: AppTextThemes.bodyMedium.copyWith(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 10),
                          SizedBox(
                            height: 30,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children:
                                  state.trackerItems[indexa].daysOfWeek
                                      .asMap()
                                      .entries
                                      .where((entry) => entry.value)
                                      .map(
                                        (entry) => Container(
                                          decoration: BoxDecoration(
                                            color:
                                                Theme.of(
                                                  context,
                                                ).colorScheme.primary,
                                            borderRadius: BorderRadius.circular(
                                              10,
                                            ),
                                          ),
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 10,
                                            vertical: 5,
                                          ),
                                          margin: const EdgeInsets.only(
                                            right: 5,
                                          ),
                                          child: Text(
                                            daysOfWeek[entry.key],
                                            style: AppTextThemes.bodyMedium
                                                .copyWith(
                                                  fontSize: 14,
                                                  color: Colors.black,
                                                ),
                                          ),
                                        ),
                                      )
                                      .toList(),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              default:
                return EmptyMessage(
                  message: 'Reaching goals through \nforming habits.',
                  description:
                      '''“Goals have to be clear, simple, and in writing. If\nthey aren’t in writing and reviewed daily, they\naren’t really goals. They’ re wishes.”''',
                );
            }
          },
        ),
        floatingActionButton: CustomFloatingActionButton(
          icon: Icon(Icons.add),
          onPressed: () {
            showCustomBottomSheet();
          },
        ),
      ),
    );
  }

  Widget tabWidget({required String label, required int index}) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: () {
        selectedBarIndex = index;
        setState(() {});
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: index == selectedBarIndex ? Colors.white : Colors.transparent,
        ),
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Text(
          label,
          style: AppTextThemes.bodyMedium.copyWith(
            color:
                index == selectedBarIndex
                    ? Colors.black
                    : Theme.of(context).colorScheme.primary,
          ),
        ),
      ),
    );
  }

  void showCustomBottomSheet() {
    showBottomSheet(
      enableDrag: true,
      backgroundColor: Color(0xff232323),
      context: context,
      builder: (context) {
        return _BottomSheetContent(cubit: _trackerCubit);
      },
    );
  }
}

class _BottomSheetContent extends StatefulWidget {
  const _BottomSheetContent({super.key, required this.cubit});
  final TrackerCubit cubit;

  @override
  State<_BottomSheetContent> createState() => _BottomSheetContentState();
}

class _BottomSheetContentState extends State<_BottomSheetContent> {
  var selectedDays = List<bool>.generate(7, (index) => false);
  final TextEditingController _controller = TextEditingController();
  final daysOfWeek = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday',
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomTextFormField(
            hintText: 'For example - ‘Do the exercise...’',
            controller: _controller,
          ),
          SizedBox(height: 10),
          SizedBox(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return SizedBox(
                  width: 200, // Set a fixed width for each item
                  child: CheckboxListTile(
                    controlAffinity: ListTileControlAffinity.leading,
                    title: Text(daysOfWeek[index]),
                    activeColor: Theme.of(context).colorScheme.primary,
                    value: selectedDays[index],
                    onChanged: (value) {
                      selectedDays[index] = value!;
                      setState(() {});
                    },
                  ),
                );
              },
              itemCount: 7,
            ),
          ),
          SizedBox(height: 10),
          Align(
            alignment: Alignment.bottomRight,
            child: ElevatedButton(
              onPressed: () {
                widget.cubit.addTrackerItem(
                  name: _controller.text,
                  daysOfWeek: selectedDays,
                );
                Navigator.pop(context);
              },
              child: Text('Add'),
            ),
          ),
          SizedBox(height: 30),
        ],
      ),
    );
  }
}
