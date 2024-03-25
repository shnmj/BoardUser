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
      background: black;
      color : white;
      font-weight: bold;
   }

</style>
</head>
<body>
  <main>
	<h2>Menu Reg</h2>
	<form action="/Menus/Write" method="GET">
	<table>
	 <tr>
	   <td>Menu Id</td>
	   <td><input type="text" name="menu_id" /></td>
	 </tr>
	 <tr>
	   <td>Menu Name</td>
	   <td><input type="text" name="menu_name" /></td>
	 </tr>
	 <tr>
	   <td>Menu in Order</td>
	   <td><input type="text" name="menu_seq" /></td>
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

