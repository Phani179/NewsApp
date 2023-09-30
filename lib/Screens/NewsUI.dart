import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/API/NewsAPI.dart';
import 'package:newsapp/Screens/NewsUILoadingEffect.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsUI extends StatefulWidget {
  const NewsUI({super.key});

  @override
  State<NewsUI> createState() => _NewsUIState();
}

class _NewsUIState extends State<NewsUI> {

  @override
  Widget build(BuildContext context) {
    NewsAPI newsAPI = NewsAPI();
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xFFEFE1D0),
      appBar: AppBar(
        backgroundColor: Color(0xFFFCFCFC),
        title: const Center(
          child: Text("News"),
        ),
      ),
      body: FutureBuilder(
        future: newsAPI.getNews(),
        builder:(context, snapshot){
          if(snapshot.connectionState == ConnectionState.waiting)
          {
            return NewsUILoadingEffect();
          }
          else if(snapshot.hasData)
            {
              return ListView.separated(
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    width: width * 0.05,
                    height: height * 0.53,
                  );
                },
                padding: EdgeInsets.all(width * 0.2),
                scrollDirection: Axis.horizontal,
                itemCount: NewsAPI.totalResults,
                itemBuilder: (BuildContext context, int index)
                {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                              width: width * 0.65,
                              height: height * 0.53,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    decoration : BoxDecoration(
                                        borderRadius: BorderRadius.circular(20)
                                    ),
                                    child: Image.network(NewsAPI.news[index].getUrlToImage,width: width * 0.65,
                                      height: height * 0.2,fit: BoxFit.cover,),
                                  ),
                                  SizedBox(
                                    height: height * 0.005,
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: width * 0.03,
                                      ),
                                      Text("${NewsAPI.news[index].getPublishedAt.toString().substring(0, 10)} /"),
                                      AutoSizeText(" By ${NewsAPI.news[index].getAuthor}",
                                        overflow: TextOverflow.ellipsis,)
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: width * 0.03,
                                      ),
                                      SizedBox(
                                        width: width * 0.55,
                                        child: AutoSizeText(
                                          "${NewsAPI.news[index].getTitle}",
                                          style: const TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w600
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 4,
                                        ),
                                      ),
                                      SizedBox(
                                        width: width * 0.03,
                                      ),
                                    ],
                                  ),

                                  Row(
                                    children: [
                                      SizedBox(
                                        width: width * 0.03,
                                      ),
                                      SizedBox(
                                        width: width * 0.55,
                                        height: height * 0.1,
                                        child: AutoSizeText(
                                          "${NewsAPI.news[index].getContent}",
                                          style: const TextStyle(
                                            fontSize: 16,
                                            // fontWeight: FontWeight.w600
                                          ),
                                          overflow: TextOverflow.visible,
                                          maxLines: 10,
                                        ),
                                      ),
                                      SizedBox(
                                        width: width * 0.03,
                                      ),
                                    ],
                                  ),

                                  Row(
                                    children: [
                                      SizedBox(
                                        height: height * 0.06,
                                        width: width * 0.03,
                                      ),
                                      GestureDetector(
                                        child: const Text("Read More...",
                                          style: TextStyle(fontSize: 18, color: Color(0xFF00789D)),),
                                        onTap: () async {
                                          await launchUrl(Uri.parse(NewsAPI.news[index].getUrl));
                                        },
                                      ),
                                      SizedBox(
                                        width: width * 0.03,
                                      ),
                                    ],
                                  ),
                                ],
                              )
                          ),
                        ],
                      )
                    ],
                  );
                }
              );
            }
          else
          {
            return Text("Failed");
          }
        },
      ),
    );
  }
}
