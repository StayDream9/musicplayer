import Felgo 3.0
import QtQuick 2.1
import "../mine_pages"
import "../"

Rectangle{
        id:rec
        signal localmusic

        NavigationStack {
            splitView: tablet
            initialPage: mainPage

        }
//        Loader{
//            id:loader
//            focus: true
//        }

        property Component mainPage: ListPage {
          title: "我的音乐"

          model: [
            { text: "本地音乐", icon: IconType.music },
            { text: "最近播放", icon: IconType.play },
            { text: "下载管理", icon: IconType.download },
            { text: "我的电台", icon: IconType.wifi },
            { text: "我的收藏", icon: IconType.heart }
          ]
            function chosewin(index){
                switch(index)
                {
                case 0:{mainpage.opacity=0.3
                        rec.localmusic()
                }
                    break;
                case 1:navigationStack.popAllExceptFirstAndPush(lastPage)
                    break;
                case 2:navigationStack.popAllExceptFirstAndPush(downloadPage)
                    break;
                case 3:navigationStack.popAllExceptFirstAndPush(audioPage)
                    break;
                case 4:navigationStack.popAllExceptFirstAndPush(collectPage)
                    break;
                }
            }

          onItemSelected: {
              chosewin(index)
          }
        }
        property Component localPage: ListPage {
          title: "本地音乐"
          Local_music{}
          //      onItemSelected: navigationStack.push(updatesPage)
        }
        property Component lastPage: ListPage {
          title: "最近播放"
          //      onItemSelected: navigationStack.push(updatesPage)
        }

        property Component downloadPage: Page {
            title: "下载管理"
        }
        property Component audioPage: Page {
            title: "我的电台"
        }
        property Component collectPage: Page {
          title: "我的收藏"
        }
}


