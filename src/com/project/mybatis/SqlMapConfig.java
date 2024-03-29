package com.project.mybatis;

import java.io.IOException;
import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class SqlMapConfig {
	private static SqlSessionFactory factory;
	
//	클래스 초기화 블럭, static블럭 (클래스가 처음 로딩될 때 한번만 수행)
	static {
		try {
			String resource = "./com/project/mybatis/config.xml";
			Reader reader = Resources.getResourceAsReader(resource);
//					  [			건축가			   ]  +	  [ 공학자  ]
			factory = new SqlSessionFactoryBuilder().build(reader);
		} catch (IOException ioe) {
			System.out.println("초기화 문제 발생 : "+ioe);
		}
	
	
	}
	public static SqlSessionFactory getFactory() {
		return factory;
	}
}



