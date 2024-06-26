
@Entry
@Component
struct Index {
  @State message: string = 'Hello 青竹悦的鸿蒙 app'

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(20)
      }
      .width('100%')

    }
    .height('100%')
  }
}