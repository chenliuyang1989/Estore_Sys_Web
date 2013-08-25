<%@ include file="/common/taglibs.jsp"%>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
<link rel="stylesheet" type="text/css" media="all"
	href="<c:url value='/styles/${appConfig["csstheme"]}/theme.css'/>" />
<link rel="stylesheet" type="text/css" media="print"
	href="<c:url value='/styles/${appConfig["csstheme"]}/print.css'/>" />
<script language="JavaScript" type="text/javascript">
var pic = new Image();
pic.src="../images/arrow_right.gif";

function toggleMenu()
{
 frmBody = parent.document.getElementById('frame-body');
 imgArrow = document.getElementById('img');

 if (frmBody.cols == "0, 9, *")
 {
 frmBody.cols="200, 9, *";
 imgArrow.src = "../img/arrow_left.gif";
 }
 else
 {
 frmBody.cols="0, 9, *";
 imgArrow.src = "../img/arrow_right.gif";
 }
}
</script>
</head>
<body onselect="return false;">
<div id="toggleMenu">
<table id="tbl" height="100%" cellspacing="0" cellpadding="0">
	<tbody>
		<tr>
			<td><a href="javascript:toggleMenu();"> <img id="img"
				border="0" src="../img/arrow_left.gif" />
			</a></td>
		</tr>
	</tbody>
</table>
</div>
</body>
</html>