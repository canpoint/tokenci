<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="java.io.*,java.util.*, javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="org.apache.commons.fileupload.disk.*" %>
<%@ page import="org.apache.commons.fileupload.servlet.*" %>
<%@ page import="org.apache.commons.io.output.*" %>
<%
File file ;
int maxFileSize = 5000 * 1024;
int maxMemSize = 5000 * 1024;
ServletContext context = pageContext.getServletContext();
String filePath = context.getInitParameter("file-upload");
// Verify the content type
String contentType = request.getContentType();

DiskFileItemFactory factory = new DiskFileItemFactory();
// maximum size that will be stored in memory
factory.setSizeThreshold(maxMemSize);
// Location to save data that is larger than maxMemSize.
factory.setRepository(new File("c:\\temp"));
ServletFileUpload upload = new ServletFileUpload(factory);
// maximum file size to be uploaded.
upload.setSizeMax( maxFileSize );
List fileItems = upload.parseRequest(request);
Iterator i = fileItems.iterator();
      
while ( i.hasNext () ) 
{
	FileItem fi = (FileItem)i.next();
	
	String fileName = fi.getName();
	//out.println(fileName.lastIndexOf("\\"));
	if( fileName.lastIndexOf("\\") >= 0 ){
            file = new File( filePath + 
            fileName.substring( fileName.lastIndexOf("\\")));
	} else{
            file = new File( filePath + 
            fileName.substring(fileName.lastIndexOf("\\")+1));
	}
	fi.write( file ) ;
}
%>