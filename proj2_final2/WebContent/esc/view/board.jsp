<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<jsp:include page="../inc/top.jsp"></jsp:include>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
	$(function(){
		$('#menu-board').addClass('active');			
	})
</script>
<!-- content -->

    <div class="ftco-blocks-cover-1">
       <!-- data-stellar-background-ratio="0.5" style="background-image: url('images/hero_1.jpg')" -->
      <div class="site-section-cover overlay" data-stellar-background-ratio="0.5" style="background-image: url('images/hero_1.jpg')">
        <div class="container">
          <div class="row align-items-center ">

            <div class="col-md-5 mt-5 pt-5">
              <span class="text-cursive h5 text-red">Welcome To Our Website</span>
              <h1 class="mb-3 font-weight-bold text-teal">Packages</h1>
              <p><a href="index.jsp" class="text-white">Home</a> <span class="mx-3">/</span> <strong>Packages</strong></p>
            </div>
            
          </div>
        </div>
      </div>
    </div>


    <div class="site-section bg-info">
      <div class="container">
        <div class="row mb-5">
          <div class="col-12 text-center">
            <span class="text-cursive h5 text-red d-block">Packages You Like</span>
            <h2 class="text-white">Our Packages</h2>
          </div>
        </div>
        <div class="row">
          <div class="col-lg-4">
            <div class="package text-center bg-white">
              <span class="img-wrap"><img src="images/flaticon/svg/001-jigsaw.svg" alt="Image" class="img-fluid"></span>
              <h3 class="text-teal">Indoor Games</h3>
              <p>Lorem ipsum dolor sit amet. Consequatur aliquam, fuga maiores amet quo corporis distinctio soluta recusandae?</p>
              <p><a href="#" class="btn btn-primary btn-custom-1 mt-4">Learn More</a></p>
            </div>
          </div>
          <div class="col-lg-4">
            <div class="package text-center bg-white">
              <span class="img-wrap"><img src="images/flaticon/svg/002-target.svg" alt="Image" class="img-fluid"></span>
              <h3 class="text-success">Outdoor Game and Event</h3>
              <p>Lorem ipsum dolor sit amet. Consequatur aliquam, fuga maiores amet quo corporis distinctio soluta recusandae?</p>
              <p><a href="#" class="btn btn-warning btn-custom-1 mt-4">Learn More</a></p>
            </div>
          </div>
          <div class="col-lg-4">
            <div class="package text-center bg-white">
              <span class="img-wrap"><img src="images/flaticon/svg/003-mission.svg" alt="Image" class="img-fluid"></span>
              <h3 class="text-danger">Camping for Kids</h3>
              <p>Lorem ipsum dolor sit amet. Consequatur aliquam, fuga maiores amet quo corporis distinctio soluta recusandae?</p>
              <p><a href="#" class="btn btn-success btn-custom-1 mt-4">Learn More</a></p>
            </div>
          </div>
        </div>
      </div>
    </div>
    
    <div class="site-section bg-light">
      <div class="container">
        <div class="row mb-5">
          <div class="col-12 text-center">
            <span class="text-cursive h5 text-red d-block">Testimonial</span>
            <h2 class="text-black">What Our Client Says About Us</h2>
          </div>
        </div>
        <div class="row justify-content-center">
          <div class="col-md-8">
            <div class="testimonial-3-wrap">
              

              <div class="owl-carousel nonloop-block-13">
                <div class="testimonial-3 d-flex">
                  <div class="vcard-wrap mr-5">
                    <img src="images/person_1.jpg" alt="Image" class="vcard img-fluid">
                  </div>
                  <div class="text">
                    <h3>Jeff Woodland</h3>
                    <p class="position">Partner</p>
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aliquam earum libero rem maxime magnam. Similique esse ab earum, autem consectetur.</p>
                  </div>
                </div>

                <div class="testimonial-3 d-flex">
                  <div class="vcard-wrap mr-5">
                    <img src="images/person_3.jpg" alt="Image" class="vcard img-fluid">
                  </div>
                  <div class="text">
                    <h3>Jeff Woodland</h3>
                    <p class="position">Partner</p>
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aliquam earum libero rem maxime magnam. Similique esse ab earum, autem consectetur.</p>
                  </div>
                </div>

                <div class="testimonial-3 d-flex">
                  <div class="vcard-wrap mr-5">
                    <img src="images/person_2.jpg" alt="Image" class="vcard img-fluid">
                  </div>
                  <div class="text">
                    <h3>Jeff Woodland</h3>
                    <p class="position">Partner</p>
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aliquam earum libero rem maxime magnam. Similique esse ab earum, autem consectetur.</p>
                  </div>
                </div>
              </div>

            </div>
          </div>
        </div>
        <div class="row mt-5 justify-content-center">

          <div class="col-md-8">
            

            <div class="row">
              <div class="col-lg-3 text-center">
                <span class="text-teal h2 d-block">3423</span>
                <span>Happy Client</span>
              </div>
              <div class="col-lg-3 text-center">
                <span class="text-yellow h2 d-block">4398</span>
                <span>Members</span>
              </div>
              <div class="col-lg-3 text-center">
                <span class="text-success h2 d-block">50+</span>
                <span>Staffs</span>
              </div>
              <div class="col-lg-3 text-center">
                <span class="text-danger h2 d-block">2000+</span>
                <span>Our Followers</span>
              </div>
            </div>

          </div>
        </div>
      </div>
    </div>


    <div class="site-section py-5 bg-warning">
      <div class="container">
        <div class="row justify-content-center">
          <div class="col-md-12 d-flex">
          <h2 class="text-white m-0">Bring Fun Life To Your Kids</h2>
          <a href="#" class="btn btn-primary btn-custom-1 py-3 px-5 ml-auto">Get Started</a>
          </div>
        </div>
      </div>
    </div>
    

<!-- content end -->
    
<%@ include file="../inc/bottom.jsp" %>
