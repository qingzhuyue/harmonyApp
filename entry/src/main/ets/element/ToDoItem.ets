import CommonConstant from "../../common/constant";

@Component
export default struct ToDoItem {
  private title?: string; // item的小标题
  @State isSelect:boolean = false; // Item组件的是否选中的状态

  // 定义Item的icon
  @Builder labelIcon(icon:Resource){
    Image(icon)
      // @ts-ignore
      .objectFit(ImageFit.Contain)
      .width($r('app.float.checkout_width'))
      .height($r('app.float.checkout_height'))
      .margin($r('app.float.checkout_margin'))
  }

  build() {

  }
}