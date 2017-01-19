<%--
  Created by IntelliJ IDEA.
  User: xuzhongyao
  Date: 2017/1/17
  Time: 上午10:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
    <base href="<%=basePath%>">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>销售业绩</title>
    <meta name="keywords" content="科研项目管理">
    <meta name="description" content="科研项目管理">
    <meta http-equiv="X-UA-Compatible" content="IE=9; IE=8; IE=7; IE=EDGE">
    <link rel="shortcut icon" href="<%=path%>/static/hplus/favicon.ico">
    <link href="<%=path%>/static/hplus/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="<%=path%>/static/hplus/css/font-awesome.css?v=4.4.0" rel="stylesheet">
    <link href="<%=path%>/static/hplus/css/animate.css" rel="stylesheet">
    <link href="<%=path%>/static/hplus/css/style.css?v=4.1.0" rel="stylesheet">
    <link href="<%=path%>/static/hplus/css/plugins/toastr/toastr.min.css" rel="stylesheet">
    <link href="<%=path%>/static/hplus/css/plugins/datapicker/datepicker3.css" rel="stylesheet">
    <!-- jqgrid-->
    <link href="<%=path%>/static/hplus/css/plugins/jqgrid/ui.jqgrid.css?0820" rel="stylesheet">
    <link href="<%=path%>/static/hplus/css/plugins/datapicker/datepicker3.css" rel="stylesheet">

    <style>
        .jqGrid_wrapper{background: white;}
        textarea{ resize:none;}
    </style>
</head>

<body class="gray-bg">

