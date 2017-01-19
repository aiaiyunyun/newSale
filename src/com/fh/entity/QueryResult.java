package com.fh.entity;

import java.util.List;

/**
 */
public class QueryResult<E> {

	private List<E> resultList;
	private Long totalCount;
	private boolean success;
	private E object;
	private String message;

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public List<E> getResultList() {
		return resultList;
	}

	public void setResultList(List<E> resultList) {
		this.resultList = resultList;
	}

	public Long getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(Long totalCount) {
		this.totalCount = totalCount;
	}

	public boolean isSuccess() {
		return success;
	}

	public void setSuccess(boolean success) {
		this.success = success;
	}

	public E getObject() {
		return object;
	}

	public void setObject(E object) {
		this.object = object;
	}
}
