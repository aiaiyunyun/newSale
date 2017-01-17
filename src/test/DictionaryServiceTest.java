package test;

import com.fh.service.sales.DictionaryService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;

/**
 * 创建人: 徐众垚
 * 创建时间: 2017/1/17
 * 公司: 唐山徕思歌科技有限公司
 * 描述:
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:spring/ApplicationContext.xml"})
public class DictionaryServiceTest {

    @Resource
    DictionaryService dictionaryService;

    @Test
    public void testGetDictData() throws Exception {

        System.out.println("123");

    }
}