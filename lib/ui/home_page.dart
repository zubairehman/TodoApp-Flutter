import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(context),
    );
  }

  Widget _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 12.0),
          child: Icon(
            Icons.menu,
            color: Color(0xFF7145AD),
          ),
        )
      ],
    );
  }

  Widget _buildBody(BuildContext context) {
    return Stack(
      children: <Widget>[
        _buildBodyContent(context),
        Align(
          alignment: FractionalOffset.bottomRight,
          child: _buildAddButton(),
        ),
      ],
    );
  }

  Widget _buildBodyContent(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildHelloWidget(context: context, name: 'Zubair'),
          SizedBox(height: 10.0),
          _buildDateWidget(context: context),
          SizedBox(height: 20.0),
          Divider(),
          SizedBox(height: 10.0),
          _buildTaskTypesWidget(context: context),
          SizedBox(height: 10.0),
          Divider(),
          SizedBox(height: 20.0),
          Flexible(
            child: GridView.count(
                crossAxisCount: 2,
                childAspectRatio: 1.5,
                padding: const EdgeInsets.all(4.0),
                children: <Widget>[
                  _buildGridTile(icon: Icons.library_books, title: 'All Schedule', subTitle: '57 Tasks'),
                  _buildGridTile(icon: Icons.library_books, title: 'Personal Errand', subTitle: '23 Tasks'),
                  _buildGridTile(icon: Icons.library_books, title: 'Work Projects', subTitle: '45 Tasks'),
                  _buildGridTile(icon: Icons.library_books, title: 'Grocery List', subTitle: '10 Tasks'),
                  _buildGridTile(icon: Icons.library_books, title: 'School', subTitle: '12 Tasks'),
                ].map((Widget child) {
                  return GridTile(child: child);
                }).toList()),
          )
        ],
      ),
    );
  }

  Widget _buildHelloWidget(
      {@required BuildContext context, @required String name}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Hello',
          style: Theme.of(context)
              .textTheme
              .display1
              .copyWith(color: Color(0xFF7145AD)),
        ),
        Text(
          '$name',
          style: Theme.of(context)
              .textTheme
              .display2
              .copyWith(color: Color(0xFF7145AD), fontWeight: FontWeight.w700),
        ),
      ],
    );
  }

  Widget _buildDateWidget({@required BuildContext context}) {
    return RichText(
      text: TextSpan(
        // Note: Styles for TextSpans must be explicitly defined.
        // Child text spans will inherit styles from parent
        style: TextStyle(
          fontSize: 14.0,
          color: Color(0xFF878695),
        ),
        children: <TextSpan>[
          TextSpan(
              text: DateFormat("EEEEE", "en_US").format(DateTime.now()) + ', ',
              style: TextStyle(fontWeight: FontWeight.bold)),
          TextSpan(text: DateFormat.yMMMMd("en_US").format(DateTime.now())),
        ],
      ),
    );
  }

  Widget _buildTaskTypesWidget({@required BuildContext context}) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <
        Widget>[
      _buildTaskStatusWidget(context: context, count: '57', title: 'Created'),
      _buildTaskStatusWidget(context: context, count: '35', title: 'Completed'),
    ]);
  }

  Widget _buildTaskStatusWidget(
      {@required BuildContext context, String count, String title}) {
    return Row(
      children: <Widget>[
        Text(count,
            style: Theme.of(context)
                .textTheme
                .title
                .copyWith(color: Color(0xFF7145AD))),
        SizedBox(
          width: 10.0,
        ),
        Text(
          '$title \nTasks',
          style: TextStyle(
            fontSize: 12.0,
            color: Color(0xFF878695),
          ),
        )
      ],
    );
  }

  Widget _buildGridTile(
      {@required IconData icon, String title, String subTitle}) {
    return ListTile(
      leading: Icon(
        icon,
        color: Colors.lightGreen,
      ),
      title: Text(title.replaceAll(" ", "\n")),
      subtitle: Text(subTitle),
    );
  }

  Widget _buildAddButton() {
    return ClipRRect(
      borderRadius: BorderRadius.only(topLeft: Radius.circular(30.0)),
      child: MaterialButton(
        height: 60.0,
        minWidth: 60.0,
        child: Icon(Icons.add, color: Colors.white),
        color: Color(0xFFE6918C),
        onPressed: () {},
      ),
    );
  }
}
