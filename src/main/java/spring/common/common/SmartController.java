package spring.common.common;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.UUID;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

@RestController
public class SmartController {
	//단일파일업로드
	@RequestMapping(value = "/common/photoUpload.do")
	public String photoUpload(HttpServletRequest request, PhotoVo vo) throws UnsupportedEncodingException{
		String callback = vo.getCallback();
		String callback_func = vo.getCallback_func();
		String file_result = "";
		String result = "";
		MultipartFile multiFile = vo.getFiledata();
		try {
			if(multiFile != null && multiFile.getSize() > 0 && StringUtils.isNotBlank(multiFile.getName())){
				if(multiFile.getContentType().toLowerCase().startsWith("image/")) {
					//파일이 존재하면
					String original_name = multiFile.getName();
					//파일 기본경로
					String defaultPath = request.getSession().getServletContext().getRealPath("/resources");
					//파일 기본경로 _ 상세경로
					String path = defaultPath + "/photo_upload/";          
					File file = new File(path);
					System.out.println("path:"+path);
					//디렉토리 존재하지 않을경우 디렉토리 생성
					if(!file.exists()) {
						file.mkdirs();
					}
					//서버에 업로드 할 파일명(한글문제로 인해 원본파일은 올리지 않는것이 좋음)
					String realname = UUID.randomUUID().toString();
					///////////////// 서버에 파일쓰기 /////////////////
					vo.getFiledata().transferTo(new File(path+realname));
					file_result += "&bNewLine=true&sFileName="+original_name+"&sFileURL=/resources/photo_upload/"+realname;
				} else {
					file_result += "&errstr=error";
				}
			}else {
				file_result += "&errstr=error";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		result = "redirect:" + callback + "?callback_func=" + URLEncoder.encode(callback_func,"UTF-8")+file_result;
		return result;
	}

	//다중파일업로드
	@RequestMapping(value = "/common/multiplePhotoUpload.do")
	public void multiplePhotoUpload(HttpServletRequest request, HttpServletResponse response){
		try {
			//파일정보
			String sFileInfo = "";
			//파일명을 받는다 - 일반 원본파일명
			String filename = request.getHeader("file-name");
			//파일 확장자
			String filename_ext = filename.substring(filename.lastIndexOf(".")+1);
			//확장자를소문자로 변경
			filename_ext = filename_ext.toLowerCase();
			//파일 기본경로
			String dftFilePath = request.getSession().getServletContext().getRealPath("/resources");
			//파일 기본경로 _ 상세경로
			String filePath = dftFilePath + "/photo_upload/";
			File file = new File(filePath);
			if(!file.exists()) {
				file.mkdirs();
			}
			String realFileNm = "";
			SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
			String today= formatter.format(new java.util.Date());
			realFileNm = today+UUID.randomUUID().toString() + filename.substring(filename.lastIndexOf("."));
			String rlFileNm = filePath + realFileNm;
			///////////////// 서버에 파일쓰기 /////////////////
			InputStream is = request.getInputStream();
			OutputStream os=new FileOutputStream(rlFileNm);
			int numRead;
			byte b[] = new byte[Integer.parseInt(request.getHeader("file-size"))];
			while((numRead = is.read(b,0,b.length)) != -1){
				os.write(b,0,numRead);
			}
			if(is != null) {
				is.close();
			}
			os.flush();
			os.close();
			///////////////// 서버에 파일쓰기 /////////////////
			// 정보 출력
			sFileInfo += "&bNewLine=true";
			// img 태그의 title 속성을 원본파일명으로 적용시켜주기 위함
			sFileInfo += "&sFileName="+ filename;;
			sFileInfo += "&sFileURL="+"/resources/photo_upload/"+realFileNm;
			PrintWriter print = response.getWriter();
			print.print(sFileInfo);
			print.flush();
			print.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}







