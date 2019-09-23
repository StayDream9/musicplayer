import QtQuick 2.4
import QtQuick.Controls 2.1
import QtQuick.Layouts 1.3
import Felgo 3.0
import "common"
import "main_tabpages"
import "mine_pages"

Page {
    id:mainpage
    // make page navigation public, so app-demo launcher can track navigation changes and log screens with Google Analytics
    property alias navigation: navigation
    property alias mainpage: mainpage

    // for windows platform check
    property bool isWindows: system.isPlatform(4) || system.isPlatform(9) || system.isPlatform(10) // windows, winPhone or winRT

    useSafeArea: true // main page fills whole window

    Loader{
        id:loader
        focus: true
    }

    function changelocal(){
        navigation.opacity=0
        loader.source="test.qml"
    }

//    onLocalmusic:changelocal()

    Navigation {
        id: navigation

        NavigationItem {
            id: componentsItem
            title: "主页"
            icon: IconType.home

            NavigationStack {
        // we use initial page and component is here instead of setting the Page as a child
        // this is only required to avoid initialization issues when running this app within Felgo Sample Launcher
                initialPage: appComponentsPage

                Component {
                    id: appComponentsPage
                    Page {
                        id: page
//                        title: componentsItem.title

                        //
                        rightBarItem: IconButtonBarItem {
                              icon: IconType.search
                              onClicked: InputDialog.inputTextMultiLine(app,
                                                                        qsTr("New tweet"),
                                                                        qsTr("Enter text..."),
                                                                        function(ok, text) {
                                                                          if(ok) logic.addTweet(text)
                                                                        })

                        }
                        AppTabBar {
                            id: tabBar
                            contentContainer: swipeView
                            AppTabButton { text: "我的" }
                            AppTabButton { text: "发现" }
                            AppTabButton { text: "视频" }
                        }
                        //按钮界面滑动
                        SwipeView{
                            id: swipeView
                            anchors.top: tabBar.bottom
                            anchors.bottom: parent.bottom
                            width: parent.width
                            clip: true
                            Mine{}//我的

                            Rectangle {
                                id:a
                                MouseArea{
                                    anchors.fill:parent
                                    onClicked:changelocal()

                                }

                              color: "Green"
                            }
                            Rectangle {
                              color: "blue"
                            }
                        }
                } // initial page component
            }
        }
    }

        NavigationItem {
            id: effectsItem
            title: "Effects"
            icon: IconType.bolt

            NavigationStack {
        //        EffectsPage { title: effectsItem.title }
            }
        }

        NavigationItem {
            id: controlsItem
            title: "Controls"
            icon: IconType.toggleoff

            NavigationStack {
//                navigationBarShadow: false
        //        ControlsPage { title: controlsItem.title }
            }
        }

        NavigationItem {
            id: featuresItem
            title: "Features"
            icon: IconType.listalt

            NavigationStack {
            //        FeaturesPage { title: featuresItem.title }
            }
        }

        NavigationItem {
            id: listViewItem
            title: "List View"
            icon: IconType.list

            NavigationStack {
                splitView: tablet
//                    SimpleListPage { title: listViewItem.title }
            }
        }
    }

//    state: [
//        State {
//            name: "mainpage"
//            PropertyChanges {
//                target: object

//            }
//        }
//    ]
}
