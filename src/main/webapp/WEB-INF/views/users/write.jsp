<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" type="image/png" href="/img/favicon.png" />
<link rel="stylesheet"  href="/css/common.css" />
<style>
   input:not(input[type=submit]) { width:100%; }
   input[type=submit] { width : 100px; }
   #goList  { width : 80px; }
   
   td { 
      padding:10px;
      width: 700px;
      text-align: center;
   }
   td:nth-of-type(1) {
      width : 200px;
   }
   
   td:not([colspan]):first-child {
      background: grey;
      color : white;
      font-weight: bold;
   }
   
   input[readonly] {
      background: #EEE;
   }

</style>
</head>
<body>
  <main>
	<h2>회원 가입</h2>
	<form action="/Users/Write" method="POST">
	<table>
	 <tr>
	   <td>ID</td>
	   <td><input type="text" name="userid" /></td>
	 </tr>
	 <tr>
	   <td>PW</td>
	   <td><input type="password" name="passwd" /></td>
	 </tr>
	 <tr>
	   <td>Name</td>
	   <td><input type="text" name="username" /></td>
	 </tr>
	 <tr>
	   <td>Email</td>
	   <td><input type="text" name="email" /></td>
	 </tr>
	 <tr>
	   <td>Point</td>
	   <td><input type="text" value="1000" readonly /></td>
	 </tr>
	 <tr>
	   <td>InDate</td>
	   <td><input type="text"  value="${ now }" readonly /></td>
	 </tr>
	 <tr>
	   <td colspan="2">
	    <input type="submit" value="Add" />
	    <input type="button" value="List" id="goList" />
	   </td>
	 </tr>
	
	</table>	
	</form>   
	
  </main>
  
  <script>
  	const  goListEl  = document.getElementById('goList');
  	goListEl.addEventListener('click', function(e) {
  		location.href = '/Menus/List';
  	})
  
  </script>
  
</body>
</html>

