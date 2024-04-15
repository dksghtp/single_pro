package test.pro.admin;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class KioskDAO {

	@Autowired
	public SqlSessionTemplate mybatis;

	public List<KioskVO> admin() {
		System.out.println("DAO 진입");
		return mybatis.selectList("kioskMapper.admingoodsList");
	}

	public List<KioskVO> main(String goods_category) {
        System.out.println("DAO 진입");
        return mybatis.selectList("kioskMapper.mainselect", goods_category);
    }

	public void insertgoods(KioskVO vo) {
		System.out.println("DAO 진입");
		mybatis.insert("kioskMapper.insertgoods", vo);
		System.out.println("DAO 종료");
	}

	public void deletegoods(KioskVO vo) {
		System.out.println("DAO 진입");
		mybatis.delete("kioskMapper.deletegoods", vo);
		System.out.println("DAO 종료");
	}

	public KioskVO getgoods(int goods_id) {

		mybatis.selectOne("kioskMapper.getgoods", goods_id);

		return mybatis.selectOne("kioskMapper.getgoods", goods_id);
	}

	public void updategoods(KioskVO vo) {
		System.out.println("DAO 진입");
		mybatis.update("kioskMapper.updategoods", vo);
		System.out.println("DAO 종료");
	}

	public void addcart(KioskVO vo) {
		System.out.println("DAO 진입");
		mybatis.insert("kioskMapper.addcart", vo);
		System.out.println("DAO 종료");
	}

}













