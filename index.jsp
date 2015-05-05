<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>webcam test</title>
	<script type="text/javascript" src="webcam.js"></script>
	<script src="//code.jquery.com/jquery-1.11.2.min.js"></script>
	<style type="text/css">
		body { font-family: Helvetica, sans-serif; }
		h2, h3 { margin-top:0; }
		form { margin-top: 15px; }
		form > input { margin-right: 15px; }
		#results { float:right; margin:20px; padding:20px; border:1px solid; background:#ccc; }
	</style>
</head>
<body>
	
	<h1>Webcam test</h1>
	
	<div id="my_camera"></div>
	
	<form id="myform" method="post" action="cv.jsp" target="_blank">
		<input id="mydata" type="hidden" name="mydata" value=""/>
	</form>
	<script language="JavaScript">
	
		function first() {					
			Webcam.set({
				width: 320,
				height: 240,
				image_format: 'jpeg',
				jpeg_quality: 85
			});
			Webcam.attach( '#my_camera' );
		}
	</script>
	<!-- Configure a few settings and attach camera -->
	<input id="y" type=button value="Take Snapshot" onClick="first()">
	<input id="x" type=button value="Take Snapshot" onClick="snapit()">
	<script language="JavaScript">
	
	
		function snapit() {	
			var raw_image_data = "";
			Webcam.snap( function(data_uri) {
				raw_image_data = data_uri;
				/*
				$.ajax({
				  url: "cv.jsp",
				  data: "mydata="+raw_image_data,
				  contentType: "arraybuffer",
				  type: "POST"
				}).done(function() {
					alert("oldu.")
				});
				*/
				//document.getElementById('mydata').value = raw_image_data;
				//document.getElementById('myform').submit();
			});
			
			Webcam.upload( raw_image_data, 'cv.jsp', function(code, text) {
			   console.log(code);
			    console.log(text);
			} );
		}
		
		//$('#y').click();
		
		$('#y').click();
		setTimeout(function(){ $('#x').click(); }, 1200);
		setInterval(makeClick, 60000);
		function makeClick()
		{
			$('#x').click();
			//setTimeout(function(){ $('#x').click(); }, 5000);
		}
		
		
	</script>
	<!-- Code to handle taking the snapshot and displaying it locally 
	<input type=button value="Take Snapshot" onClick="take_snapshot()">-->
</body>
</html>
</html>