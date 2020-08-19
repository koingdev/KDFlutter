import 'package:flutter/material.dart';

class SearchableDropdown extends StatefulWidget {
  final String labelText;
  final String errorText;
  final List<String> dataSource;
  final Function(String) onItemSelected;

  const SearchableDropdown({
    Key key,
    @required this.labelText,
    @required this.dataSource,
    this.errorText,
    this.onItemSelected
  }) : super(key: key);

  @override
  _SearchableDropdownState createState() => _SearchableDropdownState();
}

class _SearchableDropdownState extends State<SearchableDropdown> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextField(
        readOnly: true,
        focusNode: FocusNode(),
        controller: _controller,
        decoration: InputDecoration(
          errorText: widget.errorText,
          contentPadding: EdgeInsets.only(top: 5),
          labelText: widget.labelText,
          suffixIcon: Container(
            transform: Matrix4.translationValues(15, 5, 0.0),
            child: Icon(Icons.arrow_drop_down, color: Colors.black54)
          ),
        ),
        onTap: _show,
      ),
    );
  }
  
  void _show() {
    FocusScope.of(context).unfocus();
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              content: SearchableDialogContent(
                dataSource: widget.dataSource,
                onItemSelected: (item) {
                  _controller.text = item;
                  if (widget.onItemSelected != null) widget.onItemSelected(item);
                  Navigator.of(context).pop(context);
                },
              )
          );
        }
    );
  }
  
}

class SearchableDialogContent extends StatefulWidget {
  final List<String> dataSource;
  final Function(String) onItemSelected;
  const SearchableDialogContent({Key key, this.dataSource, this.onItemSelected}) : super(key: key);
  @override
  _SearchableDialogContentState createState() => _SearchableDialogContentState();
}

class _SearchableDialogContentState extends State<SearchableDialogContent> {
  List<String> _filtered;

  @override
  void initState() {
    _filtered = List.from(widget.dataSource);
    super.initState();
  }

  onChanged(String value) {
    setState(() {
      _filtered = widget.dataSource
          .where((e) => e.toLowerCase()
          .contains(value.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: TextField(
            autofocus: true,
            onChanged: onChanged,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.search),
            ),
          ),
        ),
        Expanded(
          child: SizedBox(
            width: size.width * 0.6,
            child: ListView(
              children: _filtered.map((content) {
                return ListTile(
                    title: Text(content),
                    dense: true,
                    onTap: () {
                      widget.onItemSelected(content);
                    }
                );
              }).toList(),
            ),
          ),
        )
      ],
    );
  }
}
