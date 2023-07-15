
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/modules/web/web_view.dart';

Widget buildArticleItem({required article, required context}) => InkWell(
  onTap: () {
    // navigateTo(context, WebViewScreen(article['url']));
  },
  child: Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(
      children: [
        Container(
          height: 100.0,
          width: 100.0,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              image: DecorationImage(
                  image: NetworkImage('${article['urlToImage']}'),
                  fit: BoxFit.cover)),
        ),
        SizedBox(
          width: 15.0,
        ),
        Expanded(
          child: Container(
            height: 100.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    "${article['title']}",
                    style: Theme.of(context).textTheme.bodyText1,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Text(
                  "${article['publishedAt']}",
                  style: TextStyle(
                      fontWeight: FontWeight.w600, color: Colors.grey),
                ),
              ],
            ),
          ),
        )
      ],
    ),
  ),
);

Widget myDivider() => Padding(
  padding: const EdgeInsetsDirectional.only(start: 20.0),
  child: Container(
    width: double.infinity,
    height: 1.0,
    color: Colors.grey[300],
  ),
);

Widget build_Article_Item(article, context) => InkWell(
  onTap: ()
  {
    navigateTo(context, WebViewScreen(article['url']));
  },
  
  child:   Padding(
  
    padding: EdgeInsets.all(20),
  
    child: Row(
  
      children: [
  
        Container(
  
          width: 120,
  
          height: 120,
  
          decoration: BoxDecoration(
  
              borderRadius: BorderRadius.circular(10),
  
              image: DecorationImage(
  
                  image: NetworkImage('${article['urlToImage']}'),
  
                   fit: BoxFit.cover
  
              )
  
          ),
  
        ),
  
        SizedBox(
  
          width: 20,
  
        ),
  
        Expanded(
  
            child: Container(
  
              child: Column(
  
                crossAxisAlignment: CrossAxisAlignment.start,
  
                mainAxisAlignment: MainAxisAlignment.start,
  
                children: [
  
                  Text(
  
                    '${article['title']}',
  
                    style: Theme.of(context).textTheme.bodyText1,
  
                    maxLines: 4,
  
                    overflow: TextOverflow.ellipsis,
  
                  ),
  
                  Text(
  
                    '${article['publishedAt']}',
  
                    style: TextStyle(
  
                      color: Colors.grey
  
                    ),
  
                  )
  
                ],
  
              ),
  
            )
  
        )
  
      ],
  
    ),
  
  ),
);


Widget articleBuilder(article, context, {isSearch = false})=>ConditionalBuilder(
    condition: article.length > 0,
    builder: (context) => ListView.separated(
      itemBuilder: (context, index)=> build_Article_Item(article[index],context),
      separatorBuilder: (context, index)=> myDivider(),
      itemCount: article.length,
    ),
    fallback: (context)=> isSearch ? Container() : Center(child: CircularProgressIndicator(),)
);

void navigateTo(context, widget) => Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => widget,
    ));


Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType type,
  required String? Function(String?) validate,
  required String label,
  required IconData prefIcon,
  Function? onTapFunction()?,
  IconData? sufx,
  Function? onChange(String value)?,
  bool secureText = false,
  Function? onTapSuff()?,
  String? Function(String?)? onSubmit
}) =>
    TextFormField(

      validator: validate,

      keyboardType: type,
      controller: controller,
      onTap: onTapFunction,
      onChanged: onChange,
      onFieldSubmitted: onSubmit,
      obscureText: secureText,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        prefixIcon: Icon(
          prefIcon,
        ),
        labelText: label,
        suffixIcon: sufx != null
            ? IconButton(
          icon: Icon(sufx),
          onPressed: onTapSuff,
        )
            : null,
      ),
    );