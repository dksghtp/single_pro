package test.human.controller;

import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class dbTest {
	
	@Autowired
	DataSource ds;
	
	Connection con;
	PreparedStatement pstmt;
	
	@Test
	public void dbTest() throws Exception{
		
		String sql = "insert into goods (goods_id, goods_name, goods_count) values(10, '치킨', 10)";
		
		con = ds.getConnection();
		pstmt = con.prepareStatement(sql);
		
		pstmt.execute();
	}

}
