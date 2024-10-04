export interface AllType {
  username?: string;
  password?: string;
}

export interface HeaderType {
  'Content-Type'?: string
}

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