import { router } from "@kit.ArkUI";
import axios, { AxiosResponse, InternalAxiosRequestConfig, AxiosError } from '@ohos/axios';
import CommonConstant from "../constants/Contants";

// 创建一个 Axios 实例
const axiosInstance = axios.create({
  baseURL: CommonConstant.BASE_URL, // 你的 API 基础 URL
  timeout: 10000, // 请求超时时间
});

axiosInstance.interceptors.request.use(
  (config: InternalAxiosRequestConfig) => {
    // 你可以在这里添加更多的全局请求头或处理逻辑

    const token: string | undefined | null = AppStorage.get('token');
    console.log('发送请求', JSON.stringify(config));
    console.log('token', token);
    if (!token && config.url !== CommonConstant.LOGIN_PATH) {
      router.pushUrl({ url: "pages/Login" })
    }
    if (token) {
      config.headers.Authorization = `Bearer ${token}`;
    }
    return config;
  },
  (error: Error) => {
    // 对请求错误做些什么
    console.log("请求阶段", error)
    return Promise.reject(error);
  }
);


axiosInstance.interceptors.response.use((response: AxiosResponse) => {
  return response
}, (error: AxiosError) => {

});

export default axiosInstance;
