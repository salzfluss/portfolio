package com.study.springboot.service;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Calendar;

import org.springframework.stereotype.Service;
import org.springframework.util.ResourceUtils;
import org.springframework.web.multipart.MultipartFile;

@Service
public class FileUploadService2 {
	// 리눅스 기준으로 파일 경로를 작성 ( 루트 경로인 /으로 시작한다. )
	// 윈도우라면 workspace의 드라이브를 파악하여 JVM이 알아서 처리해준다.
	// 따라서 workspace가 C드라이브에 있다면 C드라이브에 upload 폴더를 생성해 놓아야 한다.
	
	private static String SAVE_PATH = "/upload/"; //원래는 C:/upload폴더에 생성됨. 지금은 static폴더에 저장됨.
	private static String PREFIX_URL = "/upload/";
	
	public String restore(MultipartFile multipartFile) {
		
		String url = null;
		
		try {
			//C:\Users\Gi7A-00\Documents\SprintBoot\Ex26_FileUploadParam\bin\main\static\ upload
			//C:\Users\Gi7A-00\Documents\SprintBoot\Ex26_FileUploadParam\src\main\resources\static\ upload
			//C:\Users\Gi7A-00\Documents\SprintBoot\Ex26_FileUploadParam\src\main\resources\static
			String savepath = ResourceUtils.getFile("classpath:static/").toPath().toString();
			savepath = savepath.replace("\\", "/");  //  \\를 /로 변경하는 문구
			System.out.println("savepath2 : " + savepath); 
			// savepath2 : C:/Users/SOGMi/Documents/SKK/springboot/Ex13_FileUplpoadWithParam/bin/main/static/upload
			savepath = savepath.replace("/bin/main/static", "/src/main/resources/static/img/user"); // "/bin/main/static" 를 "/src/main/resources/static/img/user"로 변경
			System.out.println("savepath3 : " + savepath);
			// savepath3 : C:/Users/SOGMi/Documents/SKK/springboot/Ex13_FileUplpoadWithParam/src/main/resources/static/upload
			
			SAVE_PATH = savepath;
			PREFIX_URL = savepath;
			
			// 파일 정보
			String originFilename = multipartFile.getOriginalFilename();
			String extName
				= originFilename.substring(originFilename.lastIndexOf("."), originFilename.length());
			Long size = multipartFile.getSize();
			
			// 서버에서 저장 할 파일 이름
			String saveFileName = genSaveFileName(extName);
			
			System.out.println("originFilename : " + originFilename);
			//5.20 자바웹앱_QR_1.jpg
			System.out.println("extensionName : " + extName);
			// .jpg  그냥 이걸로 나오는데..?
			System.out.println("size : " + size);
			System.out.println("saveFileName : " + saveFileName);
			// saveFileName : 2021816113346798.jpg
			
			writeFile(multipartFile, saveFileName);
		//	url = PREFIX_URL + "/" + saveFileName;
			
			url = "/img/user" + "/"  +saveFileName;
			//폴더경로지정 + 파일이름
		}
		catch (IOException e) {
			// 원래라면 RuntimeException 을 상속받은 예외가 처리되어야 하지만
			// 편의상 RuntimeException을 던진다.
			// throw new FileUploadException();	
			throw new RuntimeException(e);
		}
		return url;
	}
	
	
	
	
	// 현재 시간을 기준으로 파일 이름 생성
	private String genSaveFileName(String extName) {
		String fileName = "";
		
		Calendar calendar = Calendar.getInstance();
		fileName += calendar.get(Calendar.YEAR);
		fileName += calendar.get(Calendar.MONTH);
		fileName += calendar.get(Calendar.DATE);
		fileName += calendar.get(Calendar.HOUR);
		fileName += calendar.get(Calendar.MINUTE);
		fileName += calendar.get(Calendar.SECOND);
		fileName += calendar.get(Calendar.MILLISECOND);
		fileName += extName;
		
		return fileName;
	}
	
	
	// 파일을 실제로 write 하는 메서드
	private void writeFile(MultipartFile multipartFile, String saveFileName)
								throws IOException{
		System.out.println("savefile:" + SAVE_PATH + "/" + saveFileName );
		//savefile:C:/Users/SOGMi/Documents/SKK/springboot/Ex13_FileUplpoadWithParam/src/main/resources/static/upload/2021816113346798.jpg
		
		byte[] data = multipartFile.getBytes();
		FileOutputStream fos = new FileOutputStream(SAVE_PATH + "/" + saveFileName);
		fos.write(data);
		fos.close();
		
		return;
	}
}