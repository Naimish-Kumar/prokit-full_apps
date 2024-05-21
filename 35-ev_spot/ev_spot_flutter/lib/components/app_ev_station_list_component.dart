import 'package:ev_spot_flutter/main.dart';
import 'package:ev_spot_flutter/models/ev_station_places_model.dart';
import 'package:ev_spot_flutter/utils/colors.dart';
import 'package:ev_spot_flutter/utils/common.dart';
import 'package:flutter/material.dart';

class EvStationListComponent extends StatefulWidget {
  const EvStationListComponent({Key? key, this.modelObj}) : super(key: key);

  final EVStationPlacesModel? modelObj;

  @override
  State<EvStationListComponent> createState() => _EvStationListComponentState();
}

class _EvStationListComponentState extends State<EvStationListComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: appStore.isDarkMode ? Colors.black : Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        clipBehavior: Clip.hardEdge,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(topRight: Radius.circular(10), topLeft: Radius.circular(10)),
                child: Image.asset(
                  widget.modelObj!.image != null ? widget.modelObj!.image! : " ",
                  filterQuality: FilterQuality.high,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(height: 120, color: Colors.grey);
                  },
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(color: appStore.isDarkMode ? Colors.black : Colors.white, blurRadius: 25, blurStyle: BlurStyle.normal, offset: Offset(0, 1), spreadRadius: 40),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 10, top: 5, right: 10, left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (widget.modelObj!.stTitle != null)
                      Text(
                        "${widget.modelObj!.stTitle!}",
                        style: boldTextStyle(),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    SizedBox(height: 8),
                    Text(
                      "${widget.modelObj!.stAddress!}",
                      style: secondaryTextStyle(color: appStore.isDarkMode ? Theme.of(context).colorScheme.onSurface : textSecondaryLightColor),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Connections', style: secondaryTextStyle(color: appStore.isDarkMode ? Theme.of(context).colorScheme.onSurface : textSecondaryLightColor)),
                              SizedBox(height: 8),
                              Text(widget.modelObj!.connection ?? '1 Points', style: boldTextStyle(), maxLines: 1, overflow: TextOverflow.ellipsis),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Amenities', style: secondaryTextStyle(color: appStore.isDarkMode ? Theme.of(context).colorScheme.onSurface : textSecondaryLightColor)),
                              Wrap(
                                children: List.generate(widget.modelObj!.amenitiesIconList!.length, (index) {
                                  return Container(
                                    margin: EdgeInsets.only(right: 15, top: 6),
                                    child: Image.asset(widget.modelObj!.amenitiesIconList![index], height: 20, width: 20, color: appStore.isDarkMode ? Colors.white : Colors.black),
                                  );
                                }),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 35,
                          margin: EdgeInsets.only(top: 6),
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(color: Theme.of(context).colorScheme.primary, borderRadius: BorderRadius.circular(6)),
                          child: Icon(Icons.navigation, size: 18, color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
          Positioned(
            child: Opacity(
              opacity: 0.6,
              child: Container(
                width: 70,
                height: 30,
                padding: EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(10), topLeft: Radius.circular(10)),
                ),
                child: Center(child: Text(widget.modelObj!.status ?? 'Close', style: secondaryTextStyle(color: Colors.white))),
              ),
            ),
          ),
          Positioned(
            right: 5,
            top: -1,
            child: GestureDetector(
              onTap: () {
                widget.modelObj!.wishList = !widget.modelObj!.wishList!;
                setState(() {});
              },
              child: Container(
                padding: EdgeInsets.all(6),
                child: widget.modelObj!.wishList! ? Icon(Icons.favorite, size: 22, color: Colors.red) : Icon(Icons.favorite_outline, size: 22, color: Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
