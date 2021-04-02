
	/*아코디언 리스트*/
$(document).ready(function(){
		callApiXml();
		
		$(".option").click(function(){
			   $(".option").removeClass("active");
			   $(this).addClass("active");
			   
			});
		});
	/*아코디언 리스트*/
	
	/*세계입국현황 1~5국*/
function callApiXml() {
	 $.ajax({
         url:'/mainsafe/list',
         type:'get',
         dataType:'json', // 리턴해주는 타입을 지정해줘야함
         success: function(data) {
            //alert(data);
            s="";
            c="";
            v="";
            scv="";
            
            s1="";
            c1="";
            v1="";
            scv1="";
            
            s2="";
            c2="";
            v2="";
            scv2="";
            
            s3="";
            c3="";
            v3="";
            scv3="";
            
            s4="";
            c4="";
            v4="";
            scv4="";

			safe="";
            $.each(data,function(index,item){
            	var countryName1=item[0].countryName;
            	var title1=item[0].title;
            	var content1=item[0].content;
            	var wrtDt1=item[0].wrtDt;
            	
            	var countryName2=item[1].countryName;
            	var title2=item[1].title;
            	var content2=item[1].content;
            	var wrtDt2=item[1].wrtDt;
            	
            	var countryName3=item[2].countryName;
            	var title3=item[2].title;
            	var content3=item[2].content;
            	var wrtDt3=item[2].wrtDt;
            	
            	var countryName4=item[3].countryName;
            	var title4=item[3].title;
            	var content4=item[3].content;
            	var wrtDt4=item[3].wrtDt;
            	
            	var countryName5=item[4].countryName;
            	var title5=item[4].title;
            	var content5=item[4].content;
            	var wrtDt5=item[4].wrtDt;
            	
				safe+="<div>최신 국가별 입국심사정보</div>";

            	s+="<div>"+countryName1+"</div>"
            	c+="<div>"+title1+"</div>"
            	v+="<div>"+content1+"</div>"
            	scv+="<div>"+wrtDt1+"</div>"
            	
            	s1+="<div>"+countryName2+"</div>"
            	c1+="<div>"+title2+"</div>"
            	v1+="<div>"+content2+"</div>"
            	scv1+="<div>"+wrtDt2+"</div>"
            	
            	s2+="<div>"+countryName3+"</div>"
            	c2+="<div>"+title3+"</div>"
            	v2+="<div>"+content3+"</div>"
            	scv2+="<div>"+wrtDt3+"</div>"
            	
            	s3+="<div>"+countryName4+"</div>"
            	c3+="<div>"+title4+"</div>"
            	v3+="<div>"+content4+"</div>"
            	scv3+="<div>"+wrtDt4+"</div>"
            	
            	s4+="<div>"+countryName5+"</div>"
            	c4+="<div>"+title5+"</div>"
            	v4+="<div>"+content5+"</div>"
            	scv4+="<div>"+wrtDt5+"</div>"
			});
			$(".safe-title").html(safe);
			
            $("#countryName1").html(s);
            $("#title1").html(c);
            $("#content1").html(v);
            $("#wrtDt1").html(scv);
            
            $("#countryName2").html(s1);
            $("#title2").html(c1);
            $("#content2").html(v1);
            $("#wrtDt2").html(scv1);
            
            $("#countryName3").html(s2);
            $("#title3").html(c2);
            $("#content3").html(v2);
            $("#wrtDt3").html(scv2);
            
            $("#countryName4").html(s3);
            $("#title4").html(c3);
            $("#content4").html(v3);
            $("#wrtDt4").html(scv3);
            
            $("#countryName5").html(s4);
            $("#title5").html(c4);
            $("#content5").html(v4);
            $("#wrtDt5").html(scv4);
            
            $(".opt1").addClass('opt1');
            $(".opt2").addClass('opt2');
            $(".opt3").addClass('opt3');
            $(".opt4").addClass('opt4');
            $(".opt5").addClass('opt5');
         }
     });
}
/*세계입국현황 1~5국*/

