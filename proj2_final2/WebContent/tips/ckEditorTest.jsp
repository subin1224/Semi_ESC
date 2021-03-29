<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CKEditor 4</title>
<script src="../ckeditor/ckeditor.js"></script>
</head>
<body>
<form>
	<textarea name="editor1" id="editor1" rows="10" cols="80"> hello </textarea>
    <script>
		CKEDITOR.replace( 'editor1' );
	</script>
</form>

<!-- ckeditor 폴더가 없을시에, 8번째줄을
<script src="https://cdn.ckeditor.com/4.15.1/standard/ckeditor.js"></script>
로 변경한다 -->

</body>
</html>