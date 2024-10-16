/**
 * 常量类
 */

export default class CommonConstants {
  // 待办标题
  static readonly TODO_TITLE: string = '待办';
  // 待办页面的路由
  static readonly TODO_ROUTER: string = "pages/ToDoList";
  static readonly BASE_URL: string = "http://192.168.0.110:3000";
  // 页面路由
  /**
   * Main page url.
   */
  static readonly MAIN_PAGE_URL: string = 'pages/MainPage';
  /**
   * Login page url.
   */
  static readonly LOGIN_PAGE_URL: string = 'pages/Login';
  // 断点 sm
  static readonly SM: string = 'sm';
  static readonly MD: string = 'MD';
  static readonly LG: string = 'LG';
  static readonly WIDTH_CONDITION_SM: string = '(320vp<=width<520vp)';
  static readonly WIDTH_CONDITION_MD: string = '(520vp<=width<840vp)';
  static readonly WIDTH_CONDITION_LG: string = '(840vp<=width)';

  /**
   * toast 默认延迟时间：3000
   */

  static readonly TOAST_DURATION: number = 3000;

  static readonly READ_TIMEOUT:number = 5000;
  static readonly CONNECT_TIMEOUT:number = 5000;
  static readonly LOGIN_TEXT = "login";
  static readonly TAG_COMMON_UTILS: string = 'CommonUtils';

  static readonly  PHONE_REG = /^(?:(?:\+|00)86)?1\d{10}$/;



  /**
   * 接口 URL
   */
  static readonly LOGIN_PATH ='/api/login'
}