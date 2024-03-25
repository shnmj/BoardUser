<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" type="image/png" href="/img/favicon.png" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
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
   td:nth-of-type(2) {
      text-align: left;
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
	<h2>Member Info</h2>
	<table>
	 <tr>
	   <td>ID</td>
	   <td>${vo.userid}</td>
	 </tr>
	 <tr>
	   <td>PW</td>
	   <td>${vo.passwd}</td>
	 </tr>
	 <tr>
	   <td>Name</td>
	   <td>${vo.username}</td>
	 </tr>
	 <tr>
	   <td>Email</td>
	   <td>${vo.email}</td>
	 </tr>
	 <tr>
	   <td>Member Rank</td>
	   <td>${vo.upt}</td>
	 </tr>
	 <tr>
	 <tr>
	   <td>Point</td>
	   <td>${vo.upoint}</td>
	 </tr>
	 <tr>
	   <td>InDate</td>
	   <td>${vo.indate}</td>
	 </tr>
	 <tr>
	   <td colspan="2">
	   <a class="btn btn-primary btn-sm" role="button"
	   href="/Users/WriteForm" >Sign up</a>
	   
	   <a class="btn btn-primary btn-sm" role="button"
	   href="/Users/UpdateForm?userid="${vo.userid}>Update</a>
	   
	   <a class="btn btn-primary btn-sm" role="button"
	   href="/Users/Delete?userid=${vo.userid}">Delete</a>
	   
	   <a class="btn btn-primary btn-sm" role="button"
	   href="/Users/List">Member List</a>
	   
	   <a class="btn btn-primary btn-sm" role="button"
	   href="/">Home</a>
	   </td>
	 </tr>
	
	</table>	

  </main>
  
  <script>
  	const  goListEl  = document.getElementById('goList');
  	goListEl.addEventListener('click', function(e) {
  		location.href = '/Menus/List';
  	})
  
  </script>
  
</body>
</html>

