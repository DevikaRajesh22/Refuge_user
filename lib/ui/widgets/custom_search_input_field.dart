import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../util/input_focus_out.dart';

class CustomSearchInputField extends StatefulWidget {
  final Function(String)? onSearch, onChange;
  const CustomSearchInputField({
    Key? key,
    this.onSearch,
    this.onChange,
  }) : super(key: key);

  @override
  State<CustomSearchInputField> createState() => _CustomSearchInputFieldState();
}

class _CustomSearchInputFieldState extends State<CustomSearchInputField> {
  final TextEditingController _searchController = TextEditingController();

  String lastSearch = '';

  @override
  void initState() {
    _searchController.addListener(() {
      if (widget.onChange != null) {
        widget.onChange!(_searchController.text.trim());
      }
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _searchController,
      decoration: InputDecoration(
        fillColor: Colors.blue[50],
        filled: true,
        hintText: 'Search',
        suffixIcon: widget.onSearch != null &&
                _searchController.text.trim().isNotEmpty
            ? (_searchController.text.trim() != lastSearch)
                ? Padding(
                    padding: const EdgeInsets.only(right: 3),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 80,
                          height: 43,
                          child: Material(
                            color: Colors.blue[900],
                            borderRadius: BorderRadius.circular(30),
                            child: InkWell(
                              onTap: () {
                                if (widget.onSearch != null) {
                                  widget
                                      .onSearch!(_searchController.text.trim());
                                }
                                lastSearch = _searchController.text.trim();
                                setState(() {});
                                inputFocusOut(context);
                              },
                              focusColor: Colors.white10,
                              hoverColor: Colors.white10,
                              highlightColor: Colors.white10,
                              splashColor: Colors.white12,
                              child: Center(
                                child: Text(
                                  'Search',
                                  style: GoogleFonts.roboto(
                                    textStyle: Theme.of(context)
                                        .textTheme
                                        .button!
                                        .copyWith(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.only(right: 3),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 80,
                          height: 43,
                          child: Material(
                            // color: secondaryButtonColor,
                            borderRadius: BorderRadius.circular(30),
                            child: InkWell(
                              onTap: () {
                                if (widget.onSearch != null) {
                                  widget.onSearch!('');
                                }

                                lastSearch = '';
                                _searchController.clear();
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
                        ),
                      ],
                    ),
                  )
            : const Icon(
                Icons.search_rounded,
                // color: iconColor,
              ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
      ),
    );
  }
}
