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
    <title>销售业绩列表</title>
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
            <div class="ibox ">
                <%-- <div class="ibox-title">
                     <h5>jQuery Grid Plugin – jqGrid</h5>
                 </div>--%>
                <div class="ibox-content">
                    <p>
                        <button  id="selectId" class="btn btn-warning btn-sm" type="button"><i class="fa fa-search"></i>&nbsp;&nbsp; <span class="bold">查询</span> </button>
                        <%--<button id="addNew" class="btn btn-primary btn-sm " type="button"><i class="fa fa-plus"></i>&nbsp;&nbsp;<span class="bold">新增</span></button>--%>
                        <%--<button class="btn btn-success btn-sm" type="button"><i class="fa fa-upload"></i>&nbsp;&nbsp;<span class="bold">导入</span>--%>
                        <%--</button>--%>


                    </p>
                </div>
                <div class="ibox-content">
                    <div class="jqGrid_wrapper">
                        <table id="table_list_1"></table>
                        <div id="pager_list_1"></div>
                    </div>
                    <p>&nbsp;</p>
                </div>
            </div>
        </div>
    </div>

</div>
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
    $(function(){
        $.jgrid.defaults.styleUI = 'Bootstrap';
        $("#table_list_1").jqGrid({
            //data: mydata,
            url:'sales/salesList',
            datatype: "json",
            height: 550,
            autoheight: true,
            autowidth: true,
            shrinkToFit: true,
            rownumbers: true,
            rowNum: 14,
            rowList: [10, 20, 30],
            colNames: ['序号', '销售日期','销售人员','销售金额总额','个数','销往省份','运费','操作'],
            colModel: [
                {
                    name: 'S_R_ID',
                    index: 'S_R_ID',
                    width: 60,
                    hidden:true,
                    sorttype: "int"
                },
                {
                    name: 'sr_sale_date',
                    index: 'sr_sale_date',
                    width: 90

                },
                {
                    name: 'payName',
                    index: 'payName',
                    width: 90

                },
                {
                    name: 'sr_sale_all_amount',
                    index: 'sr_sale_all_amount',
                    width: 90

                },
                {
                    name: 'sr_goods_num',
                    index: 'sr_goods_num',
                    width: 90

                },
                {
                    name: 'sr_province',
                    index: 'sr_province',
                    width: 90

                },
                {
                    name: 'sr_rubber_amount',
                    index: 'sr_rubber_amount',
                    width: 90

                },
                {
                    name: 'note',
                    index: 'note',
                    width: 80,
                    sortable: false,
                    formatter: function (cellvalue, options, rowdata) {
                        return '<a href="www.baidu.com">删除</a>';
                    }
                }
            ],
            pager: "#pager_list_1",
            viewrecords: true,
            hidegrid: false,
        });

        $(window).bind('resize', function () {
            var width = $('.jqGrid_wrapper').width();
            $('#table_list_1').setGridWidth(width);
            $('#table_list_2').setGridWidth(width);
        });
    });
</script>

</body>

</html>
