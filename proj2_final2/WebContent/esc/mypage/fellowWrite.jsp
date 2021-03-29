<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<jsp:include page="../inc/top.jsp"></jsp:include>




    <div class="site-section bg-light" id="contact-section">
      <div class="container">
        <div class="row justify-content-center text-center">
        <div class="col-7 text-center mb-5">
        <br><br><br>
    <div class="block-counter-1" style="padding-top: 10px;" >
		<label style="color:white; background: #16c3b0; border-radius: 80px; padding: 5px 30px 5px 30px; font-size: 3em;">
			FELLOWSHIP</label>
	</div>
      </div>
        <div class="row">
          <div class="col-lg-8 mb-5" >
            <form action="#" method="post">
              <div class="form-group row">
                <div class="col-md-4 ">
                  <!-- <input type="text" class="form-control" placeholder=""> -->
                  <select class="form-control" style="color: rgb(23,162,184); border-radius: 10px;">
	 					<option> 지역 전체 </option><option>서울</option><option>경기</option><option>인천</option>
	 					<option>강원 </option><option>충청</option><option>전라</option><option>경상</option>					
					</select>
                </div>
                <div class="col-md-4">
                  <!-- <input type="text" class="form-control" placeholder="First name"> -->
                  	<select class="form-control" style="color: rgb(23,162,184); border-radius: 10px; ">
	 					<option> 브랜드 전체 </option><option>마스터키 강남점</option><option>미스터리룸 강남점</option><option>비밀의화원</option>
	 					<option>셜록홈즈 </option><option>SEVEN CLUES</option><option>코드이스케이프</option><option>경상</option>					
					</select>
                </div>
                <div class="col-md-4">
                  <!-- <input type="text" class="form-control" placeholder="First name"> -->
                  	<select class="form-control" style="color: rgb(23,162,184); border-radius: 10px;">
	 					<option> 테마 전체 </option><option>팬텀</option><option>인형괴담</option><option>학교의비밀</option>
	 					<option>거짓말 </option><option>사라진백마교도</option><option>JAZZ IN THE RAIN</option><option>체임버</option>	
	 					<option>닥터츄 </option><option>광복절특사</option><option>알콜홀릭</option><option>GAME OF MINDS</option>				
					</select>
                </div>
              </div>
              
              <div class="form-group row">
                <div class="col-md-4 ">
                  <!-- <input type="text" class="form-control" placeholder=""> -->
                  <select class="form-control" style="color: rgb(23,162,184); border-radius: 10px;">
	 					<option> 모집인원 </option><option> 1 </option><option>2</option><option>3</option><option>4</option>					
					</select>
                </div>
                <div class="col-md-4">
                  <!-- <input type="text" class="form-control" placeholder="First name"> -->
                  	<input type="text" id="datePicker" class="form-control" style="color: rgb(23,162,184); border-radius: 10px;" placeholder="[클릭]날짜선택">
	 					
                </div>
                <div class="col-md-4">
                  <!-- <input type="text" class="form-control" placeholder="First name"> -->
                  	<select class="form-control" style="color: rgb(23,162,184); border-radius: 10px; ">
	 					<option> 만날 시간대 </option><option>오전10:00~12:00</option><option>오후12:00~14:00</option><option>오후14:00~16:00</option>
	 					<option>오후16:00~18:00 </option><option>오후18:00~20:00</option><option>오후20:00~22:00</option><option>경상</option>					
					</select>
                </div>
                                
              </div>   

              <div class="form-group row">
                <div class="col-md-12">
                  <textarea style="border-radius: 10px;" class="form-control" placeholder="Write your Review." cols="30" rows="12"></textarea>
                </div>
              </div>
              <div class="form-group row">
                <div class="col-md-6 mr-auto">
                  <input type="submit" class="btn btn-block btn-primary text-white py-3 px-5" value="Send Wanted">
                </div>
              </div>
            </form>
          </div>
          <div class="col-lg-4 ml-auto">
            <div class="bg-white p-3 p-md-5">
              <img src="http://www.master-key.co.kr/upload/room/175_img1.png" style="width:180px; height:270px;">
            </div>
          </div>
        </div>
      </div>
    </div>

 <script src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"> </script>
 <script src="http://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>
 <script type="text/javascript">
            $('#datePicker').datepicker({
               format : "yyyy-mm-dd",
               todayHighlight: true,
               startDate: '0d',
               endDate: '+7d',
               autoclose: true
            });
            
            /* $('$click-btn').on('click', function(){
               var date=$('#dateRangePicker').val();
               alert(date);
            }); */
	</script>
 <!-- content end-->   
<jsp:include page="../inc/bottom.jsp"></jsp:include>    


