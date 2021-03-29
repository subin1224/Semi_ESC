<%@page import="com.proj.themeReg.model.ThemeRegVO"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.proj.common.Utility"%>
<%@page import="java.io.IOException"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="utf-8"%>
<jsp:useBean id="themeRegService" class="com.proj.themeReg.model.ThemeRegService" scope="session"></jsp:useBean> 	

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	//bmPageif5.jsp에서 post방식으로 submit
	try{
		//파일 업로드 처리
		String upPath=Utility.UPLOAD_DIR;
		String saveDir=Utility.TEST_DIR;
	
		int maxSize=2*1024*1024; //2M
		
		MultipartRequest mr
			=new MultipartRequest(request, saveDir, maxSize, "utf-8",
					new DefaultFileRenamePolicy());
		System.out.println("업로드 완료");
		
		//업로드 파일의 정보 구하기
		String fileName=mr.getFilesystemName("upfile");
		String originName="";
		long fileSize=0;
		if(fileName !=null && !fileName.isEmpty()){	//이미지 업로드 됐을때
			originName=mr.getOriginalFileName("upfile");
			
			File file=mr.getFile("upfile");
			fileSize=file.length();
		}
		
		//1 인코딩은 mr에서
		String themeName=mr.getParameter("tname");
		int themePrice=Integer.parseInt(mr.getParameter("tprice"));
		int playTime=Integer.parseInt(mr.getParameter("tplaytime"));
		int playerMin=Integer.parseInt(mr.getParameter("tmin"));
		int playerMax=Integer.parseInt(mr.getParameter("tmax"));
		String themeContent=mr.getParameter("tcontent");
		int difficulty=Integer.parseInt(mr.getParameter("lock"));
		int genreCode=Integer.parseInt(mr.getParameter("genre"));
		int genreCode2=Integer.parseInt(mr.getParameter("genre2"));
		int unitNo=Integer.parseInt(mr.getParameter("unit"));
		int brandNo=Integer.parseInt(mr.getParameter("brandNo"));
		
		ThemeRegVO vo = new ThemeRegVO();
		vo.setBrandNo(brandNo);
		vo.setDifficulty(difficulty);
		vo.setFileName(fileName);
		vo.setFileSize(fileSize);
		vo.setGenreCode(genreCode);
		vo.setGenreCode2(genreCode2);
		vo.setOriginalFileName(originName);
		vo.setPlayerMax(playerMax);
		vo.setPlayerMin(playerMin);
		vo.setPlayTime(playTime);
		vo.setThemeContent(themeContent);
		vo.setThemeName(themeName);
		vo.setThemePrice(themePrice);
		vo.setUnitNo(unitNo);
		
		
		//2
		int cnt=themeRegService.insertTheme(vo);
		
		if(cnt>0){%>
		<script type="text/javascript">
				alert('테마 작성 성공');
				opener.location.reload();
				window.close();
			</script>
		<%}else{%>
		<script type="text/javascript">
				alert('테마 작성 실패..');
				history.back();
			</script>
		<%}		
	}catch(SQLException e){
		e.printStackTrace();
	}catch(IOException e){
		e.printStackTrace(); %>
		<script type="text/javascript">
			alert('2M이상의 파일은 업로드할 수 없습니다!');
			history.back();
		</script>
		<%	} %>

</body>
</html>