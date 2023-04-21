import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:refuge_user/ui/widgets/custom_card.dart';

import 'custom_search_input_field.dart';
import 'no_glow_behavior_scroll.dart';

class CustomSelectBoxItem {
  final String label;
  final dynamic value;

  CustomSelectBoxItem({required this.label, required this.value});
}

class CustomSelectBox extends StatefulWidget {
  final List<CustomSelectBoxItem> items;
  final String label;
  final IconData iconData;
  final Function(CustomSelectBoxItem?) onChange;
  const CustomSelectBox({
    Key? key,
    required this.items,
    required this.label,
    required this.onChange,
    required this.iconData,
  }) : super(key: key);

  @override
  State<CustomSelectBox> createState() => _CustomSelectBoxState();
}

class _CustomSelectBoxState extends State<CustomSelectBox> {
  CustomSelectBoxItem? _selectedItem;

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      child: InkWell(
        onTap: () {
          showDialog(
            context: context,
            builder: (context) => CustomSelectBoxDialog(
              label: widget.label,
              items: widget.items,
              onSelect: (item) {
                widget.onChange(item);
                _selectedItem = item;
                setState(() {});
              },
            ),
          );
        },
        borderRadius: BorderRadius.circular(30),
        focusColor: Colors.grey[50],
        hoverColor: Colors.grey[50],
        splashColor: Colors.grey[100],
        highlightColor: Colors.grey[50],
        child: Padding(
          padding: EdgeInsets.only(
            left: 10,
            right: _selectedItem != null ? 3 : 20,
            top: _selectedItem != null ? 3 : 12,
            bottom: _selectedItem != null ? 3 : 12,
          ),
          child: Row(
            children: [
              Icon(
                widget.iconData,
                color: Colors.blue[900],
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  _selectedItem != null ? _selectedItem!.label : widget.label,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.roboto(
                    textStyle: Theme.of(context).textTheme.subtitle1!.copyWith(
                          color: _selectedItem != null
                              ? Colors.black87
                              : Colors.black54,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              _selectedItem != null
                  ? SizedBox(
                      width: 80,
                      height: 43,
                      child: Material(
                        color: Colors.blue[50],
                        borderRadius: BorderRadius.circular(30),
                        child: InkWell(
                          onTap: () {
                            _selectedItem = null;
                            widget.onChange(null);
                            setState(() {});
                          },
                          focusColor: Colors.white10,
                          hoverColor: Colors.white10,
                          highlightColor: Colors.white10,
                          splashColor: Colors.white12,
                          child: Center(
                            child: Text(
                              'Clear',
                              style: GoogleFonts.roboto(
                                textStyle: Theme.of(context)
                                    .textTheme
                                    .button!
                                    .copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black87,
                                    ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  : const Icon(
                      Icons.keyboard_arrow_down_rounded,
                      // color: iconColor,
                    ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomSelectBoxDialog extends StatefulWidget {
  final List<CustomSelectBoxItem> items;
  final String label;
  final Function(CustomSelectBoxItem) onSelect;

  const CustomSelectBoxDialog({
    Key? key,
    required this.label,
    required this.items,
    required this.onSelect,
  }) : super(key: key);

  @override
  State<CustomSelectBoxDialog> createState() => _CustomSelectBoxDialogState();
}

class _CustomSelectBoxDialogState extends State<CustomSelectBoxDialog> {
  List<CustomSelectBoxItem> itemData = [];

  @override
  void initState() {
    itemData = widget.items;
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      // backgroundColor: backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      insetPadding: const EdgeInsets.symmetric(
        horizontal: 25,
        vertical: 70,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 10,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    widget.label,
                    style: GoogleFonts.poppins(
                      textStyle:
                          Theme.of(context).textTheme.headline6!.copyWith(
                                fontWeight: FontWeight.bold,
                                // color: titleColor,
                              ),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.close_rounded,
                    // color: iconMutedColor,
                  ),
                )
              ],
            ),
            const Divider(),
            CustomSearchInputField(
              onChange: (value) {
                if (value.isNotEmpty) {
                  itemData = [];
                  for (CustomSelectBoxItem item in widget.items) {
                    if (item.label.toLowerCase().contains(value)) {
                      itemData.add(item);
                    }
                  }
                } else {
                  itemData = widget.items;
                }
                setState(() {});
              },
            ),
            const Divider(
              height: 1,
            ),
            itemData.isNotEmpty
                ? Flexible(
                    child: NoGlowBehaviorScroll(
                      child: ListView.separated(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        shrinkWrap: true,
                        itemBuilder: (context, index) => Material(
                          color: Colors.blue[50],
                          borderRadius: BorderRadius.circular(30),
                          child: InkWell(
                            onTap: () {
                              widget.onSelect(itemData[index]);
                              Navigator.pop(context);
                            },
                            borderRadius: BorderRadius.circular(30),
                            focusColor: Colors.grey[50],
                            hoverColor: Colors.grey[50],
                            splashColor: Colors.grey[100],
                            highlightColor: Colors.grey[50],
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 15,
                                horizontal: 20,
                              ),
                              child: Text(
                                itemData[index].label,
                                style: GoogleFonts.roboto(
                                  textStyle: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                        // color: titleColor,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        separatorBuilder: (context, index) => const Divider(
                          height: 5,
                        ),
                        itemCount: itemData.length,
                      ),
                    ),
                  )
                : const Center(
                    child: Text(
                      'No items found',
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
