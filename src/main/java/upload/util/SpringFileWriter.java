package upload.util;

import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Calendar;

import org.springframework.web.multipart.MultipartFile;

public class SpringFileWriter {
	
	FileOutputStream fos;
	
	public void writeFile(MultipartFile file,String fileName,String path) {
		
		try {
			byte fileData[] = file.getBytes();
			fos = new FileOutputStream(path+"\\"+fileName);
			fos.write(fileData);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	
	//파일명에 날짜 붙여서 리턴하기
	
	
	public String changeFilename(String filename)
	{
		Calendar cal = Calendar.getInstance();
		String day = cal.get(Calendar.HOUR)+""+cal.get(Calendar.MINUTE)+""+cal.get(Calendar.SECOND);
		String changeFileName="photo"+day+"_"+filename;
		
		return changeFileName;
		
		
	}

}
