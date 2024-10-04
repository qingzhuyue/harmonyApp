import { http } from '@kit.NetworkKit';
import { image } from '@kit.ImageKit';
import StyleConstants from "../common/constants/StyleConstants";
import CommonUtils from "../common/utils/CommonUtils";
import Logger from "../common/utils/Logger";
import { httpGet, httpPost, HttpService } from "../common/utils/HttpUtils";
import CommonConstant from "../common/constants/Contants";
import axios, { AxiosResponse } from '@ohos/axios';
import { LoginResponseType } from "../common/utils/Type"


@Entry
@Component
struct Login {
  @State pixelMap: PixelMap | undefined = undefined;
  @State imgUrl: string = "https://s.laoyaoba.com/jwImg/1358337725245.013.jpeg"

  // 组件即将出现的时候调用，在 build 函数之前执行
  aboutToAppear() {
    this.requestImageUrl();
  }

  // 请求图片
  requestImageUrl() {
    http.createHttp().request(
      this.imgUrl,
      { expectDataType: http.HttpDataType.ARRAY_BUFFER }
    ).then(async (res) => {
      // console.info('res', JSON.stringify(res))
      // 将图片资源转为像素图（PixelMap）
      this.pixelMap = await image.createImageSource(res.result as ArrayBuffer).createPixelMap()
    }).catch(() => {
      // console.info('catch')
    })
  }

  build() {
    GridRow({
      columns: {
        sm: StyleConstants.COLUMNS_SM,
        md: StyleConstants.COLUMNS_MD,
        lg: StyleConstants.COLUMNS_LG
      },
      gutter: {
        x: StyleConstants.GRID_GUTTER
      }
    }) {
      GridCol({
        span: {
          sm: StyleConstants.SPAN_SM,
          md: StyleConstants.SPAN_MD,
          lg: StyleConstants.SPAN_LG
        }, offset: {
          md: StyleConstants.OFFSET_MD,
          lg: StyleConstants.OFFSET_LG
        }
      }) {
        Column() {
          Column() {
            Image(this.imgUrl)
              .onError((error: ImageError) => {
                console.info('图片error', JSON.stringify(error))
              })
              .onComplete((event) => {
                console.info('图片event', JSON.stringify(event))
              })
              .width('100%')
              .margin({ bottom: "38vp" })
            Text("鸿蒙应用")
              .fontSize(38)
              .fontWeight(FontWeight.Bold)
              .fontColor('#4a9deb')
              .margin({ top: 30, })
            Text("harmonyOS")
              .fontSize(20)
              .margin({ top: 10, })
              .fontWeight(FontWeight.Bold)
              .fontColor('#4a9deb')
          }

          LoginBottom()
        }
        .height("100%")
      }
    }
    .backgroundColor($r('app.color.background'))
  }
}

@Preview
@Component
struct LoginBottom {
  controller: TextInputController = new TextInputController()
  @State account: string = "";
  @State passwrod: string = "";
  @State checkStatus: boolean = false;

  async onLoginRequest() {
    if (this.checkStatus) {
      // CommonUtils.showToastContent("登录")
      Logger.info("登录")
      const httpService = HttpService.getInstance();
      // axios({
      //   url: CommonConstant.BASE_URL + "/api/login",
      //   method: 'post',
      //   headers: {
      //     "Content-Type": "application/json"
      //   },
      //   data: JSON.stringify({ username: "admin12", password: "123456" }),
      //   readTimeout: 1000,
      // })
      //   .then((response: AxiosResponse<string>) => {
      //     Logger.info("登录接口响应", JSON.stringify(response))
      //   })
      //   .catch((error: Error) => {
      //     console.info("登录接口报错", JSON.stringify(error));
      //   });

      try {
        let result =
          await httpService.post(CommonConstant.BASE_URL + `/api/login`, { username: "admin12", password: "123456" }, {
            'Content-Type': 'application/json'
          })

        Logger.info("登录接口响应", JSON.stringify(result))
        console.log("登录接口响应222", result)

      } catch (error) {
        Logger.info("登录接口报错", JSON.stringify(error))
      }
    } else {
      CommonUtils.showToastContent("请阅读并勾选同意相关协议")
    }
  }

