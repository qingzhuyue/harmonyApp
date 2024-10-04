interface LoginResponseDataType {
  username?: string;
  phone?: string;
  token?: string;
}

export interface LoginResponseType {
  code?: number;
  msg?: string;
  data?: LoginResponseDataType
}
export interface User {
  code?: number;
  msg?: string;
  data?: LoginResponseDataType
}

export interface ServerResponse {
  code?: number;
  msg?: string;
  data?: LoginResponseDataType
  errorCode: number;
  errorMsg: string;
}