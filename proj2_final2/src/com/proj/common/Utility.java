package com.proj.common;

import java.util.Date;

public class Utility {
	public static final String TEST_DIR
		="F:\\lecture\\workspace_list\\2nd_proj\\proj2_final2\\WebContent\\esc\\img_upload";
		//="F:\\lecture\\workspace_list\\2nd_proj\\proj2_final2\\WebContent\\esc\\img_upload";
		//="F:\\subin\\workspace_list\\jsp_ws\\myprj\\WebContent\\esc\\img_upload";
	
	public static final String UPLOAD_DIR="img_upload";
	
	public static String cutString(String title, int len) {
		//제목이 30자 이상인 경우 일부만 추출하기
		String result=title;
		if(title.length()>len) {
			result=title.substring(0, len)+"...";
		}

		return result;
	}

	public static String getFileInfo(String originName,long fileSize) {
		String result="";
		float fSize=fileSize/1024f;
		fSize = Math.round(fSize*10)/10f;
		
		if(originName!=null && !originName.isEmpty()) {
			result="<img src='../images/file.gif' alt='file이미지'>";
			result+=originName+" (" + fSize +" KB)";
		}
		
		return result;
	}
	
}
