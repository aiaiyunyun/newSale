/**
 * Copyright:唐山徕思歌科技有限公司
 * @auther : 徐众垚
 * @Date   : 2016年12月8日
 */
package com.fh.entity.vo;

import org.codehaus.jackson.map.annotate.JsonSerialize;

import java.util.HashMap;

@JsonSerialize(include = JsonSerialize.Inclusion.NON_NULL)
public class JsonVo<T> {

	/**
	 * 结果
	 */
	private boolean result;
	/**
	 * 成功的消息
	 */
	private String msg;

	/**
	 * 具体每个输入错误的消息
	 */
	private HashMap<String, String> errors = new HashMap<String, String>();
	
	/**
	 * 返回的数据
	 */
	private T t;

	public boolean isResult() {
		return result;
	}

	public void setResult(boolean result) {
		this.result = result;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public HashMap<String, String> getErrors() {
		return errors;
	}

	public void setErrors(HashMap<String, String> errors) {
		this.errors = errors;
	}

	public T getT() {
		return t;
	}

	public void setT(T t) {
		this.t = t;
	}
}