<div class="wrapper wrapper-content  animated fadeInRight">
    <div class="row">
        <div class="col-sm-12">
            <div class="ibox">
                <div class="ibox-content">
                    <span class="text-muted small pull-right">当前日期：<i class="fa fa-clock-o"></i> <span id="currenttime"></span></span>
                    <h2>信息录入</h2>
                    <p>
                        助理录入销售信息
                    </p>

                    <form class="form-horizontal m-t" id="_sales_save" style="margin-right: 30px;">


                        <div class="form-group" id="data_1">
                            <label class="col-sm-2 control-label">销售日期</label>

                            <div class="col-sm-4">
                                <div class="input-group date">
                                    <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                                    <input id="srSaleDate" name="srSaleDate" onchange="dateadd()" type="text" class="form-control" required="" aria-required="true">
                                </div>
                            </div>
                            <%--<label class="col-sm-2 control-label">回款日期</label>
                            <div class="col-sm-4" id="data_2">
                                <div class="input-group date">
                                    <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                                    <input id="srBackDate" name="srBackDate" type="text" class="form-control" required="" aria-required="true" value="2012-11-11">
                                </div>
                            </div>--%>
                            <label class="col-sm-2 control-label">回款截止日期</label>
                            <div class="col-sm-4">
                                <div class="input-group date">
                                    <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                                    <input name="srEndBackPayment" type="text" disabled class="form-control" required="" aria-required="true">
                                    <input name="srEndBackPayment" type="hidden">
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label">是否回款</label>
                            <div class="col-sm-4">
                                <select id="srIsBack" name="srIsBack" class="form-control" required="" aria-required="true">
                                    <option value="-1">请选择是否回款</option>
                                    <c:forEach items="${isBack}" var="var">
                                        <option value="${var.dataValue}">${var.dataName}</option>
                                    </c:forEach>

                                </select>
                            </div>
                            <label class="col-sm-2 control-label">税点</label>
                            <div class="col-sm-4">
                                <select id="srTax" name="srTax" class="form-control" required="" aria-required="true">
                                    <option value="-1">请选择税点</option>
                                    <c:forEach items="${tax}" var="var">
                                        <option value="${var.dataValue}">${var.dataName}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label">销往省份</label>

                            <div class="col-sm-4">
                                <select id="srProvince" name="srProvince" class="form-control" required="" aria-required="true">
                                    <option value="-1">请选择城市</option>
                                    <c:forEach items="${province}" var="var">
                                        <option value="${var.dataValue}">${var.dataName}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <label class="col-sm-2 control-label">产品个数</label>
                            <div class="col-sm-4">
                                <div class="input-group">
                                    <input id="srGoodsNum" name="srGoodsNum" type="number" class="form-control" required="" aria-required="true">
                                    <span class="input-group-addon">个</span>
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label">胶圈费</label>

                            <div class="col-sm-4">
                                <div class="input-group">
                                    <input id="srRubberAmount" name="srRubberAmount" type="text" class="form-control float" required="" aria-required="true">
                                    <span class="input-group-addon"><i class="fa fa-rmb"></i></span>
                                </div>
                            </div>

                            <label class="col-sm-2 control-label">运费</label>

                            <div class="col-sm-4">
                                <div class="input-group">
                                    <input id="srFreight" name="srFreight" type="text" class="form-control float" required="" aria-required="true">
                                    <span class="input-group-addon"><i class="fa fa-rmb"></i></span>
                                </div>
                            </div>
                        </div>

                        <div class="form-group">

                            <label class="col-sm-2 control-label">是否设备提成</label>
                            <div class="col-sm-4">
                                <select id="srIsDeviceAward" name="srIsDeviceAward" class="form-control" required="" aria-required="true">
                                    <option value="-1">请选择是否设备提成</option>
                                    <c:forEach items="${isDeviceAward}" var="var">
                                        <option value="${var.dataValue}">${var.dataName}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <label class="col-sm-2 control-label">销售金额</label>

                            <div class="col-sm-4">
                                <div class="input-group">
                                    <input id="srSaleAmount" name="srSaleAmount" type="text" class="form-control float" required="" aria-required="true">
                                    <span class="input-group-addon"><i class="fa fa-rmb"></i></span>
                                </div>
                            </div>

                        </div>

                        <div class="form-group">

                            <label class="col-sm-2 control-label">销售金额总额</label>

                            <div class="col-sm-4">
                                <div class="input-group">
                                    <input id="srSaleAllAmount" name="srSaleAllAmount" type="text" class="form-control float" required="" aria-required="true">
                                    <span class="input-group-addon"><i class="fa fa-rmb"></i></span>
                                </div>
                            </div>

                            <label class="col-sm-2 control-label">备注信息</label>
                            <div class="col-sm-4">
                                <%--<input id="fpNote" name="fpNote" type="text" class="form-control" required="" aria-required="true">--%>
                                <div class="media-body">
                                    <textarea id="srBak" name="srBak" class="form-control" placeholder="备注信息..."></textarea>
                                </div>
                            </div>
                        </div>
                    </form>

                    <div style="text-align: right;padding-right: 30px;">
                        <button type="button" class="btn btn-w-m btn-primary" onclick="save();">保存</button>
                    </div>

                </div>
            </div>
        </div>
    </div>
</div>

