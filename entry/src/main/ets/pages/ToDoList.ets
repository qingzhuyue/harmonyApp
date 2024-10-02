import CommonConstants from "../common/constants/Contants";
import { TODO_DATA } from "../common/data/SouresData"

interface ItemType {
  title: string;
  projects: string[]
}

@Entry
@Component
struct ToDoList {
  @State title: string = '';
  private timetableListItemGroup: ItemType[] = [
    {
      title: "星期一",
      projects: ["语文", "数学"]
    }, {
    title: "星期二",
    projects: ["语文", "数学"]
  }, {
    title: "星期三",
    projects: ["语文", "数学"]
  }, {
    title: "星期四",
    projects: ["语文", "数学"]
  }, {
    title: "星期五",
    projects: ["语文", "数学"]
  },
  ];

  onPageShow() {
    console.info('Index onPageShow');
  }

  onPageHide() {
    console.info('Index onPageHide');
  }

  onBackPress() {
    console.info('Index onBackPress');
    return true // 返回true表示页面自己处理返回逻辑，不进行页面路由；返回false表示使用默认的路由返回逻辑，不设置返回值按照false处理
  }

  aboutToAppear() {
    console.info('MyComponent aboutToAppear');
  }

  onDidBuild() {
    console.info('MyComponent onDidBuild');
  }

  aboutToDisappear() {
    console.info('MyComponent aboutToDisappear');
  }

  build() {
    Column() {
      List({ space: 2 }) {
        ForEach(this.timetableListItemGroup, (item: ItemType) => {
          ListItemGroup() {
            ForEach(item.projects, (project: string) => {
              ListItem() {
                Text(project)
                  .width("100%")
                  .height("30")
                  .fontSize(20)
                  .textAlign(TextAlign.Center)
              }
            }, (item:string) => item)
          }
          .borderRadius(10)
          .divider({strokeWidth:1,color:0xDCDCDC})
          .margin({
            bottom:10
          })
          .border({width:1,color:"blue"})
        })
      }
    }
    .margin({
      left: 10,
      top: 10,
      right:10
    })
  }
}


/**
 * 自定义的 Item 组件
 */
@Preview
@Component
struct ToDoItem {
  private contents?: string

  build() {
    Row() {
      Image($r("app.media.startIcon"))
        .width(50)
        .height(50)
        .margin({
          right: 50
        })
      Text(this.contents)
        .fontSize(20)
        .margin({
          top: 15
        })
    }
    .margin({
      bottom: 30
    })
  }
}