/*세계운항현황 1~5국*/
function callApiCorona() {
	 $.ajax({
        url:'/mainsafe/list2',
        type:'get',
        dataType:'json', // 리턴해주는 타입을 지정해줘야함
        success: function(data) {
        	s="";
            c="";
            v="";
            scv="";
            
            s1="";
            c1="";
            v1="";
            scv1="";
            
            s2="";
            c2="";
            v2="";
            scv2="";
            
            s3="";
            c3="";
            v3="";
            scv3="";
            
            s4="";
            c4="";
            v4="";
            scv4="";

			safe="";
            $.each(data,function(index,item){
            	var countryName1=item[0].countryName;
            	var title1=item[0].title;
            	var content1=item[0].content;
            	var wrtDt1=item[0].wrtDt;
            	
            	var countryName2=item[1].countryName;
            	var title2=item[1].title;
            	var content2=item[1].content;
            	var wrtDt2=item[1].wrtDt;
            	
            	var countryName3=item[2].countryName;
            	var title3=item[2].title;
            	var content3=item[2].content;
            	var wrtDt3=item[2].wrtDt;
            	
            	var countryName4=item[3].countryName;
            	var title4=item[3].title;
            	var content4=item[3].content;
            	var wrtDt4=item[3].wrtDt;
            	
            	var countryName5=item[4].countryName;
            	var title5=item[4].title;
            	var content5=item[4].content;
            	var wrtDt5=item[4].wrtDt;

				safe+="<div>최신 국가별 항공기 운항정보</div>";
            	
            	s+="<div>"+countryName1+"</div>"
            	c+="<div>"+title1+"</div>"
            	v+="<div>"+content1+"</div>"
            	scv+="<div>"+wrtDt1+"</div>"
            	
            	s1+="<div>"+countryName2+"</div>"
            	c1+="<div>"+title2+"</div>"
            	v1+="<div>"+content2+"</div>"
            	scv1+="<div>"+wrtDt2+"</div>"
            	
            	s2+="<div>"+countryName3+"</div>"
            	c2+="<div>"+title3+"</div>"
            	v2+="<div>"+content3+"</div>"
            	scv2+="<div>"+wrtDt3+"</div>"
            	
            	s3+="<div>"+countryName4+"</div>"
            	c3+="<div>"+title4+"</div>"
            	v3+="<div>"+content4+"</div>"
            	scv3+="<div>"+wrtDt4+"</div>"
            	
            	s4+="<div>"+countryName5+"</div>"
            	c4+="<div>"+title5+"</div>"
            	v4+="<div>"+content5+"</div>"
            	scv4+="<div>"+wrtDt5+"</div>"
			});
			$(".safe-title").html(safe);
			
            $("#countryName1").html(s);
            $("#title1").html(c);
            $("#content1").html(v);
            $("#wrtDt1").html(scv);
            
            $("#countryName2").html(s1);
            $("#title2").html(c1);
            $("#content2").html(v1);
            $("#wrtDt2").html(scv1);
            
            $("#countryName3").html(s2);
            $("#title3").html(c2);
            $("#content3").html(v2);
            $("#wrtDt3").html(scv2);
            
            $("#countryName4").html(s3);
            $("#title4").html(c3);
            $("#content4").html(v3);
            $("#wrtDt4").html(scv3);
            
            $("#countryName5").html(s4);
            $("#title5").html(c4);
            $("#content5").html(v4);
            $("#wrtDt5").html(scv4);
            
            $(".op1").addClass('op1');
            $(".op2").addClass('op2');
            $(".op3").addClass('op3');
            $(".op4").addClass('op4');
            $(".op5").addClass('op5');
        }
    });
}
/*세계운항현황 1~5국*/

/*세계코로나현황 최신 5개국*/
function callApiAir() {
	 $.ajax({
       url:'/mainsafe/list3',
       type:'get',
       dataType:'json', // 리턴해주는 타입을 지정해줘야함
       success: function(data) {
    	   s="";
           c="";
           v="";
           scv="";
           
           s1="";
           c1="";
           v1="";
           scv1="";
           
           s2="";
           c2="";
           v2="";
           scv2="";
           
           s3="";
           c3="";
           v3="";
           scv3="";
           
           s4="";
           c4="";
           v4="";
           scv4="";

			safe="";
           $.each(data,function(index,item){
           	var countryName1=item[0].countryName;
           	var title1=item[0].title;
           	var content1=item[0].content;
           	var wrtDt1=item[0].wrtDt;
           	
           	var countryName2=item[1].countryName;
           	var title2=item[1].title;
           	var content2=item[1].content;
           	var wrtDt2=item[1].wrtDt;
           	
           	var countryName3=item[2].countryName;
           	var title3=item[2].title;
           	var content3=item[2].content;
           	var wrtDt3=item[2].wrtDt;
           	
           	var countryName4=item[3].countryName;
           	var title4=item[3].title;
           	var content4=item[3].content;
           	var wrtDt4=item[3].wrtDt;
           	
           	var countryName5=item[4].countryName;
           	var title5=item[4].title;
           	var content5=item[4].content;
           	var wrtDt5=item[4].wrtDt;
	
			safe+="<div>최신 국가별 코로나정보</div>";
           	
           	s+="<div>"+countryName1+"</div>"
           	c+="<div>"+title1+"</div>"
           	v+="<div>"+content1+"</div>"
           	scv+="<div>"+wrtDt1+"</div>"
           	
           	s1+="<div>"+countryName2+"</div>"
           	c1+="<div>"+title2+"</div>"
           	v1+="<div>"+content2+"</div>"
           	scv1+="<div>"+wrtDt2+"</div>"
           	
           	s2+="<div>"+countryName3+"</div>"
           	c2+="<div>"+title3+"</div>"
           	v2+="<div>"+content3+"</div>"
           	scv2+="<div>"+wrtDt3+"</div>"
           	
           	s3+="<div>"+countryName4+"</div>"
           	c3+="<div>"+title4+"</div>"
           	v3+="<div>"+content4+"</div>"
           	scv3+="<div>"+wrtDt4+"</div>"
           	
           	s4+="<div>"+countryName5+"</div>"
           	c4+="<div>"+title5+"</div>"
           	v4+="<div>"+content5+"</div>"
           	scv4+="<div>"+wrtDt5+"</div>"
			});
			$(".safe-title").html(safe);
			
           $("#countryName1").html(s);
           $("#title1").html(c);
           $("#content1").html(v);
           $("#wrtDt1").html(scv);
           
           $("#countryName2").html(s1);
           $("#title2").html(c1);
           $("#content2").html(v1);
           $("#wrtDt2").html(scv1);
           
           $("#countryName3").html(s2);
           $("#title3").html(c2);
           $("#content3").html(v2);
           $("#wrtDt3").html(scv2);
           
           $("#countryName4").html(s3);
           $("#title4").html(c3);
           $("#content4").html(v3);
           $("#wrtDt4").html(scv3);
           
           $("#countryName5").html(s4);
           $("#title5").html(c4);
           $("#content5").html(v4);
           $("#wrtDt5").html(scv4);
           
           $("#option1").addClass('o1');
           $("#option2").addClass('o2');
           $("#option3").addClass('o3');
           $("#option4").addClass('o4');
           $("#option5").addClass('o5');
       }
   });
}
/*세계코로나현황 최신 5개국*/

