package com.fh.service.sales;

import com.fh.dao.DaoSupport;
import com.fh.entity.Page;
import com.fh.util.PageData;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * 创建人: 徐众垚
 * 创建时间: 2017/1/17
 * 公司: 唐山徕思歌科技有限公司
 * 描述:
 */
@Service("salesPerService")
public class SalesPerService {

    @Resource(name = "daoSupport")
    private DaoSupport dao;


    public void save(PageData pd) throws Exception {
        dao.save("SalesPerMapper.save",pd);
    }
    /*
    *列表
    */
    public List<PageData> list(Page page)throws Exception{
        return (List<PageData>)dao.findForList("SalesPerMapper.datalistPage", page);
    }
}
