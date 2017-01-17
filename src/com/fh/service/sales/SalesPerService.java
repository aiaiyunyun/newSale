package com.fh.service.sales;

import com.fh.dao.DaoSupport;
import com.fh.util.PageData;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

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

}
