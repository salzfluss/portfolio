package com.study.springboot.service;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Calendar;

import org.springframework.stereotype.Service;
import org.springframework.util.ResourceUtils;
import org.springframework.web.multipart.MultipartFile;

@Service
public class FileUploadService {

	private static String SAVE_PATH = "/upload/";
	private static String PREFIX_URL = "/upload/";
	
	public String restore(MultipartFile multipartFile) {
		
		String url = null;
	
		
		try {
			String savepath = ResourceUtils.getFile("classpath:static/").toPath().toString();
			savepath = savepath.replace("\\", "/");
			System.out.println("savepath2 : " + savepath);
			savepath = savepath.replace("/bin/main/static", "/src/main/resources/static/upload");
			System.out.println("savepath3 : " + savepath);
			
			
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
			System.out.println("extensionName : " + extName);
			System.out.println("size : " + size);
			System.out.println("saveFileName : " + saveFileName);
			
			writeFile(multipartFile, saveFileName);
		//	url = "/img/user" + "/" + saveFileName;
			url = "/upload" + "/" + saveFileName;
		}
		catch (IOException e) {
			throw new RuntimeException(e);
		}
		//return saveFileName;
		return url;
	}
	
public String restore2(MultipartFile multipartFile) {
		
		String url = null;
	
		
		try {
			String savepath = ResourceUtils.getFile("classpath:static/").toPath().toString();
			savepath = savepath.replace("\\", "/");
			System.out.println("savepath2 : " + savepath);
			savepath = savepath.replace("/bin/main/static", "/src/main/resources/static/upload");
			System.out.println("savepath3 : " + savepath);
			
			
			SAVE_PATH = savepath;
			PREFIX_URL = savepath;
			
			// 파일 정보
			String originFilename = multipartFile.getOriginalFilename();
			String extName
				= originFilename.substring(originFilename.lastIndexOf("."), originFilename.length());
			Long size = multipartFile.getSize();
			
			// 서버에서 저장 할 파일 이름
			String saveFileName = genSaveFileName2(extName);
			
			
			System.out.println("restore2 ----- ");
			System.out.println("originFilename : " + originFilename);
			System.out.println("extensionName : " + extName);
			System.out.println("size : " + size);
			System.out.println("saveFileName : " + saveFileName);
			
			writeFile(multipartFile, saveFileName);
		//	url = "/img/user" + "/" + saveFileName;
			url = "/upload" + "/" + saveFileName;
		}
		catch (IOException e) {
			throw new RuntimeException(e);
		}
		//return saveFileName;
		return url;
	}

//--------------------------------카테고리가 Ring일때 Ring 폴더로 저장 -------------------------------//

public String ring_url(MultipartFile multipartFile) {
	
	String url = null;

	
	try {
		String savepath = ResourceUtils.getFile("classpath:static/").toPath().toString();
		savepath = savepath.replace("\\", "/");
		System.out.println("savepath2 : " + savepath);
		savepath = savepath.replace("/bin/main/static", "/src/main/resources/static/img/items/ring");
		System.out.println("savepath3 : " + savepath);
		
		
		SAVE_PATH = savepath;
		PREFIX_URL = savepath;
		
		// 파일 정보
		String originFilename = multipartFile.getOriginalFilename();
		String extName
			= originFilename.substring(originFilename.lastIndexOf("."), originFilename.length());
		Long size = multipartFile.getSize();
		
		// 서버에서 저장 할 파일 이름
		String saveFileName = genSaveFileName(extName);
		
		System.out.println("-------ring_url ----- ");
		System.out.println("originFilename : " + originFilename);
		System.out.println("extensionName : " + extName);
		System.out.println("size : " + size);
		System.out.println("saveFileName : " + saveFileName);
		
		writeFile(multipartFile, saveFileName);
	//	url = "/img/user" + "/" + saveFileName;
		url = "/img/items/ring" + "/" + saveFileName;
	}
	catch (IOException e) {
		throw new RuntimeException(e);
	}
	//return saveFileName;
	return url;
}

public String ring_url2(MultipartFile multipartFile) {
	
	String url = null;

	
	try {
		String savepath = ResourceUtils.getFile("classpath:static/").toPath().toString();
		savepath = savepath.replace("\\", "/");
		System.out.println("savepath2 : " + savepath);
		savepath = savepath.replace("/bin/main/static", "/src/main/resources/static/img/items/ring");
		System.out.println("savepath3 : " + savepath);
		
		
		SAVE_PATH = savepath;
		PREFIX_URL = savepath;
		
		// 파일 정보
		String originFilename = multipartFile.getOriginalFilename();
		String extName
			= originFilename.substring(originFilename.lastIndexOf("."), originFilename.length());
		Long size = multipartFile.getSize();
		
		// 서버에서 저장 할 파일 이름
		String saveFileName = genSaveFileName2(extName);
		
		
		System.out.println("-------ring_url2 ----- ");
		System.out.println("originFilename : " + originFilename);
		System.out.println("extensionName : " + extName);
		System.out.println("size : " + size);
		System.out.println("saveFileName : " + saveFileName);
		
		writeFile(multipartFile, saveFileName);
	//	url = "/img/user" + "/" + saveFileName;
		url = "/img/items/ring" + "/" + saveFileName;
	}
	catch (IOException e) {
		throw new RuntimeException(e);
	}
	//return saveFileName;
	return url;
}


//--------------------------------카테고리가 Necklace일때 necklace 폴더로 저장 -------------------------------//

public String necklace_url(MultipartFile multipartFile) {
	
	String url = null;

	
	try {
		String savepath = ResourceUtils.getFile("classpath:static/").toPath().toString();
		savepath = savepath.replace("\\", "/");
		System.out.println("savepath2 : " + savepath);
		savepath = savepath.replace("/bin/main/static", "/src/main/resources/static/img/items/necklace");
		System.out.println("savepath3 : " + savepath);
		
		
		SAVE_PATH = savepath;
		PREFIX_URL = savepath;
		
		// 파일 정보
		String originFilename = multipartFile.getOriginalFilename();
		String extName
			= originFilename.substring(originFilename.lastIndexOf("."), originFilename.length());
		Long size = multipartFile.getSize();
		
		// 서버에서 저장 할 파일 이름
		String saveFileName = genSaveFileName(extName);
		
		System.out.println("-------necklace_url ----- ");
		System.out.println("originFilename : " + originFilename);
		System.out.println("extensionName : " + extName);
		System.out.println("size : " + size);
		System.out.println("saveFileName : " + saveFileName);
		
		writeFile(multipartFile, saveFileName);
	//	url = "/img/user" + "/" + saveFileName;
		url = "/img/items/necklace" + "/" + saveFileName;
	}
	catch (IOException e) {
		throw new RuntimeException(e);
	}
	//return saveFileName;
	return url;
}

public String necklace_url2(MultipartFile multipartFile) {
	
	String url = null;

	
	try {
		String savepath = ResourceUtils.getFile("classpath:static/").toPath().toString();
		savepath = savepath.replace("\\", "/");
		System.out.println("savepath2 : " + savepath);
		savepath = savepath.replace("/bin/main/static", "/src/main/resources/static/img/items/necklace");
		System.out.println("savepath3 : " + savepath);
		
		
		SAVE_PATH = savepath;
		PREFIX_URL = savepath;
		
		// 파일 정보
		String originFilename = multipartFile.getOriginalFilename();
		String extName
			= originFilename.substring(originFilename.lastIndexOf("."), originFilename.length());
		Long size = multipartFile.getSize();
		
		// 서버에서 저장 할 파일 이름
		String saveFileName = genSaveFileName2(extName);
		
		
		System.out.println("-------necklace_url2 ----- ");
		System.out.println("originFilename : " + originFilename);
		System.out.println("extensionName : " + extName);
		System.out.println("size : " + size);
		System.out.println("saveFileName : " + saveFileName);
		
		writeFile(multipartFile, saveFileName);
	//	url = "/img/user" + "/" + saveFileName;
		url = "/img/items/necklace" + "/" + saveFileName;
	}
	catch (IOException e) {
		throw new RuntimeException(e);
	}
	//return saveFileName;
	return url;
}


//--------------------------------카테고리가 Bracelet일때 bracelet 폴더로 저장 -------------------------------//

public String bracelet_url(MultipartFile multipartFile) {
	
	String url = null;

	
	try {
		String savepath = ResourceUtils.getFile("classpath:static/").toPath().toString();
		savepath = savepath.replace("\\", "/");
		System.out.println("savepath2 : " + savepath);
		savepath = savepath.replace("/bin/main/static", "/src/main/resources/static/img/items/bracelet");
		System.out.println("savepath3 : " + savepath);
		
		
		SAVE_PATH = savepath;
		PREFIX_URL = savepath;
		
		// 파일 정보
		String originFilename = multipartFile.getOriginalFilename();
		String extName
			= originFilename.substring(originFilename.lastIndexOf("."), originFilename.length());
		Long size = multipartFile.getSize();
		
		// 서버에서 저장 할 파일 이름
		String saveFileName = genSaveFileName(extName);
		
		System.out.println("-------bracelet_url ----- ");
		System.out.println("originFilename : " + originFilename);
		System.out.println("extensionName : " + extName);
		System.out.println("size : " + size);
		System.out.println("saveFileName : " + saveFileName);
		
		writeFile(multipartFile, saveFileName);
	//	url = "/img/user" + "/" + saveFileName;
		url = "/img/items/bracelet" + "/" + saveFileName;
	}
	catch (IOException e) {
		throw new RuntimeException(e);
	}
	//return saveFileName;
	return url;
}

public String bracelet_url2(MultipartFile multipartFile) {
	
	String url = null;

	
	try {
		String savepath = ResourceUtils.getFile("classpath:static/").toPath().toString();
		savepath = savepath.replace("\\", "/");
		System.out.println("savepath2 : " + savepath);
		savepath = savepath.replace("/bin/main/static", "/src/main/resources/static/img/items/bracelet");
		System.out.println("savepath3 : " + savepath);
		
		
		SAVE_PATH = savepath;
		PREFIX_URL = savepath;
		
		// 파일 정보
		String originFilename = multipartFile.getOriginalFilename();
		String extName
			= originFilename.substring(originFilename.lastIndexOf("."), originFilename.length());
		Long size = multipartFile.getSize();
		
		// 서버에서 저장 할 파일 이름
		String saveFileName = genSaveFileName2(extName);
		
		
		System.out.println("-------bracelet_url2 ----- ");
		System.out.println("originFilename : " + originFilename);
		System.out.println("extensionName : " + extName);
		System.out.println("size : " + size);
		System.out.println("saveFileName : " + saveFileName);
		
		writeFile(multipartFile, saveFileName);
	//	url = "/img/user" + "/" + saveFileName;
		url = "/img/items/bracelet" + "/" + saveFileName;
	}
	catch (IOException e) {
		throw new RuntimeException(e);
	}
	//return saveFileName;
	return url;
}


//--------------------------------카테고리가 Earring일때 earrings 폴더로 저장 -------------------------------//

public String earring_url(MultipartFile multipartFile) {
	
	String url = null;

	
	try {
		String savepath = ResourceUtils.getFile("classpath:static/").toPath().toString();
		savepath = savepath.replace("\\", "/");
		System.out.println("savepath2 : " + savepath);
		savepath = savepath.replace("/bin/main/static", "/src/main/resources/static/img/items/earrings");
		System.out.println("savepath3 : " + savepath);
		
		
		SAVE_PATH = savepath;
		PREFIX_URL = savepath;
		
		// 파일 정보
		String originFilename = multipartFile.getOriginalFilename();
		String extName
			= originFilename.substring(originFilename.lastIndexOf("."), originFilename.length());
		Long size = multipartFile.getSize();
		
		// 서버에서 저장 할 파일 이름
		String saveFileName = genSaveFileName(extName);
		
		System.out.println("-------earring_url ----- ");
		System.out.println("originFilename : " + originFilename);
		System.out.println("extensionName : " + extName);
		System.out.println("size : " + size);
		System.out.println("saveFileName : " + saveFileName);
		
		writeFile(multipartFile, saveFileName);
	//	url = "/img/user" + "/" + saveFileName;
		url = "/img/items/earrings" + "/" + saveFileName;
	}
	catch (IOException e) {
		throw new RuntimeException(e);
	}
	//return saveFileName;
	return url;
}

public String earring_url2(MultipartFile multipartFile) {
	
	String url = null;

	
	try {
		String savepath = ResourceUtils.getFile("classpath:static/").toPath().toString();
		savepath = savepath.replace("\\", "/");
		System.out.println("savepath2 : " + savepath);
		savepath = savepath.replace("/bin/main/static", "/src/main/resources/static/img/items/earrings");
		System.out.println("savepath3 : " + savepath);
		
		
		SAVE_PATH = savepath;
		PREFIX_URL = savepath;
		
		// 파일 정보
		String originFilename = multipartFile.getOriginalFilename();
		String extName
			= originFilename.substring(originFilename.lastIndexOf("."), originFilename.length());
		Long size = multipartFile.getSize();
		
		// 서버에서 저장 할 파일 이름
		String saveFileName = genSaveFileName2(extName);
		
		
		System.out.println("-------earring_url2 ----- ");
		System.out.println("originFilename : " + originFilename);
		System.out.println("extensionName : " + extName);
		System.out.println("size : " + size);
		System.out.println("saveFileName : " + saveFileName);
		
		writeFile(multipartFile, saveFileName);
	//	url = "/img/user" + "/" + saveFileName;
		url = "/img/items/earrings" + "/" + saveFileName;
	}
	catch (IOException e) {
		throw new RuntimeException(e);
	}
	//return saveFileName;
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
	
	private String genSaveFileName2(String extName) {
		String fileName = "";
		
		Calendar calendar = Calendar.getInstance();
		fileName += calendar.get(Calendar.YEAR);
		fileName += calendar.get(Calendar.MONTH);
		fileName += calendar.get(Calendar.DATE);
		fileName += calendar.get(Calendar.HOUR);
		fileName += calendar.get(Calendar.MINUTE);
		fileName += calendar.get(Calendar.SECOND);
		fileName += calendar.get(Calendar.MILLISECOND);
		fileName += 'i' ;
		fileName += extName;
		
		return fileName;
	}
	
	// 파일을 실제로 write 하는 메서드
	private void writeFile(MultipartFile multipartFile, String saveFileName)
								throws IOException{
		System.out.println("savefile:" + SAVE_PATH + "/" + saveFileName );
		
		byte[] data = multipartFile.getBytes();
		FileOutputStream fos = new FileOutputStream(SAVE_PATH + "/" + saveFileName);
		fos.write(data);
		fos.close();
		
		return;
	}
}
