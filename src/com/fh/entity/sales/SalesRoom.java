package com.fh.entity.sales;

import java.io.Serializable;

/**
 * 创建人: 徐众垚
 * 创建时间: 2017/1/17
 * 公司: 唐山徕思歌科技有限公司
 * 描述: 销售详情表
 */
public class SalesRoom implements Serializable {

    private long srId; // pk
    private String userId; //销售人员id
    private String srSaleDate; //销售日期
    private String srEndBackPayment; //回款截止日期
    private int srIsBack; //是否回款
    private String srBackDate; //回款日期
    private float srSaleAllAmount; //销售金额总额
    private int srGoodsNum; //产品个数
    private String srProvince; //销往省份
    private float srFreight; //运费
    private float srRubberAmount; //胶圈费
    private int srIsDeviceAward; //是否设备提成
    private String srTax; //税点
    private float srSaleAmount; //销售金额
    private String srCreateDate; //录入日期
    private int srState;// 审核标识
    private String srCreateUser; //录入人
    private String srBak; //备注

    public long getSrId() {
        return srId;
    }

    public void setSrId(long srId) {
        this.srId = srId;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getSrSaleDate() {
        return srSaleDate;
    }

    public void setSrSaleDate(String srSaleDate) {
        this.srSaleDate = srSaleDate;
    }

    public String getSrEndBackPayment() {
        return srEndBackPayment;
    }

    public void setSrEndBackPayment(String srEndBackPayment) {
        this.srEndBackPayment = srEndBackPayment;
    }

    public int getSrIsBack() {
        return srIsBack;
    }

    public void setSrIsBack(int srIsBack) {
        this.srIsBack = srIsBack;
    }

    public String getSrBackDate() {
        return srBackDate;
    }

    public void setSrBackDate(String srBackDate) {
        this.srBackDate = srBackDate;
    }

    public float getSrSaleAllAmount() {
        return srSaleAllAmount;
    }

    public void setSrSaleAllAmount(float srSaleAllAmount) {
        this.srSaleAllAmount = srSaleAllAmount;
    }

    public int getSrGoodsNum() {
        return srGoodsNum;
    }

    public void setSrGoodsNum(int srGoodsNum) {
        this.srGoodsNum = srGoodsNum;
    }

    public String getSrProvince() {
        return srProvince;
    }

    public void setSrProvince(String srProvince) {
        this.srProvince = srProvince;
    }

    public float getSrFreight() {
        return srFreight;
    }

    public void setSrFreight(float srFreight) {
        this.srFreight = srFreight;
    }

    public float getSrRubberAmount() {
        return srRubberAmount;
    }

    public void setSrRubberAmount(float srRubberAmount) {
        this.srRubberAmount = srRubberAmount;
    }

    public int getSrIsDeviceAward() {
        return srIsDeviceAward;
    }

    public void setSrIsDeviceAward(int srIsDeviceAward) {
        this.srIsDeviceAward = srIsDeviceAward;
    }

    public String getSrTax() {
        return srTax;
    }

    public void setSrTax(String srTax) {
        this.srTax = srTax;
    }

    public float getSrSaleAmount() {
        return srSaleAmount;
    }

    public void setSrSaleAmount(float srSaleAmount) {
        this.srSaleAmount = srSaleAmount;
    }

    public String getSrCreateDate() {
        return srCreateDate;
    }

    public void setSrCreateDate(String srCreateDate) {
        this.srCreateDate = srCreateDate;
    }

    public int getSrState() {
        return srState;
    }

    public void setSrState(int srState) {
        this.srState = srState;
    }

    public String getSrCreateUser() {
        return srCreateUser;
    }

    public void setSrCreateUser(String srCreateUser) {
        this.srCreateUser = srCreateUser;
    }

    public String getSrBak() {
        return srBak;
    }

    public void setSrBak(String srBak) {
        this.srBak = srBak;
    }
}