<%--<div class="wrapper wrapper-content">
    <div class="row">
        <p style="padding-left: 18px;">
            <button type="button" class="btn btn-w-m btn-primary" id="addPro">新增</button>
            <button type="button" class="btn btn-w-m btn-warning" id="editPro">编辑</button>
            <button type="button" class="btn btn-w-m btn-danger" id="delete">删除</button>
        </p>
    </div>
    <div class="row">
        <div class="col-sm-12">
            <div class="ibox">
                <div class="jqGrid_wrapper">
                    <table id="table_list_1"></table>
                    <div id="pager_list_1"></div>
                </div>
            </div>
        </div>
    </div>

    <!-- 确认删除模态窗口 -->
    <div class="modal inmodal fade" id="myModal6" tabindex="-1" role="dialog"  aria-hidden="true">
        <div class="modal-dialog modal-sm">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <h4 class="modal-title">删除合同</h4>
                </div>
                <div class="modal-body">
                    <p>确定要删除&nbsp;<strong id="htname" style="color: red;"></strong>&nbsp;吗?</p>
                </div>
                <div class="modal-footer">
                    <button id="close_del_hetong" type="button" class="btn btn-white" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary" onclick="del();">确定</button>
                </div>
            </div>
        </div>

        <input type="hidden" id="htid">
        <input type="hidden" id="rowid">
    </div>

    <!-- 新增合同模态窗口 -->
    <div class="modal inmodal fade" id="myModal5" tabindex="-1" role="dialog"  aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">
                        <span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <h4 class="modal-title" id="modal5title">新增</h4>
                    &lt;%&ndash;<small class="font-bold">这里可以显示副标题。</small>&ndash;%&gt;
                </div>
                <div class="modal-body">

                    <form class="form-horizontal m-t" id="_sales_save" style="margin-right: 30px;">


                        <div class="form-group" id="data_1">
                            <label class="col-sm-2 control-label">销售日期</label>

                            <div class="col-sm-4">
                                <div class="input-group date">
                                    <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                                    <input id="srSaleDate" name="srSaleDate" onchange="dateadd()" type="text" class="form-control" required="" aria-required="true">
                                </div>
                            </div>
                            &lt;%&ndash;<label class="col-sm-2 control-label">回款日期</label>
                            <div class="col-sm-4" id="data_2">
                                <div class="input-group date">
                                    <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                                    <input id="srBackDate" name="srBackDate" type="text" class="form-control" required="" aria-required="true" value="2012-11-11">
                                </div>
                            </div>&ndash;%&gt;
                            <label class="col-sm-2 control-label">回款截止日期</label>
                            <div class="col-sm-4">
                                <div class="input-group date">
                                    <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                                    <input name="srEndBackPayment" type="text" disabled class="form-control" required="" aria-required="true">
                                    <input name="srEndBackPayment" type="hidden">
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label">是否回款</label>
                            <div class="col-sm-4">
                                <select id="srIsBack" name="srIsBack" class="form-control" required="" aria-required="true">
                                    <option value="-1">请选择是否回款</option>
                                    <c:forEach items="${isBack}" var="var">
                                        <option value="${var.dataValue}">${var.dataName}</option>
                                    </c:forEach>

                                </select>
                            </div>
                            <label class="col-sm-2 control-label">税点</label>
                            <div class="col-sm-4">
                                <select id="srTax" name="srTax" class="form-control" required="" aria-required="true">
                                    <option value="-1">请选择税点</option>
                                    <c:forEach items="${tax}" var="var">
                                        <option value="${var.dataValue}">${var.dataName}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label">销往省份</label>

                            <div class="col-sm-4">
                                <select id="srProvince" name="srProvince" class="form-control" required="" aria-required="true">
                                    <option value="-1">请选择城市</option>
                                    <c:forEach items="${province}" var="var">
                                        <option value="${var.dataValue}">${var.dataName}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <label class="col-sm-2 control-label">产品个数</label>
                            <div class="col-sm-4">
                                <div class="input-group">
                                    <input id="srGoodsNum" name="srGoodsNum" type="number" class="form-control" required="" aria-required="true">
                                    <span class="input-group-addon">个</span>
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label">胶圈费</label>

                            <div class="col-sm-4">
                                <div class="input-group">
                                    <input id="srRubberAmount" name="srRubberAmount" type="text" class="form-control float" required="" aria-required="true">
                                    <span class="input-group-addon"><i class="fa fa-rmb"></i></span>
                                </div>
                            </div>

                            <label class="col-sm-2 control-label">运费</label>

                            <div class="col-sm-4">
                                <div class="input-group">
                                    <input id="srFreight" name="srFreight" type="text" class="form-control float" required="" aria-required="true">
                                    <span class="input-group-addon"><i class="fa fa-rmb"></i></span>
                                </div>
                            </div>
                        </div>

                        <div class="form-group">

                            <label class="col-sm-2 control-label">是否设备提成</label>
                            <div class="col-sm-4">
                                <select id="srIsDeviceAward" name="srIsDeviceAward" class="form-control" required="" aria-required="true">
                                    <option value="-1">请选择是否设备提成</option>
                                    <c:forEach items="${isDeviceAward}" var="var">
                                        <option value="${var.dataValue}">${var.dataName}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <label class="col-sm-2 control-label">销售金额</label>

                            <div class="col-sm-4">
                                <div class="input-group">
                                    <input id="srSaleAmount" name="srSaleAmount" type="text" class="form-control float" required="" aria-required="true">
                                    <span class="input-group-addon"><i class="fa fa-rmb"></i></span>
                                </div>
                            </div>

                        </div>

                        <div class="form-group">

                            <label class="col-sm-2 control-label">销售金额总额</label>

                            <div class="col-sm-4">
                                <div class="input-group">
                                    <input id="srSaleAllAmount" name="srSaleAllAmount" type="text" class="form-control float" required="" aria-required="true">
                                    <span class="input-group-addon"><i class="fa fa-rmb"></i></span>
                                </div>
                            </div>

                            <label class="col-sm-2 control-label">备注信息</label>
                            <div class="col-sm-4">
                                &lt;%&ndash;<input id="fpNote" name="fpNote" type="text" class="form-control" required="" aria-required="true">&ndash;%&gt;
                                <div class="media-body">
                                    <textarea id="srBak" name="srBak" class="form-control" placeholder="备注信息..."></textarea>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-white" data-dismiss="modal">关闭</button>
                    <button class="btn btn-primary" type="button" onclick="save();" id="modal_add">新增</button>
                    <button class="btn btn-warning" type="button" onclick="update();" id="modal_update">更新</button>

                </div>
            </div>
        </div>
    </div>

