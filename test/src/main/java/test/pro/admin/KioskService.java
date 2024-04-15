package test.pro.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class KioskService {

	@Autowired
	KioskDAO kioskDAO;

	public List<KioskVO> admin() {
		System.out.println("service 진입");

		return kioskDAO.admin();
	}

	public List<KioskVO> main(String goods_category) {
		System.out.println("service 진입");

		return kioskDAO.main(goods_category);
	}

	public void insertgoods(KioskVO vo) {
		System.out.println("service 진입");
		kioskDAO.insertgoods(vo);
		System.out.println("service 종료");
	}

	public void deletegoods(KioskVO vo) {
		System.out.println("service 진입");
		kioskDAO.deletegoods(vo);
		System.out.println("service 종료");
	}

	public KioskVO getgoods(int goods_id) {

		return kioskDAO.getgoods(goods_id);
	}

	public void updategoods(KioskVO vo) {
		System.out.println("service 진입");
		kioskDAO.updategoods(vo);
		System.out.println("service 종료");
	}

	public void addcart(KioskVO vo) {
        System.out.println("Service 진입");
        kioskDAO.addcart(vo);
        System.out.println("Service 종료");
    }

}
















