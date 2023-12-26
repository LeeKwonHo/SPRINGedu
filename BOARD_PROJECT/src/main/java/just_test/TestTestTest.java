package just_test;

import java.io.IOException;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class TestTestTest {

	public static void main(String[] args) throws IOException {

		/*
	     *	Document 클래스 : 연결해서 얻어온 HTML 전체 문서
	     *	Element 클래스  : Documnet의 HTML 요소 Elements
		 * 클래스 : Element가 모인 자료형
		 */

		String url = "https://finance.naver.com/sise/sise_quant.naver";

		Document doc = Jsoup.connect(url).get();

//		String result = doc.toString(); 모든 값 텍스트

//		System.out.println(result);

		Elements elements = doc.getAllElements();

		for (Element e : elements) {

			if (e != null) {

//				String aaa =  e.text();
//				System.out.println(e.text()); //모든 텍스트
//				System.out.println(e.attr("href")); // href만 텍스트
				
				System.out.println(e.html());
				
			}

		}

	}

}