</div>--%>

<!-- 全局js -->
<script src="<%=path%>/static/hplus/js/jquery.min.js?v=2.1.4"></script>
<script src="<%=path%>/static/hplus/js/bootstrap.min.js?v=3.3.6"></script>
<!-- Peity -->
<script src="<%=path%>/static/hplus/js/plugins/peity/jquery.peity.min.js"></script>
<!-- jqGrid -->
<script src="<%=path%>/static/hplus/js/plugins/jqgrid/i18n/grid.locale-cn.js?0820"></script>
<script src="<%=path%>/static/hplus/js/plugins/jqgrid/jquery.jqGrid.min.js?0820"></script>
<!-- Input Mask-->
<script src="<%=path%>/static/hplus/js/plugins/jasny/jasny-bootstrap.min.js"></script>
<!-- jQuery Validation plugin javascript-->
<script src="<%=path%>/static/hplus/js/plugins/validate/jquery.validate.min.js"></script>
<script src="<%=path%>/static/hplus/js/plugins/validate/messages_zh.min.js"></script>
<script src="<%=path%>/static/hplus/js/demo/form-validate-demo.js"></script>
<!-- tips -->
<script src="<%=path%>/static/js/jquery.tips.js"></script>
<!-- DROPZONE -->
<script src="<%=path%>/static/hplus/js/plugins/dropzone/dropzone.js"></script>
<!-- Toastr script -->
<script src="<%=path%>/static/hplus/js/plugins/toastr/toastr.min.js"></script>
<!-- Data picker -->
<script src="<%=path%>/static/hplus/js/plugins/datapicker/bootstrap-datepicker.js"></script>
<!-- auto search -->
<script src="<%=path%>/static/hplus/js/plugins/suggest/bootstrap-suggest.min.js"></script>
<!-- Data picker -->
<script src="<%=path%>/static/hplus/js/plugins/datapicker/bootstrap-datepicker.js"></script>
<!-- 自定义js -->
<script src="<%=path%>/static/js/json2.js"></script>
<script src="<%=path%>/static/sales/sales_input.js"></script>



