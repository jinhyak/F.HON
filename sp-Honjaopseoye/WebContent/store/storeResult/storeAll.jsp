<%@page import="com.google.gson.Gson"%>
<%@page import="hj.util.PageBar"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>혼자놀자!</title>
<style type="text/css">
   .addr{
      font-size: medium;
      font-weight: normal;
      color: gray;
   }
   .view{
      font-size: large;
      font-weight: bold;
      color: gray;
   }
   .scoreText{
      font-size: x-large;
      font-weight: bold;
      color: orange;
   }
   .name{
      font-size: large;
      font-weight: bold;
      
   }
</style>
<script type="text/javascript">
var obj;
var datas = [];
</script>
</head>
<body style="min-width: 1500px;">
<script type="text/javascript">
function showDetailStore(no){
   location.href="/sp-Honjaopseoye/store/storeDetail.hon?store_no="+no;
   
   }
/////////////////////매뉴 버튼 이벤트 처리 함수
function chooseMenu(){
   $("#menuBtns").find("button").click(function(){
      $("#menuBtns").find("button").attr("class","ui button")
      $(this).attr('class','ui active button')
      
});
}/////////////////end of choseMenu
function searchAll(){
   if($.trim($('#searchWord').val())==""){
      alert("검색어를 입력하세요");
      return;
   }///end of if
   else{
      
      location.href = "/sp-Honjaopseoye/store/storeSearchAll.hon?searchWord="+
                  $.trim($('#searchWord').val())+
                  "&gubun="+$('#menuBtns').find(".active").val();
   
   }/////end of else
}/////end of searchAll

   
</script>
<%@include file="../../include/include/subtop.jsp"%>
<%
   List<Map<String,Object>> list
      = (List<Map<String,Object>>)request.getAttribute("list");
   Gson gson = new Gson();
   String json = gson.toJson(list);
   Map<String,Object> pMap 
      = (Map<String,Object>)request.getAttribute("condition");
   String gubun    = (String)pMap.get("gubun");
   String store_business = (String)pMap.get("store_business");
   String store_price = (String)pMap.get("store_price");
   String searchWord = (String)pMap.get("searchWord");
   System.out.println(pMap);

   if(list.size()>0){
   %>
<div class="ui basic segments" style="padding-top: 40px;margin-bottom: 0px;">
   <div class="ui basic segment"style="padding-left: 350px;">
      <div class="ui one column grid">
         <div class="column" style="padding-bottom: 0px;">
            <div class="ui buttons" id="menuBtns" style="width: 282px;">
               <button class="ui active button" id="matjip" value="21">맛집</button>
               <button class="ui button" id="suljip" value="22">술집</button>
                 <button class="ui button" id="nolgot" value="23">놀곳</button>
            </div>
         </div>
         <div class="column" style="padding-top: 0px;">
            <div class="ui input focus">   
                 <input type="text" placeholder="검색어를 입력하세요" id="searchWord" name="searchWord" style="width: 210px;">
                <button class="ui linkedin button" id="searchButton" onclick="searchAll()"style="width: 72px;">검색</button>
            </div>
         </div>
      </div>
   </div>
            <div class="ui right floated buttons"style="padding-right: 210px;padding-top: 23px;">
                  <button class="ui right floated left attached right labeled icon linkedin button" id="view">
                     <i class="caret square down icon"></i>
                     조회순
                  </button>
                  <button class="ui right floated right attached right labeled icon linkedin button" id="score">
                     <i class="caret square down icon"></i>
                     별점순
                  </button>
               </div>
         
         <h2 style="padding-left: 345px;margin-top: 10px;"><%=searchWord %>에 대한 검색결과</h2><br>
         <div class="ui basic segment"id="pagination" style="padding-left: 230px;padding-top: 0px;">

         </div>
   <!-- two column grid 끝 -->   
         <div id="pagination-container"style="padding-top: 30px;padding-bottom: 30px; padding-left: 770px;">
         </div>
         
      
      <!-- text container 끝 -->
</div><!--=========end of segments ==============-->
 
<%  
      }///end of if
   else{
      %>
<!-- 검색결과가 없을시 -->
<div class="ui grid" style="margin-top: 50px; height: 860px;">
      <div class="ui text basic segment"style="padding-left: 450px;">
         <div class="ui one column grid">
            <div class="column" style="padding-bottom: 0px;">
               <div class="ui buttons" id="menuBtns" style="width: 282px;">
                    <button class="ui active button" id="matjip" value="21">맛집</button>
                    <button class="ui button" id="suljip" value="22">술집</button>
                    <button class="ui button" id="nolgot" value="23">놀곳</button>
               </div>
            </div>
            <div class="column" style="padding-top: 0px;">
               <div class="ui input focus">   
                    <input type="text" placeholder="검색어를 입력하세요" id="searchWord" name="searchWord" style="width: 210px;">
                   <button class="ui linkedin button" id="searchButton" onclick="searchAll()"style="width: 72px;">검색</button>
               </div>
            </div>
         </div>
            <h2><%=pMap.get("searchWord") %>에 대한 검색결과</h2><br>
            <div class="ui one column grid">
               <div class="column">
                  <img src="/sp-Honjaopseoye/image/storeImg/noSearch.png" style="height:500px;height: 300px;padding-left: 200px;">
               </div>
            </div>
         <!-- two column grid 끝 -->   
      </div>
      <!-- text container 끝 -->
   </div>
<%
   }//end of else 
