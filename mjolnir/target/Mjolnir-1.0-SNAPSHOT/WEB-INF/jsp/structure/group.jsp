
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
   <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous"/>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css" integrity="sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r" crossorigin="anonymous"/>
        <script src=https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
        <script src="<c:url value="/"/>js/app.js"></script>
        <script src="<c:url value="/"/>js/user/user.js"></script>
      <title>Team</title>
        
        
    </head>
    <body onload="hide('${tId}')">
        
        <div class="container-fluid">            
            <div class="row">
                <%@ include file="/WEB-INF/jsp/header.jsp" %>               
            </div>
            <nav class="breadcrumb">
                <a class="breadcrumb-item" href="<c:url value="/"/>main/structure">Structure</a> / 
                <span class="breadcrumb-item active">Team</span>
            </nav>
                
                

            <div class="container" style="width: 100%">
                <div class="row">
                    <div class="col-md-2">
                        <div class="panel panel-default">
                            <!--<div class="panel-heading"></div>-->
                            <div class="panel-body">
                                <ul class="nav nav-pills nav-stacked">
                                    <li role="presentation"><a href="<c:url value="/"/>main/structure/overview/${userInfo.user.id}">Overview</a></li>
                                    <li role="presentation" class="active"><a href="<c:url value="/"/>main/group">Groups</a></li>
                                    <li role="presentation"><a href="/Mjolnir/main/team">Team</a></li>
                                    
                                </ul>
                            </div>
                        </div>
                    </div>
                                <div class="col-md-10">
                        <div class="panel panel-primary">
                            <div class="panel-heading">
                                <h4 class="panel-title">Group</h4>
                            </div>
                            <div class="panel-body">
                            <div class="row">
                                
                            </div>
                            <div align="lift">
                                <a href="<c:url value="/"/>#" class="btn btn-primary">Add Group</a>                                
                            </div>
                            <br>
                            <c:if test="${empty groupList}">
                                <h2><p align="center">Empty</h2>
                            </c:if>
                            
                            <table class="table table-bordered" cellspacing="0" id="myTable">

                                <thead>
                                    <tr class="active">
                                        <th><div align="center">ID</div></th>
                                        <th><div align="center">Title</div></th>
                                        <th><div align="center">Option</div></th>
                                    </tr>
                                </thead>
                                
                                <c:forEach var="teamItem" items="${teamList}">
                                <tbody>
                                    
                                        <tr>
                                            <td align="center" class="col-lg-2">${teamItem.id}</td>
                                            <td align="center">${teamItem.name}</td>
                                            <td align="center" class="col-lg-4">
                                                <!--<a href="#${teamItem.id}"  class="btn btn-warning" data-toggle="collapse">Show</a>-->
                                                <a onclick="hide('${teamItem.id}')"  class="btn btn-info" data-toggle="collapse">Show</a>
                                                <a href="<c:url value="/"/>main/team/editForm/${teamItem.id}" class="btn btn-warning">Edit </a>
                                                <a href="<c:url value="/"/>main/team/delete/${teamItem.id}"class="btn btn-danger" OnClick="return confirmDelete();"> Delete</a>
                                                
                                            </td>
                                        </tr>
                                    
                                </tbody>
                                </c:forEach>
                            </table>
                                            
                            </div>
                        </div>
                                </div>
                </div>
            </div>
            <br><br>
        
            <script>
                 var en = "";
                function hide(obj) {
//                    alert(obj);
                    var el = document.getElementById(obj);
                        if(en !== ""){
                        en.style.display = 'none';
                        }
                        el.style.display = 'block';
                        en = el;
                }
            </script>
            
                <div class="col-md-2">
                </div>
                    
                         <!-- <div class="container" style="width: 100%"> -->
            <c:forEach var="teamItem2" items="${teamList}">
                    <div class="container panel-collapse collapse" id="${teamItem2.id}" style="width: 100%">
                    <div class="row">
                        <div class="col-md-10">
                        <div class="panel panel-primary">
                            <div class="panel-heading">
                                
                            </div>
                            
                            <div class="panel-body">
                                <div align="left">
                                    <a href="<c:url value="/"/>main/team/addLeader?tId=${teamItem2.id}" class="btn btn-primary">Add Leader</a>                                
                                </div>
                                <br>
                                <table class="table table-bordered" id="leader${teamItem2.id}" cellspacing="0">
                                    <thead>
                                        <tr class="active">
                                            <th><div align="center" >ID</div></th>
                                            <th><div align="center" >Name</div></th>
                                            <th><div align="center">Lastname</div></th>                                            
                                            <th><div align="center" >Option</div></th>
                                        </tr>
                                    </thead>
                                    <c:forEach var="leaderItem" items="${leaderList}">
                                    <tbody>
                                        <c:if test="${teamItem2.id == leaderItem.teamId}">
                                            <tr>
                                                <td align="center" class="col-lg-2">${leaderItem.leaderId}</td>
                                                <c:forEach var="profileItem" items="${profileList}">
                                                    <c:if test="${profileItem.id == leaderItem.leaderId}">
                                                        <td align="center" class="col-md-3">${profileItem.firstName}</td>
                                                        <td align="center" class="col-md-3">${profileItem.lastName}</td>
                                                    </c:if>
                                                    
                                                </c:forEach>
                                                <td align="center" class="col-lg-2">
                                                    <c:forEach var="userItem" items="${userList}">
                                                        <c:if test="${userItem.id == leaderItem.leaderId}">
                                                            <a href="<c:url value="/"/>main/user/editForm2/${userItem.id}" class="btn btn-success">ADD</a>
                                                            <a href="<c:url value="/"/>main/team/leaderdelete/${leaderItem.leaderId}?tId=${teamItem2.id}"class="btn btn-danger" OnClick="return confirmDelete();"> Delete</a> 
                                                        </c:if>
                                                    </c:forEach>
                                                </td>
                                            </tr>
                                        </c:if>                                  
                                    </tbody>
                                    </c:forEach>
                                </table>

                            </div>
                            <div class="panel-body">
                                <div align="left">
                                    <a href="<c:url value="/"/>main/team/addMember?tId=${teamItem2.id}" class="btn btn-primary">Add Member</a>                                                               
                                </div>
                                <br>
                                <table class="table table-bordered" id="leader${teamItem2.id}" cellspacing="0">
                                    <thead>
                                        <tr class="active">
                                            <th><div align="center">ID</div></th>
                                            <th><div align="center">Name</div></th>
                                            <th><div align="center">Lastname</div></th>                                            
                                            <th><div align="center">Option</div></th>
                                        </tr>
                                    </thead>
                                    <c:forEach var="memberItem" items="${memberList}">
                                    <tbody>
                                        <c:if test="${teamItem2.id == memberItem.teamId}">
                                            <tr>
                                                <td align="center" class="col-lg-2">${memberItem.memberId}</td>
                                                <c:forEach var="profileItem" items="${profileList}">
                                                    <c:if test="${profileItem.id == memberItem.memberId}">
                                                        <td align="center" class="col-md-3">${profileItem.firstName}</td>
                                                        <td align="center" class="col-md-3">${profileItem.lastName}</td>
                                                    </c:if>
                                                </c:forEach>
                                                <td align="center" class="col-lg-2">
                                                    <a href="<c:url value="/"/>main/team/memberdelete/${memberItem.memberId}?tId=${teamItem2.id}"class="btn btn-danger" OnClick="return confirmDelete();"> Delete</a>
                                                </td>
                                            </tr>
                                        </c:if>                                  
                                    </tbody>
                                    </c:forEach>
                                </table>
                            </div>
                            </div>
                        </div>
                        </div>
                   
                        
                </div>
                </c:forEach>  
                    
                
                     
                
            </div>
        
        <script language="JavaScript">
function confirmDelete(){
    if(confirm('Are you sure you want to delete?')){
	return true;
}else{
	return false;
}
}
</script>
    </body>
</html>
