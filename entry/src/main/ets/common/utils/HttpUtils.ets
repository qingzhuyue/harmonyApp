import { http } from "@kit.NetworkKit";
import CommonConstant from "../constants/Contants";
import { BusinessError } from '@kit.BasicServicesKit';

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


interface GeneratedObjectLiteralInterface_1 {}
interface LoginParmType{
  username:string,
  password:string
}

export async function httpPost(url: string,params:LoginParmType) {
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