
$(function(){

    $('.float').blur(function(){

        var reg = new RegExp("^[0-9]*$");
        if(!reg.test($(this).val())){
            $(this).tips({
                side : 1,
                msg : "格式不正确",
                bg : '#FF6461',
                time : 2
            });
            $(this).val('');
            return;
        }

        if($(this).val().length!=0){
            $(this).val(fmoney($(this).val(),2));
        }
    });

    /*$('.float').blur(function(){
     if($(this).val().length!=0){
     $(this).val(fmoney($(this).val(),2));
     }

     var inp = $('#_sales_save').find('.float');

     var f = 0.0;
     for(var i=0;i<inp.length;i++){
     if($(inp[i]).val().length!=0){
     f += parseFloat($(inp[i]).val());
     }
     }
     $('#srSaleAllAmount').val(fmoney(f));
     });*/
    var mydate = new Date();
    $('#currenttime').html(mydate.toLocaleString());

    var timer = setInterval( function(){
        var mydate1 = new Date();
        $('#currenttime').html(mydate1.toLocaleString());
    }, 1000);
});

function dateadd(){

    var s = FormatDate(AddDays(new Date(Replace($('#srSaleDate').val(), "-", "/")),100),"yyyy-MM-dd");
    //$('#srEndBackPayment').val(s);
    $('input[name="srEndBackPayment"]').val(s)
}

function save(){
    if(validate()){
        var d = {};
        var t = $('#_sales_save').serializeArray();
        $.each(t, function() {
            d[this.name] = this.value;
        });

        $.ajax({
            type: "POST",
            url: 'sales/save',
            data: {"str":JSON.stringify(d)},
            dataType:'json',
            cache: false,
            success: function(data){
                if(data.result){
                    console.log(data);
                    //$('#myModal5').modal('hide');
                    //$("#table_list_1").jqGrid().trigger('reloadGrid');
                    toastr.success(data.msg, '操作提示');
                }else{
                    toastr.error(data.msg, '操作提示');
                }

            },
            error: function(e){
                console.log(e);
            }
        });
    }
}

//替换字符串
function Replace(str, from, to) {
    return str.split(from).join(to);
}

function AddDays(date, value) {
    date.setDate(date.getDate() + value);
    return date;
}

// 日期类型格式成指定的字符串
function FormatDate(date, format) {
    format = Replace(format, "yyyy", date.getFullYear());
    format = Replace(format, "MM", GetFullMonth(date));
    format = Replace(format, "dd", GetFullDate(date));
    format = Replace(format, "HH", GetFullHour(date));
    return format;
}

//返回月份(两位数)
function GetFullMonth(date) {
    var v = date.getMonth() + 1;
    if (v > 9) return v.toString();
    return "0" + v;
}

//返回日(两位数)
function GetFullDate(date) {
    var v = date.getDate();
    if (v > 9) return v.toString();
    return "0" + v;
}
//返回时(两位数)
function GetFullHour(date) {
    var v = date.getHours();
    if (v > 9) return v.toString();
    return "0" + v;
}

function validate(){
    var srSaleDate = $('#srSaleDate');
    var srIsBack = $('#srIsBack');
    var srProvince = $('#srProvince');
    var srRubberAmount = $('#srRubberAmount');
    var srIsDeviceAward = $('#srIsDeviceAward');
    var srSaleAllAmount = $('#srSaleAllAmount');
    var srGoodsNum = $('#srGoodsNum');
    var srFreight = $('#srFreight');
    var srSaleAmount = $('#srSaleAmount');
    var srBak = $('#srBak');
    var srBackDate = $('#srBackDate')

    if(isNull(srSaleDate.val())){
        srSaleDate.tips({
            side : 1,
            msg : "请选择销售日期",
            bg : '#FF6461',
            time : 5
        });
        return false;
    }
    else if(isNull(srIsBack.val()) || srIsBack.val()=='-1'){
        srIsBack.tips({
            side : 1,
            msg : "请选择是否回款",
            bg : '#FF6461',
            time : 5
        });
        return false;
    }
    else if(isNull(srProvince.val()) || srProvince.val()=='-1'){
        srProvince.tips({
            side : 1,
            msg : "请选择销往省份",
            bg : '#FF6461',
            time : 5
        });
        return false;
    }
    else if(isNull(srRubberAmount.val())){
        srRubberAmount.tips({
            side : 1,
            msg : "请填写胶圈费",
            bg : '#FF6461',
            time : 5
        });
        return false;
    }
    else if(isNull(srIsDeviceAward.val()) || srIsDeviceAward.val()=='-1'){
        srIsDeviceAward.tips({
            side : 1,
            msg : "请选择是否设备提成",
            bg : '#FF6461',
            time : 5
        });
        return false;
    }
    else if(isNull(srSaleAllAmount.val())){
        srSaleAllAmount.tips({
            side : 1,
            msg : "请填写销售金额总额",
            bg : '#FF6461',
            time : 5
        });
        return false;
    }
    else if(isNull(srGoodsNum.val())){
        srGoodsNum.tips({
            side : 1,
            msg : "请填写产品个数",
            bg : '#FF6461',
            time : 5
        });
        return false;
    }
    else if(isNull(srFreight.val())){
        srFreight.tips({
            side : 1,
            msg : "请填写运费",
            bg : '#FF6461',
            time : 5
        });
        return false;
    }
    else if(isNull(srSaleAmount.val())){
        srSaleAmount.tips({
            side : 1,
            msg : "请填写销售总额",
            bg : '#FF6461',
            time : 5
        });
        return false;
    }
    else {
        return true;
    }
}

function isNull(str){
    if(str==''||str.length==0){
        return true;
    }else {
        return false;
    }
}

function fmoney(s, n){ //s:传入的float数字 ，n:希望返回小数点几位
    n = n > 0 && n <= 20 ? n : 2;
    s = parseFloat((s + "").replace(/[^\d\.-]/g, "")).toFixed(n) + "";
    var l = s.split(".")[0].split("").reverse(),
        r = s.split(".")[1];
    t = "";
    for(i = 0; i < l.length; i ++ )
    {
        t += l[i] + ((i + 1) % 3 == 0 && (i + 1) != l.length ? "," : "");
    }
    return t.split("").reverse().join("") + "." + r;
}