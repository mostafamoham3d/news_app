import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/screens/web_view_screen.dart';

Widget buildNewsItem(list, BuildContext context) {
  return InkWell(
    onTap: () {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => WebViewScreen('${list['url']}')));
    },
    child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          Container(
            height: 120,
            width: 120,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage("${list['urlToImage']}"),
                fit: BoxFit.fill,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '${list['title']}',
                  style: Theme.of(context).textTheme.bodyText1,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  '${list['publishedAt']}',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

Widget customTextFormField({
  required TextEditingController controller,
  TextInputType textInputType = TextInputType.text,
  required function,
  required String label,
  required IconData prefixIcon,
  onChanged,
  onTap,
}) {
  return TextFormField(
    onChanged: onChanged,
    onTap: onTap,
    controller: controller,
    keyboardType: textInputType,
    validator: function,
    decoration: InputDecoration(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      labelText: label,
      prefixIcon: Icon(prefixIcon),
    ),
  );
}