%>
   <!-- 받아온 검색조건 히든태그임 -->
   <input type="hidden" id="gubun" value="<%=gubun%>">
   <input type="hidden" id="store_business" value="<%=store_business%>">
   <input type="hidden" id="store_price" value="<%=store_price%>">
   <input type="hidden" id="lastSearhWord" value="<%=searchWord%>">
<script type="text/javascript">
$(document).ready(function(){
   
   chooseMenu();
   sort();
   var json = '<%=json%>';
   //console.log(json);
   obj = JSON.parse(json);
   for(var i=0;i<obj.length;i++){
      datas.push(i);
   }
   $('#pagination-container').pagination({    
      dataSource: datas,
      pageSize:8,
       callback: function(obj, pagination) {
           // template method of yourself
           console.log(pagination)
           var html = simpleTemplating(obj);
           $('#pagination').html(html);
           $('.ui.rating').rating('disable');
       }
   });
   
});/////////end of ready
//조회수,별점수 정렬
function sort(){
   $("#view").click(function(){
       location.href = "/sp-Honjaopseoye/store/storeSearchAll.hon?searchWord="+$.trim($('#lastSearhWord').val())+
         "&gubun="+$('#gubun').val()+
         "&store_business="+$('#store_business').val()+
         "&store_price="+$('#store_price').val(); 

      
   })
   $("#score").click(function(){
      location.href = "/sp-Honjaopseoye/store/storeSearchAllStar.hon?searchWord="+$.trim($('#lastSearhWord').val())+
         "&gubun="+$('#gubun').val()+
         "&store_business="+$('#store_business').val()+
         "&store_price="+$('#store_price').val();
   })
   
}////////end of sort
function simpleTemplating(data) {
   var html = '<div class="ui four column grid"style="width: 1500px;">'
    $.each(data, function(index, item){
       html+= 
          '<div class="column" style="height: 350px;">'+
          '<div class="ui link card" onclick="showDetailStore('+obj[item].STORE_NO+')" style="width: 335px;height: 330px;">'+
                   '<div class="image">'+
                     '<img src="/sp-Honjaopseoye/image/storeImg/'+obj[item].STORE_IMG+'" style="width: 336px; height: 220px;">'+
                   '</div>'+
                  '<div class="content" style="display:inline-block;width:100%;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;">'+
                     '<span class="name">'+obj[item].STORE_NAME+'</span>'+
                     '<div class="meta">'+
                        '<span class="addr">'+obj[item].STORE_BUSINESS+'-'+obj[item].STORE_LITTLEADDR+'</span><br>'+
                     '</div>'+
                     '<span class="view"><i class="eye icon">&nbsp;'+obj[item].STORE_HIT+'</i></span>'+
                     '<br>'+
                     '<div class="ui large star rating" data-rating="'+obj[item].STORE_SCORE.toFixed(0)+'" data-max-rating="5" style=" width:100px; height:30px;"">1234</div>'+
                     '<span class="scoreText">'+obj[item].STORE_SCORE+'</span>'+
                       '</div>'+
               '</div>'+
               '</div>'
               
       });
      html += '</div>'
   return html;
}
</script>
<%@include file="../../include/include/bottom.jsp" %>
</body>
</html>