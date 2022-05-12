import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../blocs/horizontal_chip_bloc.dart';

class HorizontalChipsListview extends StatelessWidget {
  final List<String?> chipsList;
  final Function(String?) onTapEbook;
  final Function onTapClear;
  HorizontalChipsListview({
    required this.chipsList,
    required this.onTapEbook,
    required this.onTapClear,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HorizontalChipBloc(),
      child: Selector<HorizontalChipBloc, List<bool>?>(
        selector: (BuildContext context, bloc) => bloc.selectedChip,
        builder: (BuildContext context, selectList, Widget? child) {
          return SizedBox(
            height: 40,
            child: ListView.builder(
              padding: const EdgeInsets.only(
                left: 8,
              ),
              scrollDirection: Axis.horizontal,
              itemCount: 1,
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    Selector<HorizontalChipBloc, bool>(
                      selector: (BuildContext context, bloc) => bloc.isShow,
                      builder: (BuildContext context, isShow, Widget? child) {
                        return GestureDetector(
                          onTap: (){
                            HorizontalChipBloc bloc =
                            Provider.of(context, listen: false);
                            bloc.setToDefault();
                            onTapClear();
                          },
                          child: Visibility(
                            visible: isShow,
                            child: const Icon(
                              Icons.cancel_outlined,
                              size: 30,
                              color: Colors.black38,
                            ),
                          ),
                        );
                      },
                    ),
                    Row(
                      children: chipsList
                          .map(
                            (category) => GestureDetector(
                              onTap: () {
                                HorizontalChipBloc bloc =
                                    Provider.of(context, listen: false);
                                onTapEbook(category);
                                bloc.isSelect(chipsList,chipsList.indexOf(category));
                                //bloc.isSelectt(chipsList.indexOf(category));
                                //selectList?[index] = true;
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 5.0,
                                ),
                                child: Chip(
                                  shape: StadiumBorder(
                                    side: BorderSide(
                                      color: selectList?[chipsList
                                                  .indexOf(category)] ==
                                              true
                                          ? Colors.white
                                          : Colors.black12,
                                    ),
                                  ),
                                  backgroundColor: selectList?[
                                              chipsList.indexOf(category)] ==
                                          true
                                      ? Colors.blue
                                      : Colors.white10,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 12.0,
                                    vertical: 10.0,
                                  ),
                                  label: Text(
                                    category ?? "",
                                    style: TextStyle(
                                        color: selectList?[chipsList
                                                    .indexOf(category)] ==
                                                true
                                            ? Colors.white
                                            : Colors.black),
                                  ),
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ],
                );
              },
            ),
          );
        },
      ),
    );
  }
}
