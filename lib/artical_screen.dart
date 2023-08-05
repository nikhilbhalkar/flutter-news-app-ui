import 'package:flutter/material.dart';
import 'package:newa_app_ui/artical_model.dart';
import 'package:newa_app_ui/image_container.dart';

import 'custom_tag.dart';

class ArticalScreen extends StatelessWidget {
  const ArticalScreen({super.key});
  static const routeName = '/artical';
  @override
  Widget build(BuildContext context) {
    final article = ModalRoute.of(context)!.settings.arguments as Article;
    return ImageContainer(
        width: double.infinity,
        imageUrl: article.imageUrl,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            iconTheme: const IconThemeData(color: Colors.white),
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          extendBodyBehindAppBar: true,
          body: ListView(
            children: [
              _NewsHeading(
                article: article,
              ),
              _NewsBody(article: article),
            ],
          ),
        ));
  }
}

class _NewsBody extends StatelessWidget {
  const _NewsBody({
    super.key,
    required this.article,
  });

  final Article article;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(20.0),
            topLeft: Radius.circular(20.0)),
        color: Colors.white,
      ),
      child: Column(
        children: [
          Row(
            
            children: [
              CustomTag(
                  backgroundColor: Colors.black.withAlpha(150),
                  children: [
                    CircleAvatar(
                      radius: 10,
                      backgroundImage:
                          NetworkImage(article.authorImageUrl),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(article.author,
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(
                              color: Colors.white,
                            )),
                  ]),
                  const SizedBox(width: 5,),
                   CustomTag(
              backgroundColor: Colors.grey.shade200,
              children: [
                const Icon(Icons.timer,color: Colors.grey,),
                const SizedBox(
                  width: 10,
                ),
                Text('${DateTime.now().difference(article.createdAt).inHours}h',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                       ),
              ]),

               const SizedBox(width: 5,),
                   CustomTag(
              backgroundColor: Colors.grey.shade200,
              children: [
                const Icon(Icons.remove_red_eye,color: Colors.grey,),
                const SizedBox(
                  width: 10,
                ),
                Text('${article.views}',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                       ),
              ]),
            ],
          ),
           const SizedBox(
                  width: 20,
                ),
                Text(article.title,
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .copyWith(fontWeight: FontWeight.bold),
                       ),

               const SizedBox(
                  width: 20,
                ),
                Text(article.body,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(height: 1.5)
                       ),
               const SizedBox(
                  height: 20,
                ),

                GridView.builder(
                  itemCount: 2,
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.25), 
                  itemBuilder: (context,index){
                    return ImageContainer(width: MediaQuery.of(context).size.width * 0.42,
                     imageUrl: article.imageUrl,
                     margin: const EdgeInsets.only(right: 5.0,bottom: 5.0),);
                  })        
        ],
      ),
    );
  }
}

class _NewsHeading extends StatelessWidget {
  const _NewsHeading({
    Key? key,
    required this.article,
  }) : super(key: key);
  final Article article;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.15,
          ),
          CustomTag(backgroundColor: Colors.grey.withAlpha(150), children: [
            Text(article.category,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Colors.white,
                    )),
          ]),
          const SizedBox(
            height: 10,
          ),
          Text(article.title,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(color: Colors.white, height: 1.25)),
          const SizedBox(
            height: 10,
          ),
          Text(article.subtitle,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: Colors.white, height: 1.25)),
        ],
      ),
    );
  }
}
