package com.example.locale;

import org.mybatis.generator.api.MyBatisGenerator;
import org.mybatis.generator.config.Configuration;
import org.mybatis.generator.config.xml.ConfigurationParser;
import org.mybatis.generator.internal.DefaultShellCallback;

import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

/**
 * @ClassName dEMO
 * @Description TODO
 * @Author 胡泽
 * @Date 2019/8/28 9:23
 * @Version 1.0
 */
public class Demo {
    public static void main(String[] args) throws Exception {
        List<String> list = new ArrayList<>();
         boolean overwrite=true;
        ConfigurationParser configurationParser = new ConfigurationParser(list);
        InputStream resourceAsStream = Thread.currentThread().getContextClassLoader().getResourceAsStream("mbg.xml");
        Configuration configuration = configurationParser.parseConfiguration(resourceAsStream);
        DefaultShellCallback defaultShellCallback = new DefaultShellCallback(overwrite);
        MyBatisGenerator myBatisGenerator = new MyBatisGenerator(configuration, defaultShellCallback, list);
          myBatisGenerator.generate(null);

    }
}
