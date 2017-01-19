package com.fh.controller.sales;

import com.fh.controller.base.BaseController;
import com.fh.entity.JqGridPageView;
import com.fh.entity.Page;
import com.fh.entity.sales.Dictionary;
import com.fh.entity.sales.SalesRoom;
import com.fh.entity.sales.Vasion;
import com.fh.entity.system.User;
import com.fh.entity.vo.JsonVo;
import com.fh.service.sales.DictionaryService;
import com.fh.service.sales.SalesPerService;
import com.fh.util.DateUtil;
import com.fh.util.PageData;
import com.google.gson.JsonObject;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * 公司: 唐山徕思歌科技有限公司
 * 创建人: 徐众垚
 * 创建时间: 2017/1/17
 * 描述: 销售业绩
 */
@Controller
@RequestMapping(value = "/sales")
public class SalesPerformance extends BaseController{

    String menuUrl = "sales/input.do"; //菜单地址(权限用)

    @Resource
    SalesPerService salesPerService;

    @Resource
    DictionaryService dictionaryService;

    @RequestMapping(value = "/input")
    public ModelAndView input() throws Exception {
        ModelAndView mv = getModelAndView();

        //salesPerService.save(null);
        List<Dictionary> isBack = dictionaryService.getDictData(3);//是否回款
        List<Dictionary> tax = dictionaryService.getDictData(1);//税点
        List<Dictionary> isDeviceAward = dictionaryService.getDictData(2);//是否设备提成
        List<Dictionary> province = dictionaryService.getDictData(4);//城市

        mv.setViewName("sales/sales_input_view");
        mv.addObject("isBack",isBack);
        mv.addObject("tax",tax);
        mv.addObject("isDeviceAward",isDeviceAward);
        mv.addObject("province",province);
        return mv;
    }

    @RequestMapping(value = "/save", method = RequestMethod.POST)
    @ResponseBody
    public JsonVo save(String str){
        JsonVo json = getJsonVo();
        try {
            JSONObject jb = JSONObject.fromObject(str);
            SalesRoom salesRoom = (SalesRoom)JSONObject.toBean(jb,SalesRoom.class);//将建json对象转换为SalesRoom对象
            User user = getCurrentUser();
            PageData pd = getPageData();
            pd.put("srSaleDate",salesRoom.getSrSaleDate());
            pd.put("srIsBack",salesRoom.getSrIsBack());
            pd.put("srProvince",salesRoom.getSrProvince());
            pd.put("srRubberAmount",salesRoom.getSrRubberAmount());
            pd.put("srIsDeviceAward",salesRoom.getSrIsDeviceAward());
            pd.put("srSaleAllAmount",salesRoom.getSrSaleAllAmount());
            pd.put("srEndBackPayment",salesRoom.getSrEndBackPayment());
            pd.put("srTax",salesRoom.getSrTax());
            pd.put("srGoodsNum",salesRoom.getSrGoodsNum());
            pd.put("srFreight",salesRoom.getSrFreight());
            pd.put("srSaleAmount",salesRoom.getSrSaleAmount());
            pd.put("srBak",salesRoom.getSrBak());
            /**/
            pd.put("srCreateUser",user.getUSER_ID());
            pd.put("srCreateDate", DateUtil.getTime());
            salesPerService.save(pd);
            json.setResult(true);
            json.setMsg("保存成功");
        } catch (Exception e) {
            e.printStackTrace();
            json.setResult(false);
            json.setMsg("保存失败");
        }
        return json;
    }
    @RequestMapping(value = "/show")
    public ModelAndView show() throws Exception {
        ModelAndView mv = getModelAndView();
        mv.setViewName("sales/sales_list_view");
        return mv;
    }
    @RequestMapping(value="/salesList",method = RequestMethod.GET)
    @ResponseBody
    public JqGridPageView<PageData> receiveList(Page page){
        JqGridPageView<PageData> infoList = new JqGridPageView<>();
        PageData pd = new PageData();
        try{
            pd = this.getPageData();
            String KEYW = pd.getString("keyword");
            if(null != KEYW && !"".equals(KEYW)){
                KEYW = KEYW.trim();
                pd.put("KEYW", KEYW);
            }
            page.setPd(pd);
            List<PageData> varList = salesPerService.list(page);
            infoList.setMaxResults(10);
            infoList.setRows(varList);

            infoList.setRecords(page.getTotalResult());
        } catch (Exception e) {
            logger.error(e.getMessage(),e);
        }
        logAfter(logger);

        return infoList;
    }
    @RequestMapping(value="/selectPeo",method = RequestMethod.GET)
    @ResponseBody
    public JsonVo  selectPeo(HttpServletResponse response) throws Exception{
        JsonVo<List<Vasion>> json = new JsonVo<>();
        PageData pd = new PageData();
        pd = this.getPageData();
        List list = salesPerService.selectPeo(pd);
        JSONArray Js = JSONArray.fromObject(list);
        json.setT(list);
        return json;
    }
}
