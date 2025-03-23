import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/providerClass/main_provider_class.dart';

class MyListTile extends StatelessWidget {
  final IconData icon;
  final String text;
  final IconData lastIcon;
  final int index;
  final Function()? onTap;
  // final Function()? onTap;
  const MyListTile({
    super.key,
    required this.icon,
    required this.text,
    required this.lastIcon,
    required this.index,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.only(
          left: 20,
          right: 40,
          bottom: 20,
          top: 20,
        ),
        decoration: BoxDecoration(
          color:
              context.watch<ProviderClass>().currentPage ==
                      index
                  ? Colors.grey.shade100
                  : Colors.transparent,
        ),
        child: Row(
          children: [
            Icon(
              color:
                  context
                              .watch<ProviderClass>()
                              .currentPage ==
                          index
                      ? Colors.grey.shade600
                      : Colors.grey.shade400,
              size: 22,
              icon,
            ),
            SizedBox(width: 15),
            Expanded(
              child: Text(
                style: TextStyle(
                  letterSpacing: 1.5,
                  color:
                      context
                                  .watch<ProviderClass>()
                                  .currentPage ==
                              index
                          ? Colors.grey.shade700
                          : Colors.grey.shade500,
                  fontWeight:
                      context
                                  .watch<ProviderClass>()
                                  .currentPage ==
                              index
                          ? FontWeight.bold
                          : FontWeight.normal,
                  fontSize:
                      context
                                  .watch<ProviderClass>()
                                  .currentPage ==
                              index
                          ? 14
                          : 13,
                ),
                text,
              ),
            ),
            Icon(
              color:
                  context
                              .watch<ProviderClass>()
                              .currentPage ==
                          index
                      ? Colors.grey.shade600
                      : Colors.grey.shade400,
              size: 20,
              lastIcon,
            ),
          ],
        ),
      ),
    );
  }
}
