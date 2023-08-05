import 'package:flutter/material.dart';
import 'package:newa_app_ui/artical_model.dart';
import 'package:newa_app_ui/artical_screen.dart';
import 'package:newa_app_ui/custom_tag.dart';

import 'bottom_navbar.dart';
import 'image_container.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
static const routeName = '/';
  @override
  Widget build(BuildContext context) {
    Article article =Article.articals[0];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(onPressed: (){}, icon: const Icon(Icons.menu,color: Colors.white,)),
      ),
      
      bottomNavigationBar: const BottomNavbar(index:0),
      extendBodyBehindAppBar: true,
      body: ListView(
        padding: EdgeInsets.zero,
         children: [
          _NewsofTheDay(article: article),
          _BreakingNews(articles:Article.articals),
         ],
      ),
    );
  }
}


class _BreakingNews extends StatelessWidget {
  const _BreakingNews({
    
    Key ?  key,
    required this.articles,

    }):super(key: key);
   final List<Article> articles;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Breaking News',
              style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .copyWith(fontWeight: FontWeight.bold),
              ),
    
              Text('More',
              style: Theme.of(context)
              .textTheme
              .bodyLarge
              
              ),
            ],
          ),
          const SizedBox(height: 20,),
          SizedBox(height: 250,
          child:ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: articles.length,
            itemBuilder:(context,index){
              return Container(
                width: MediaQuery.of(context).size.width * 0.5,
                margin: const EdgeInsets.only(right: 10),
                child: InkWell(
                  onTap: (){
                    Navigator.pushNamed(context,
                    ArticalScreen.routeName,
                    arguments:articles[index],
                     
                    );
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ImageContainer(width: MediaQuery.of(context).size.width * 0.5,
                       imageUrl: articles[index].imageUrl
                       ),
                       const SizedBox(height: 10,),
                        Text(articles[index].title,
                        maxLines: 2,
                            style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(fontWeight: FontWeight.bold,height: 1.5),
                         ),
                          const SizedBox(height: 10,),
                        Text('${DateTime.now().difference(articles[index].createdAt).inHours}hours ago',
                       
                            style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            
                         ), 
                         const SizedBox(height: 10,),
                            Text('by ${articles[index].author}',
                       
                            style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            
                         ), const SizedBox(height: 10,),
                       
                
                    
                    ],
                  ),
                ),
              );
            } ,
             ) 
            ,),
    
        ],
      ),
    );
  }
}





class _NewsofTheDay extends StatelessWidget {
  const _NewsofTheDay({
    super.key,
    required this.article,
  });

  final Article article;

  @override
  Widget build(BuildContext context) {
    return ImageContainer(
      height: MediaQuery.of(context).size.height*0.45,
      width: double.infinity,
      padding: EdgeInsets.all(20.0),
      imageUrl:article.imageUrl ,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTag(backgroundColor: Colors.grey.withAlpha(150), children: [
            Text('News of the Day',style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.white,)),
      
          ]),
          const SizedBox(height: 10,),
          Text(article.title,style: Theme.of(context).textTheme.headlineSmall!.
          copyWith(
            fontWeight:FontWeight.bold,
            color: Colors.white,
            height: 1.25
            )),
            TextButton(onPressed: (){}, 
            style: TextButton.styleFrom(padding: EdgeInsets.zero),
            child: Row(
              children: [
                Text('Learn more',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Colors.white,)
                ),
                 const SizedBox(height: 10,),
                const Icon(Icons.arrow_right_alt,color: Colors.white,)
              ],
            )
            ),
            ],
      ),
    );
  }
}
