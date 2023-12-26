package just_test;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class naverAPItest {

//	public void main(String choiceUrl) throws IOException {
//
//		URL url = new URL(choiceUrl);
//		BufferedReader bufferedreader = new BufferedReader(new InputStreamReader(url.openStream()));
//		StringBuffer sourceCode = new StringBuffer();
//
//		String sourceLine = "";
//
//		while ((sourceLine = bufferedreader.readLine()) != null) {
//			sourceCode.append(sourceLine + "\n");
//		}
//
//		String result = sourceCode.toString();
//		System.out.println(result);
//	}

	public void naverTest() throws IOException {

		String URL = "https://finance.naver.com/sise/sise_quant.naver";
		Document doc = Jsoup.connect(URL).get();
		
		if (doc != null) {

			Elements elements = doc.select("#wrap");

			for (Element element : elements) {

				String[] splitparts = element.text().split("\\s"); // test

				for (String s : splitparts) { // test
					System.out.println(s); // test
				} // test

//				String txt = element.text();
//				System.out.println(txt);
//				System.out.println("\n=======================================\n");

			}

//		 System.out.println(doc.text());

		}
	}

	public static void main(String[] args) throws IOException {

		naverAPItest test = new naverAPItest();

		test.naverTest();
	}

}
