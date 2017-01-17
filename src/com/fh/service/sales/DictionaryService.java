package com.fh.service.sales;

import com.fh.dao.DaoSupport;
import com.fh.entity.sales.Dictionary;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * 创建人: 徐众垚
 * 创建时间: 2017/1/17
 * 公司: 唐山徕思歌科技有限公司
 * 描述: 字典表
 */
@Service("dictionaryService")
public class DictionaryService {

    @Resource(name = "daoSupport")
    private DaoSupport dao;

    /**
     * 根据类型查询
     * @param type
     * @return
     * @throws Exception
     */
    public List<Dictionary> getDictData(int type) throws Exception {
        return (List<Dictionary>) dao.findForList("DictionaryMapper.getDict",type);
    }


}