<script type="text/javascript">


    $(document).ready(function () {

        $('#data_1 .input-group.date').datepicker({
            todayBtn: "linked",
            keyboardNavigation: false,
            forceParse: false,
            calendarWeeks: true,
            autoclose: true
        });

        //toast setting
        toastr.options = {
            "closeButton": true,
            "debug": false,
            "progressBar": true,
            "positionClass": "toast-top-right",
            "onclick": null,
            "showDuration": "400",
            "hideDuration": "1000",
            "timeOut": "3000",
            "extendedTimeOut": "1000",
            "showEasing": "swing",
            "hideEasing": "linear",
            "showMethod": "fadeIn",
            "hideMethod": "fadeOut"
        };

        //Jqgrid setting
        $.jgrid.defaults.styleUI = 'Bootstrap';
        /*$("#table_list_1").jqGrid({
         url: "keyanhetong/getKyList",
         datatype: "json",
         height: 'auto',
         autowidth: true,
         shrinkToFit: true,
         rowNum: 10,
         rowList: [10, 20, 30],
         colNames: ['ID','序号','合同编号', '合同名称', '项目来源', '负责部门', '负责人', '开始时间', '结束时间','第一金额', '第二金额', '第三金额','总金额',
         '项目来源id','负责部门id'],//, '创建时间','创建人'
         colModel: [
         {
         name: 'kyId',
         index: 'kyId',
         width: 40,
         hidden: true
         },
         {
         name: 'xulie',
         index: 'xulie',
         width: 40,
         sorttype: "int",
         formatter: "int"
         },
         {
         name: 'kyNumber',
         index: 'kyNumber',
         width: 60,
         sorttype: "int",
         formatter: "int"
         },
         {
         name: 'kyName',
         index: 'kyName',
         width: 80
         },
         {
         name: 'proTypeName',
         index: 'proTypeName',
         width: 50
         },
         {
         name: 'depName',
         index: 'depName',
         width: 60
         },
         {
         name: 'fuzer',
         index: 'fuzer',
         width: 50
         },
         {
         name: 'kyStartDateStr',
         index: 'kyStartDateStr',
         width: 60
         },
         {
         name: 'kyEndDateStr',
         index: 'kyEndDateStr',
         width: 50
         },
         {
         name: 'kyAmount',
         index: 'kyAmount',
         width: 50,
         sorttype: "float",
         formatter: "number"
         },
         {
         name: 'kyAmountTwo',
         index: 'kyAmountTwo',
         width: 50,
         sorttype: "float",
         formatter: "number"
         },
         {
         name: 'kyAmountThree',
         index: 'kyAmountThree',
         width: 50,
         sorttype: "float",
         formatter: "number"
         },
         {
         name: 'kySumAmount',
         index: 'kySumAmount',
         width: 60,
         sorttype: "float",
         formatter: "number"
         },
         {
         name: "kyProType",
         index: "kyProType",
         hidden: true

         },
         {
         name: "kyDutyDep",
         index: "kyDutyDep",
         hidden: true

         }
         ],
         pager: "#pager_list_1",
         viewrecords: true,
         caption: "科研项目列表",
         hidegrid: false,
         onSelectRow: function (rowid) {
         var rowData = $('#table_list_1').jqGrid('getRowData',rowid);
         //console.log(rowData)
         $('#htname').html(rowData.kyName);
         $('#htid').val(rowData.kyId);
         $('#rowid').val(rowid);

         //console.log(rowData);
         $('#kyNumber').val(rowData.kyNumber);
         $('#kyName').val(rowData.kyName);
         display(rowData.kyProType,$('#kyProType'));
         display(rowData.kyDutyDep,$('#kyDutyDep'));
         $('#kyDutyId').val(rowData.fuzer);
         $('#kyStartDate').val(rowData.kyStartDateStr);
         $('#kyEndDate').val(rowData.kyEndDateStr);
         $('#kyAmount').val(rowData.kyAmount);
         $('#kyAmountTwo').val(rowData.kyAmountTwo);
         $('#kyAmountThree').val(rowData.kyAmountThree);
         //console.log('Click');
         },
         ondblClickRow: function(rowid){
         //console.log('dbClick');
         var rowData = $('#table_list_1').jqGrid('getRowData',rowid);
         //alert(rowData.kyId)
         location.href="keyanhetong/details?id="+rowData.kyId;
         //console.log(rowData)
         }

         });*/

        $(window).bind('resize', function () {
            var width = $('.jqGrid_wrapper').width();
            $('#table_list_1').setGridWidth(width);
        });

    });
</script>

</body>

</html>
