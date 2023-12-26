package world.navie.www;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
	@RequestMapping("index")
	public void index() {}
	
	@RequestMapping("header")
	public String header() {
		return "default/header";
	}
	
	@RequestMapping("categoriesheader")
	public String categoriesheader() {
		return "categories/categoriesheader";
	}
	
	@RequestMapping("boardheader")
	public String boardheader() {
		return "board/boardheader";
	}
	
	@RequestMapping("boardheader2")
	public String boardheader2() {
		return "board2/boardheader2";
	}
	
	@RequestMapping("body")
	public String main() {
		return "default/body";
	}
	
	@RequestMapping("footer")
	public String footer() {
		return "default/footer";
	}
	
	@RequestMapping("movie")
	public String movie() {
		return "categories/movie";
	}
	
	@RequestMapping("movie_second")
	public String movie_second() {
		return "categories/movie_second";
	}
	
	@RequestMapping("drama")
	public String drama() {
		return "categories/drama";
	}
	
	@RequestMapping("animation")
	public String animation() {
		return "categories/animation";
	}
	
	@RequestMapping("movie_1")
	public String movie_1() {
		return "categories/movie/movie_1";
	}
	
	@RequestMapping("movie_2")
	public String movie_2() {
		return "categories/movie/movie_2";
	}
	
	@RequestMapping("movie_3")
	public String movie_3() {
		return "categories/movie/movie_3";
	}
	
	@RequestMapping("drama_1")
	public String drama_1() {
		return "categories/drama/drama_1";
	}
	
	@RequestMapping("drama_2")
	public String drama_2() {
		return "categories/drama/drama_2";
	}
	
	@RequestMapping("drama_3")
	public String drama_3() {
		return "categories/drama/drama_3";
	}
	
	@RequestMapping("animation_1")
	public String animation_1() {
		return "categories/animation/animation_1";
	}
	
	@RequestMapping("animation_2")
	public String animation_2() {
		return "categories/animation/animation_2";
	}
	
	@RequestMapping("animation_3")
	public String animation_3() {
		return "categories/animation/animation_3";
	}
}
