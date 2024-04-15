package test.pro.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class KioskController {
	
	@Autowired
	KioskService kioskService;
	
	@RequestMapping(value="/")
	public String intro() {
		
		return "intro";
	}
	
	@RequestMapping(value="admin")
	public void admin(Model model) {
		List<KioskVO> testList = kioskService.admin();
		System.out.println("admin페이지 접속");
		model.addAttribute("admingoodsList",kioskService.admin());
		for (int i=0; i < testList.size(); i++) {
			KioskVO vo = testList.get(i);
			System.out.println(vo.getGoods_name());
		}
	}
	
	@RequestMapping(value = "/main")
	public String main(@RequestParam(required = false) String category, Model model) {
	    System.out.println("main 페이지 접속");
	    List<KioskVO> mainItems;
	    if (category != null && !category.isEmpty()) {
	        mainItems = kioskService.main(category);
	    } else {
	        mainItems = kioskService.main("버거"); // 카테고리가 지정되지 않은 경우 전체 상품을 가져옴
	    }
	    model.addAttribute("mainItems", mainItems);
	    return "main";
	}
	
	@RequestMapping(value="insert")
	public String insert() {
		
		return "insert";
	}
	@RequestMapping(value="insertgoods")
	public String insertgoods(KioskVO vo) {
		kioskService.insertgoods(vo);
		return "redirect:admin";
	}
	
	@RequestMapping(value="deletegoods")
	public String deletegoods(KioskVO vo) {
		kioskService.deletegoods(vo);
		return "redirect:admin";
	}
	
	@RequestMapping(value="getgoods")
	public String getGoods(@RequestParam("goods_id") int goods_id, Model model) {
		
	    KioskVO vo = kioskService.getgoods(goods_id);
	    model.addAttribute("goods", vo);
	    
	    return "getgoods";
	}
	@RequestMapping(value="updategoods")
	public String updategoods(KioskVO vo) {
		System.out.println("updategoods페이지 접속");
		kioskService.updategoods(vo);
		System.out.println("updategoods페이지 종료");
		return "redirect:admin";
	}
	
	@RequestMapping(value = "/addcart", method = RequestMethod.GET)
    public String addcart(@RequestParam("goods_id") int goods_id) {
		System.out.println("addcart 접속");
		try {
	        KioskVO vo = new KioskVO();
	        vo.setGoods_id(goods_id);
	        kioskService.addcart(vo);
	        System.out.println("addcart 종료");
	        return "redirect:/main"; // 성공 시 메인 페이지로 리다이렉트
	    } catch (Exception e) {
	        e.printStackTrace();
	        return "error"; // 오류 발생 시 에러 페이지로 이동하도록 변경
	    }
    }
	
}

















