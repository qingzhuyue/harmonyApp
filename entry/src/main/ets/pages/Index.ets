
@Entry
@Preview
@Component
struct Index {
  @State fontColor: string = '#182431';
  @State currentIndex: number = 0;
  @State selectedFontColor: string = '#007DFF';
  private controller: TabsController = new TabsController()

  onPageShow(): void {

  }

  onPageHide(): void {

  }

  onBackPress(): boolean | void {
  }

  @Builder
  tabBuilder(index: number, name: string) {
    Column() {
      Text(name)
        .fontColor(this.currentIndex === index ? this.selectedFontColor : this.fontColor)
        .fontSize(16)
        .fontWeight(this.currentIndex === index ? 500 : 400)
        .lineHeight(22)
        .margin({ top: 17, bottom: 7 })
      Divider()
        .strokeWidth(2)
        .color('#007DFF')
        .opacity(this.currentIndex === index ? 1 : 0)
    }.width('100%')
  }

  build() {
    Column() {
      Tabs({ index: this.currentIndex, controller: this.controller, barPosition: BarPosition.End }) {
        TabContent() {
          Text("申请单列表页面")
        }.tabBar(this.tabBuilder(0,'申请单'));

        TabContent() {
          Text("个人中心页面")
        }.tabBar(this.tabBuilder(1,'个人中心'))
      }
      .onChange((index: number) => {
        this.currentIndex = index;
      })
    }
    .height('100%')
    .width('100%')
  }
}

