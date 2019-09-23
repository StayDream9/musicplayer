import Felgo 3.0
import QtQuick 2.1
import QtQuick.Controls 2.1
import QtQuick.Layouts 1.3
import QtQuick.Window 2.3

Page{
//    z:2
    AppTabBar {
        id: tabBar
        contentContainer: swipeView
        AppTabButton { text: "单曲" }
        AppTabButton { text: "歌手" }
        AppTabButton { text: "专辑" }
        AppTabButton { text: "文件夹" }
    }
    //按钮界面滑动
    SwipeView{
        id: swipeView
        anchors.top: tabBar.bottom
        anchors.bottom: parent.bottom
        width: parent.width
        clip: true
        //单曲
        Rectangle{
          color: "red"
        }

        Rectangle {
          color: "Green"
        }
        Rectangle {
          color: "blue"
        }
        Rectangle {
          color: "grey"
        }
    }
//    Navigation {
//        id: navigation

//        NavigationItem {
//            id: componentsItem
//            title: "主页"
//            icon: IconType.home

//            NavigationStack {
//        // we use initial page and component is here instead of setting the Page as a child
//        // this is only required to avoid initialization issues when running this app within Felgo Sample Launcher
//                initialPage: appComponentsPage
//                Component {
//                    id: appComponentsPage
//                    Page {
//                        id: page
//            //                        title: componentsItem.title

//                        //
////                        rightBarItem: IconButtonBarItem {
////                              icon: IconType.search
////                              onClicked: InputDialog.inputTextMultiLine(app,
////                                                                        qsTr("New tweet"),
////                                                                        qsTr("Enter text..."),
////                                                                        function(ok, text) {
////                                                                          if(ok) logic.addTweet(text)
////                                                                        })

////                        }
//                        AppTabBar {
//                            id: tabBar
//                            contentContainer: swipeView
//                            AppTabButton { text: "我的" }
//                            AppTabButton { text: "发现" }
//                            AppTabButton { text: "视频" }
//                        }
//                        //按钮界面滑动
//                        SwipeView{
//                            id: swipeView
//                            anchors.top: tabBar.bottom
//                            anchors.bottom: parent.bottom
//                            width: parent.width
//                            clip: true
//                            //单曲
//                            Rectangle{
//                              color: "red"
//                            }

//                            Rectangle {
//                              color: "Green"
//                            }
//                            Rectangle {
//                              color: "blue"
//                            }
//                        }
//                } // initial page component
//            }
//            }
//        }
//    }
}
