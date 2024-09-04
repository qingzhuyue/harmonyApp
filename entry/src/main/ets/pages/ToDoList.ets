import CommonConstants from "../common/constants/Contants";
import { TODO_DATA } from "../common/data/SouresData"

@Entry
@Component
struct ToDoList {
  @State title: string = '';

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
      Text(CommonConstants.TODO_TITLE)
        .id('ToDoListHelloWorld')
        .fontSize(30)
        .fontWeight(FontWeight.Bold)
        .alignRules({
          center: { anchor: '__container__', align: VerticalAlign.Center },
          middle: { anchor: '__container__', align: HorizontalAlign.Center }
        })
        .margin({
          bottom: 20
        })

      ForEach(TODO_DATA, (item: string) => {
        ToDoItem({ contents: item })
      }, (item: string) => item)
    }
    .margin({
      left: 10,
      top: 10
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
          right:50
        })
      Text(this.contents)
        .fontSize(20)
        .margin({
          top: 15
        })
    }
    .margin({
      bottom:30
    })
  }
}