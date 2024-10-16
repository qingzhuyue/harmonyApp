@Entry
@Component
struct RegisterPage {
  controller: TextInputController = new TextInputController();
  @State name:string = "";
  @State pass:string = "";
  @State repass:string = ""

  build() {
    Column(){
      Text("重置密码")
        .fontSize(38)
        .fontWeight(FontWeight.Bold)
        .fontColor('#4a9deb')
        .margin({top:30})
      Text("harmonyOS")
        .fontSize(20)
        .margin({top:10})
        .fontWeight(FontWeight.Bold)
        .fontColor('#4a9deb')
      Text()
        .height(60)

      Row(){
        Image($r('app.media.yonghu'))
          .height(18)
          .width(18)

        TextInput({ text: this.name, placeholder: '输入账号', controller: this.controller })
          .placeholderFont({ size: 16, weight: 400 })
          .width(180)
          .height(35)
          .maxLength(12)
          .type((InputType.Number))
          .backgroundColor("#f8f8f8")
          .onChange((value: string) => {
            this.name = value
          })
          .margin({left:10})
      }
      .padding({left:20})
      .width('80%')
      .borderRadius(20)
      .backgroundColor("#f8f8f8")


      Row(){
        Image($r('app.media.mima'))
          .height(18)
          .width(18)

        TextInput({ text: this.pass, placeholder: '输入密码', controller: this.controller })
          .placeholderFont({ size: 16, weight: 400 })
          .width(180)
          .height(35)
          .backgroundColor("#f8f8f8")
          .maxLength(12)
          .showPasswordIcon(false)
          .type((InputType.Password))

          .onChange((value: string) => {
            this.pass = value
          })

      }
      .margin({top:20})
      .padding({left:20})
      .width('80%')
      .borderRadius(20)
      .backgroundColor("#f8f8f8")


      Row(){
        Image($r('app.media.mima'))
          .height(18)
          .width(18)

        TextInput({ text: this.repass, placeholder: '确认密码', controller: this.controller })
          .placeholderFont({ size: 16, weight: 400 })
          .width(180)
          .height(35)
          .backgroundColor("#f8f8f8")
          .maxLength(12)
          .showPasswordIcon(false)
          .type((InputType.Password))

          .onChange((value: string) => {
            this.repass = value
          })

      }
      .margin({top:20})
      .padding({left:20})
      .width('80%')
      .borderRadius(20)
      .backgroundColor("#f8f8f8")


      Text("")
        .width('100%')
        .height(45)
        .textAlign(TextAlign.End)
        .fontColor("#4a9deb")


      Button("重 置")
        .type(ButtonType.Normal)
        .backgroundColor('#4a9deb')
        .width('75%')
        .fontSize(20)
        .height(50)
        .margin({top:10})
        .borderRadius(5)
        // .enabled(this.btnenabled)

        .onClick(() => {

        })

    }
    .justifyContent(FlexAlign.Center)
  }
}