/*세계격리현황 최신 5개국*/
function callApiIsolation() {
	 $.ajax({
      url:'/mainsafe/list4',
      type:'get',
      dataType:'json', // 리턴해주는 타입을 지정해줘야함
      success: function(data) {
    	  s="";
          c="";
          v="";
          scv="";
          
          s1="";
          c1="";
          v1="";
          scv1="";
          
          s2="";
          c2="";
          v2="";
          scv2="";
          
          s3="";
          c3="";
          v3="";
          scv3="";
          
          s4="";
          c4="";
          v4="";
          scv4="";

			safe="";
          $.each(data,function(index,item){
          	var countryName1=item[0].countryName;
          	var title1=item[0].title;
          	var content1=item[0].content;
          	var wrtDt1=item[0].wrtDt;
          	
          	var countryName2=item[1].countryName;
          	var title2=item[1].title;
          	var content2=item[1].content;
          	var wrtDt2=item[1].wrtDt;
          	
          	var countryName3=item[2].countryName;
          	var title3=item[2].title;
          	var content3=item[2].content;
          	var wrtDt3=item[2].wrtDt;
          	
          	var countryName4=item[3].countryName;
          	var title4=item[3].title;
          	var content4=item[3].content;
          	var wrtDt4=item[3].wrtDt;
          	
          	var countryName5=item[4].countryName;
          	var title5=item[4].title;
          	var content5=item[4].content;
          	var wrtDt5=item[4].wrtDt;
          	
			safe+="<div>최신 국가별 코로나 격리정보</div>";

          	s+="<div>"+countryName1+"</div>"
          	c+="<div>"+title1+"</div>"
          	v+="<div>"+content1+"</div>"
          	scv+="<div>"+wrtDt1+"</div>"
          	
          	s1+="<div>"+countryName2+"</div>"
          	c1+="<div>"+title2+"</div>"
          	v1+="<div>"+content2+"</div>"
          	scv1+="<div>"+wrtDt2+"</div>"
          	
          	s2+="<div>"+countryName3+"</div>"
          	c2+="<div>"+title3+"</div>"
          	v2+="<div>"+content3+"</div>"
          	scv2+="<div>"+wrtDt3+"</div>"
          	
          	s3+="<div>"+countryName4+"</div>"
          	c3+="<div>"+title4+"</div>"
          	v3+="<div>"+content4+"</div>"
          	scv3+="<div>"+wrtDt4+"</div>"
          	
          	s4+="<div>"+countryName5+"</div>"
          	c4+="<div>"+title5+"</div>"
          	v4+="<div>"+content5+"</div>"
          	scv4+="<div>"+wrtDt5+"</div>"
			});
			$(".safe-title").html(safe);
			
          $("#countryName1").html(s);
          $("#title1").html(c);
          $("#content1").html(v);
          $("#wrtDt1").html(scv);
          
          $("#countryName2").html(s1);
          $("#title2").html(c1);
          $("#content2").html(v1);
          $("#wrtDt2").html(scv1);
          
          $("#countryName3").html(s2);
          $("#title3").html(c2);
          $("#content3").html(v2);
          $("#wrtDt3").html(scv2);
          
          $("#countryName4").html(s3);
          $("#title4").html(c3);
          $("#content4").html(v3);
          $("#wrtDt4").html(scv3);
          
          $("#countryName5").html(s4);
          $("#title5").html(c4);
          $("#content5").html(v4);
          $("#wrtDt5").html(scv4);
          
          $("#option1").addClass('opti1');
          $("#option2").addClass('opti2');
          $("#option3").addClass('opti3');
          $("#option4").addClass('opti4');
          $("#option5").addClass('opti5');
      }
  });
}
/*세계격리현황 최신 5개국*/