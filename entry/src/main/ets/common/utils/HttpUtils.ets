import { http } from "@kit.NetworkKit";
import CommonConstant from "../constants/Contants";
import { AllType, HeaderType, LoginResponseType } from "./Type";
import CommonUtils from "./CommonUtils";

export class HttpService {
  private static instance: HttpService;

  // 私有构造函数，防止外部实例化
  private constructor() {
  }

  // 获取单例
  public static getInstance(): HttpService {
    if (!HttpService.instance) {
      HttpService.instance = new HttpService();
    }
    return HttpService.instance;
  }

  // 发起GET请求
  public async get(url: string, headers?: object) {
    const httpRequest = http.createHttp();
    try {
      const response = await httpRequest.request(url, {
        method: http.RequestMethod.GET,
        header: headers,
        readTimeout: CommonConstant.READ_TIMEOUT,
        connectTimeout: CommonConstant.CONNECT_TIMEOUT
      });
      if (response.responseCode === 200) {
        return response.result;
      } else {
        throw new Error(`请求失败: ${response.responseCode}`);
      }
    } catch (error) {
      throw new Error(`请求发生错误: ${error.message}`);
    }
  }

  // 发起POST请求
  public async post(url: string, params: AllType, headers?: HeaderType) {
    const httpRequest = http.createHttp();
    try {
      const response = await httpRequest.request(url, {
        method: http.RequestMethod.POST,
        header: headers,
        extraData: params,
        readTimeout: CommonConstant.READ_TIMEOUT,
        connectTimeout: CommonConstant.CONNECT_TIMEOUT
      });
      if (response.responseCode === 200) {
        // let data:LoginResponseType = response.result
        return response.result
      } else {
        CommonUtils.showToastContent(`请求失败: ${response.responseCode}`)
        throw new Error(`请求失败: ${response.responseCode}`);
      }
    } catch (error) {
      CommonUtils.showToastContent(`请求发生错误: ${error.message}`)
      throw new Error(`请求发生错误: ${error.message}`);
    }
  }
}
;

export async function httpGet(url: string) {
  if (!url) {
    return undefined;
  }
  let request = http.createHttp();

  let result = await request.request(url, {
    method: http.RequestMethod.GET,
    header: {
      'Content-Type': 'application/json'
    },
    readTimeout: CommonConstant.READ_TIMEOUT,
    connectTimeout: CommonConstant.CONNECT_TIMEOUT
  });
  return result;
}


export async function httpPost(url: string, params: AllType) {
  if (!url) {
    return undefined;
  }
  let request = http.createHttp();

  let result = await request.request(url, {
    method: http.RequestMethod.POST,
    header: {
      'Content-Type': 'application/json'
    },
    extraData: params,
    readTimeout: CommonConstant.READ_TIMEOUT,
    connectTimeout: CommonConstant.CONNECT_TIMEOUT
  });

  return result;
}