  build() {
    Column() {
      Row() {
        Image($r('app.media.yonghu'))
          .height(18)
          .width(18)

        TextInput({ text: this.account, placeholder: '输入账号', controller: this.controller })
          .placeholderFont({ size: 16, weight: 400 })
          .width(180)
          .height(35)
          .maxLength(12)
          .backgroundColor("#f8f8f8")
          .onChange((value: string) => {
            this.account = value
          })
          .margin({ left: 10 })
      }
      .padding({ left: 20 })
      .width(StyleConstants.WIDTH_80)
      .borderRadius(20)
      .backgroundColor("#f8f8f8")
      .margin({
        top: 40
      })


      Row() {
        Image($r('app.media.mima'))
          .height(18)
          .width(18)

        TextInput({ text: this.passwrod, placeholder: '输入密码', controller: this.controller })
          .placeholderFont({ size: 16, weight: 400 })
          .width(180)
          .height(35)
          .backgroundColor("#f8f8f8")
          .maxLength(12)
          .showPasswordIcon(false)
          .type((InputType.Password))
          .alignRules({
            middle: { anchor: '__container__', align: HorizontalAlign.Center }
          })
          .onChange((value: string) => {
            this.passwrod = value
          })

      }
      .margin({ top: 20 })
      .padding({ left: 20 })
      .width(StyleConstants.WIDTH_80)
      .borderRadius(20)
      .backgroundColor("#f8f8f8")

      Row() {
        Row() {
          Text($r('app.string.message_login'))
            .blueTextStyle()
          // .onClick(() => {
          //   CommonUtils.showToastContent($r('app.string.incomplete_toast'));
          // })
          Text($r('app.string.forgot_password'))
            .blueTextStyle()
          // .onClick(() => {
          //   CommonUtils.showToastContent($r('app.string.incomplete_toast'));
          // })
        }
        .justifyContent(FlexAlign.SpaceBetween)
        .margin({
          top: '24vp'
        })
        .padding({
          left: $r('app.float.forgot_padding_left'),
          right: $r('app.float.forgot_padding_right')
        })
        .width(StyleConstants.FULL_PARENT)
      }
      .width(StyleConstants.WIDTH_80)

      Button($r("app.string.login"))
        .id("loginButtonId")
        .width(StyleConstants.WIDTH_80)
        .margin({
          top: "12vp"
        })
        .onClick(() => {
          this.onLoginRequest()
        })


      Row() {
        Checkbox({ name: 'checkbox2', group: 'checkboxGroup' })
          .select(false)
          .selectedColor(0x39a2db)
          .onChange((value: boolean) => {
            if (value) {
              this.checkStatus = true
            } else {
              this.checkStatus = false
            }
          })
          .width(20)
          .height(20)
        Text() {
          Span("我已阅读并同意")
            .fontSize(12)
          Span("法律声明及隐私协议")
            .fontColor("#4a9deb")
            .fontSize(12)
            .onClick(() => {
              CommonUtils.showToastContent("隐私协议")
            })
          Span("和")
            .fontSize(12)

          Span("用户协议")
            .fontColor("#4a9deb")
            .fontSize(12)
            .onClick(() => {
              CommonUtils.showToastContent("用户协议")
            })
        }
      }
      .alignItems(VerticalAlign.Center)
      .margin({
        top: "12vp"
      })
    }
  }
}

@Extend(Text)
function blueTextStyle() {
  .fontColor($r('app.color.blue_text_color'))
  .fontSize($r('app.float.small_text_size'))
  .fontWeight(FontWeight.Medium)
}