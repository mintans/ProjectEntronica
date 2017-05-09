

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
    
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="<c:url value="/"/>view/template/css/bootstrap.min.css" />
        <link rel="stylesheet" href="<c:url value="/"/>view/template/css/bootstrap-theme.min.css" />
        <script src=https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js></script>
        <script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/jquery.tablesorter/2.9.1/jquery.tablesorter.min.js"></script>

        <script src="<c:url value="/"/>view/template/js/bootstrap.min.js" ></script>
        <script src="<c:url value="/"/>js/notice/notice_overtime.js"></script>
        <script src="<c:url value="/"/>js/app.js"></script>
        <script src="<c:url value="/"/>js/leave.js"></script>
        <script src="<c:url value="/"/>js/user/department.js"></script> 
        <script src="<c:url value="/"/>js/payment.js"></script>
        <script src="<c:url value="/"/>js/payment.js"></script>

        <script src="<c:url value="/"/>js/sortTable/jquery-latest.js" type="text/javascript"></script>
        <script src="<c:url value="/"/>js/sortTable/jquery.tablesorter.js" type="text/javascript"></script>
        <link href="<c:url value="/"/>js/sortTable/themes/blue/style.css" rel="stylesheet" type="text/css"/>

        <title>Notice Personal</title>
          <c:if test="${ userInfo.user.permission == 'LEADER'}">
              <c:set var="check" value="0"></c:set>
                                <c:forEach var="profileItems" items="${profileList}">
                                    <c:if test="${profileItems.id == userInfo.user.id}">
                                        <c:set var="check" value="1"></c:set>
                                    </c:if>
                                </c:forEach>
                                <c:if test="${check == 0}">
                                    <body>
                                        <div class="container-fluid">            
                                            <div class="row">
                                                <%@ include file="/WEB-INF/jsp/header.jsp" %>               
                                            </div>
                                            <center>
                                           <h3>Please add your profile</h3>
                                            </center>
                                        </div>
                                    </body>
                                </c:if>
                                <c:if test="${check == 1}">
                                    <body onload="hide('${userInfo.user.id}')">
                                                <div class="container-fluid">  
                                            <div class="row">
                                                <%@ include file="/WEB-INF/jsp/header.jsp" %>               
                                            </div>
                                             </div>
                                             <div class="container-fluid">
                                            <nav class="breadcrumb">
                                           <a class="breadcrumb-item" href="<c:url value="/main/notice/personal"/>">Notice</a> / 
                                            <span class="breadcrumb-item active">Personal</span>
                                            </nav>
                                           </div>
                                               <div class="container" style="width: 100%">
                                                   
                                                        <div class="col-md-2">
                                                            <div class="panel panel-default">
                                                                <div class="panel-body">
                                                                    <ul class="nav nav-pills nav-stacked">
                                                                        <li class="nav-main active"><a href="<c:url value="/main/notice/personal"/>">Personal</a></li>
                                                                        <li class="nav-main"><a href="<c:url value="/"/>main/notice">Overtime</a></li>
                                                                        <li class="nav-main"><a href="<c:url value="/"/>main/notice/leave">Leave</a></li>
                                                                        <li class="nav-main"><a href="<c:url value="/"/>main/notice/payment">Payment</a></li>
                                                                    </ul>
                                                                </div>
                                                            </div>
                                                        </div>
                                                  <c:forEach var="profileItem2" items="${profileList}">
                                                      <c:forEach var="OTItems" items="${overtimeList}">
                                                        <c:if test="${userInfo.user.id == OTItems.empId}">
                                                        <c:if test="${OTItems.status == 5 }">
                                                            <c:set var="checkOT" value="1"></c:set>
                                                        </c:if>
                                                        </c:if>
                                                      </c:forEach>
                                                      <c:forEach var="LeaveItems" items="${leaveList}">
                                                          <c:if test="${userInfo.user.id == LeaveItems.empId}">
                                                          <c:if test="${LeaveItems.status == 4}">
                                                            <c:set var="checkLeave" value="1"></c:set>
                                                          </c:if>
                                                          </c:if>
                                                      </c:forEach>
                                                      <c:forEach var="paymentItems" items="${paymentList}">
                                                          <c:if test="${userInfo.user.id == paymentItems.empId}">
                                                          <c:if test="${paymentItems.status == 5}">
                                                            <c:set var="checkPayment" value="1"></c:set>
                                                          </c:if>
                                                          </c:if>
                                                      </c:forEach>
                                                <div class="container panel-collapse collapse" id="${profileItem2.id}">
                                                       <div class="panel-body">
                                                        <div class="col-md-10">
                                                            <div class="panel panel-default">
                                                               
                                                                <div class="panel-body">
                                                                    <div class="row">
      
                                                                    </div>
                                                                    <c:if test="${checkOT != 1 && checkLeave != 1 && checkPayment != 1}">
                                                                        <center><h3>No Request Rejected</h3></center> 
                                                                    </c:if>
                                                                    <c:if test="${checkOT == 1}">
                                                                         <div class="panel panel-primary">
                                                                    <div class="panel-heading">    
                                                                            <h4 class="panel-title">Overtime Rejected</h4>
                                                                    </div>   
                                                                    <br>
                                                                    <div class="panel-body">
                                                                    <table class="table table-bordered" id="data_ot${profileItem2.id}" cellspacing="0"> 
                                                                        <c:forEach var="OTItems" items="${overtimeList}">
                                                                              <c:if test="${OTItems.status == 5}">
                                                                            <c:if test="${profileItem2.id == OTItems.empId}">
                                                                        <thead>
                                                                            <tr class="bg-primary">                                                                                
                                                                                <th><div align="center">Date</div></th>
                                                                                <th><div align="center">Start Time</div></th>
                                                                                <th><div align="center">End Time</div></th>
                                                                                <th><div align="center">Total (hrs)</div></th>
                                                                                <th><div align="center">Description</div></th>
                                                                                <th><div align="center">Remark</div></th>
                                                                                <th><div align="center">Option</div></th>
                                                                            </tr>
                                                                        </thead>                         
                                                                                <c:if test="${OTItems.dayName == 'Sat' || OTItems.dayName == 'Sun'}">                                                                               
                                                                                    <tr bgcolor="D3F6FF">                                                                                        
                                                                                        <td align="center">${OTItems.date} ${OTItems.month} ${OTItems.year}</td>
                                                                                        <td align="center">${OTItems.timeIn}</td>
                                                                                        <td align="center">${OTItems.timeOut}</td>
                                                                                        <td align="center">${OTItems.total}</td>
                                                                                        <td align="center">${OTItems.description}</td>
                                                                                        <td align="center">${OTItems.remark}</td>

                                                                                        <c:if test="${OTItems.status == 5}">
                                                                                             <td align="center">
                                                                                       <a href="<c:url value="/"/>main/overtime/editForm2/${OTItems.id}?empId=${profileItem2.id}" class="btn btn-info">Sent again </a>
                                                                                                   <a href="<c:url value="/"/>main/overtime/delete/${OTItems.id}?empId=${profileItem2.id}"class="btn btn-danger"> Delete</a> 
                                                                                                </td>
                                                                                        </c:if>
                                                                                       
                                                                                    </tr>
                                                                                    </tbody>
                                                                                </c:if>
                                                                                <c:if test="${OTItems.dayName != 'Sat' && OTItems.dayName != 'Sun'}">                                                                                
                                                                                    <tbody>
                                                                                        <tr>                                                                                        
                                                                                            <td align="center">${OTItems.date} ${OTItems.month} ${OTItems.year}</td>
                                                                                            <td align="center">${OTItems.timeIn}</td>
                                                                                            <td align="center">${OTItems.timeOut}</td>
                                                                                            <td align="center">${OTItems.total}</td>
                                                                                            <td align="center" style="word-wrap: break-word;">${OTItems.description}</td>
                                                                                            <td align="center" style="word-wrap: break-word;">${OTItems.remark}</td>
                                                                                           
                                                                                            <c:if test="${OTItems.status == 5}">
                                                                                                <td align="center">
                                                                                                <a href="<c:url value="/"/>main/overtime/editForm2/${OTItems.id}?empId=${profileItem2.id}" class="btn btn-info">Sent again </a>
                                                                                                   <a href="<c:url value="/"/>main/overtime/delete/${OTItems.id}?empId=${profileItem2.id}"class="btn btn-danger"> Delete</a>  
                                                                                                </td>
                                                                                                </c:if>      
                                                                                           
                                                                                            
                                                                                        </tr>                                                    
                                                                                    </c:if>

                                                                                </c:if>
                                                                                         </c:if>
                                                                            </c:forEach>
                                                                            
                                                                        </tbody>
                                                                    </table>
                                                                         </div> 
                                                                        </div>
                                                                    </c:if>
                                                                        
                                                                        
                                                                        
                                                                

                                                                    <br>
                                                                    <c:if test="${checkLeave == 1}">    
                                                                    <div class="panel panel-primary">
                                                                    <div class="panel-heading">
                                                                    <h4 class="panel-title">Leave Rejected</h4>
                                                                    </div>  
                                                                           <div class="panel-body">
                                                                    <table class="table table-bordered" id="leave${profileItem2.id}" cellspacing="0">
                                                                        <c:forEach var="LeaveItems" items="${leaveList}">
                                                                              <c:if test="${LeaveItems.status == 4}">
                                                                            <c:if test="${profileItem2.id == LeaveItems.empId}"> 
                                                                        <thead>
                                                                            <tr class="bg-primary">                                                                                
                                                                                <th><div align="center">Date</div></th>
                                                                                <th><div align="center">Start Date</div></th>
                                                                                <th><div align="center">End Date</div></th>
                                                                                <th><div align="center">Total</div></th>
                                                                                <th><div align="center">On Leave</div></th>
                                                                                <th><div align="center">Description</div></th>
                                                                                <th><div align="center">Option</div></th>
                                                                            </tr>
                                                                        </thead>                                                                                                 
                                                                                       <td align="center">${LeaveItems.date2}</td>
                                                                                        <td align="center">${LeaveItems.from2}</td>
                                                                                        <td align="center">${LeaveItems.to2}</td>
                                                                                        <td align="center">${LeaveItems.total}</td>
                                                                                        <td align="center">${LeaveItems.type}</td>
                                                                                        <td align="center" style="word-wrap: break-word;"> ${LeaveItems.description}</td>
                                                                                

                                                                                        <c:if test="${LeaveItems.status == 4}">
                                                                                             <td align="center">
                                                                                                <a href="<c:url value="/"/>main/leave/editForm2/${LeaveItems.id}?empId=${profileItem3.id}&start=${profileItem3.startWorking}" class="btn btn-info">Sent again </a>
                                                                                                <a href="<c:url value="/"/>main/leave/delete/${LeaveItems.id}?empId=${profileItem3.id}&start=${profileItem3.startWorking}" class="btn btn-danger"> Delete</a> 
                                                                                                </td>
                                                                                        </c:if>
                                                                                       
                                                                                    </tr>
                                                                                    </tbody>
                                                                                </c:if>
                                                                               

                                                                                </c:if>
                                                                                        
                                                                            </c:forEach>
                                                                            
                                                                        </tbody>
                                                                    </table>
                                                                         </div>
                                                                </div>
                                                                    </c:if>
                                                                        
                                                              

                                                                    <br>
                                                                    <c:if test="${checkPayment == 1}">   
                                                                    <div class="panel panel-primary">
                                                                    <div class="panel-heading">
                                                                    <h4 class="panel-title">Payment Rejected</h4>
                                                                    </div>  
                                                                             <div class="panel-body">
                                                                    <table class="table table-bordered" id="data_payment${profileItem2.id}" cellspacing="0"> 
                                                                        <c:forEach var="paymentItems" items="${paymentList}">
                                                                              <c:if test="${paymentItems.status == 5}">
                                                                            <c:if test="${profileItem2.id == paymentItems.empId}">
                                                                        <thead>
                                                                           <tr class="bg-primary">
                                                                                <th><div align="center">Receipt No.</div></th>
                                                                                <th><div align="center">Date</div></th>
                                                                                <th><div align="center">Description</div></th>
                                                                                <th><div align="center">Amount</div></th>
                                                                                <th><div align="center">Option</div></th>
                                                                            </tr>
                                                                        </thead>                                                                                     
                                                                                       <td align="center">${paymentItems.receiptNo}</td>
                                                                                        <td align="center">${paymentItems.date}</td>
                                                                                        <td align="center" style="word-wrap: break-word;">${paymentItems.description}</td>
                                                                                        <td align="center" style="word-wrap: break-word;">${paymentItems.amount}</td>
                                                                                      

                                                                                        <c:if test="${paymentItems.status == 5}">
                                                                                             <td align="center">
                                                                                                <a href="<c:url value="/"/>main/payment/editForm2/${paymentItems.id}?empId=${profileItem2.id}&start=${profileItem2.startWorking}" class="btn btn-info">Sent again </a>
                                                                                                <a href="<c:url value="/"/>main/payment/delete/${paymentItems.id}?empId=${profileItem2.id}&start=${profileItem2.startWorking}" class="btn btn-danger"> Delete</a> 
                                                                                                </td>
                                                                                        </c:if>
                                                                                       
                                                                                    </tr>
                                                                                    </tbody>
                                                                                </c:if>
                                                                               

                                                                                </c:if>
                                                                                         
                                                                            </c:forEach>
                                                                            
                                                                        </tbody>
                                                                    </table>

                                                                </div>
                                                            </div>
                                                                    </c:if>
                                                        </div>
                                                                      
                                                    </div>
                                                        </div>
                                                       </div>
                                                                         </div> 
                                                
                                                                     
                                            </c:forEach> 
                                                                    </div>
                                    </c:if>
                                      </div>   
         </c:if>
            
            <c:if test="${ userInfo.user.permission == 'EMPLOYEE'}">
            <c:set var="check" value="0"></c:set>
                                <c:forEach var="profileItems" items="${profileList}">
                                    <c:if test="${profileItems.id == userInfo.user.id}">
                                        <c:set var="check" value="1"></c:set>
                                    </c:if>
                                </c:forEach>
                                <c:if test="${check == 0}">
                                    <body>
                                        <div class="container-fluid">            
                                            <div class="row">
                                                <%@ include file="/WEB-INF/jsp/header.jsp" %>               
                                            </div>
                                            <div class="container">
                                                <center>
                                                    <br><br><br>
                                                    <h3>Please add your profile</h3>
                                                </center>
                                            </div>
                                        </div>
                                    </body>
                                </c:if>
                                <c:if test="${check == 1}">
                                    <body onload="hide('${userInfo.user.id}')">
                                        <div class="container-fluid">            
                                            <div class="row">
                                                <%@ include file="/WEB-INF/jsp/header.jsp" %>               
                                            </div>

                                            <nav class="breadcrumb">
                                           <a class="breadcrumb-item" href="<c:url value="/main/notice/personal"/>">Notice</a> / 
                                            <span class="breadcrumb-item active">Personal</span>
                                            </nav>

                                            <c:forEach var="profileItem2" items="${profileList}">
                                                <c:forEach var="OTItems" items="${overtimeList}">
                                                        <c:if test="${userInfo.user.id == OTItems.empId}">
                                                        <c:if test="${OTItems.status == 5 }">
                                                            <c:set var="checkOT2" value="1"></c:set>
                                                        </c:if>
                                                        </c:if>
                                                      </c:forEach>
                                                      <c:forEach var="LeaveItems" items="${leaveList}">
                                                          <c:if test="${userInfo.user.id == LeaveItems.empId}">
                                                          <c:if test="${LeaveItems.status == 4}">
                                                            <c:set var="checkLeave2" value="1"></c:set>
                                                          </c:if>
                                                          </c:if>
                                                      </c:forEach>
                                                      <c:forEach var="paymentItems" items="${paymentList}">
                                                          <c:if test="${userInfo.user.id == paymentItems.empId}">
                                                          <c:if test="${paymentItems.status == 5}">
                                                            <c:set var="checkPayment2" value="1"></c:set>
                                                          </c:if>
                                                          </c:if>
                                                      </c:forEach>
                                                <div class="container panel-collapse collapse" id="${profileItem2.id}">
                                                    <div class="row">
                                                       
                                                        <div class="col-md-10">
                                                            <div class="panel panel-default">                                                            
                                                                <div class="panel-body">
                                                                    <div class="row">
      
                                                                    </div>
                                                                    <c:if test="${checkOT2 != 1 && checkLeave2 != 1 && checkPayment2 != 1}">
                                                                        <center><h3>No Request Rejected</h3></center> 
                                                                    </c:if>
                                                                    <c:if test="${checkOT2 == 1}">
                                                                    <div class="panel panel-primary">
                                                                    <div class="panel-heading">
                                                                    <h4 class="panel-title">Overtime Rejected</h4>
                                                                    </div>  
                                                                             <div class="panel-body">
                                                                    <br>
                                                                    <table class="table table-bordered" id="data_ot${profileItem2.id}" cellspacing="0">                                                                    
                                                                        <thead>
                                                                            <tr class="bg-primary">                                                                                
                                                                                <th><div alignbg-primary="center">Date</div></th>
                                                                                <th><div align="center">Start Time</div></th>
                                                                                <th><div align="center">End Time</div></th>
                                                                                <th><div align="center">Total (hrs)</div></th>
                                                                                <th><div align="center">Description</div></th>
                                                                                <th><div align="center">Remark</div></th>
                                                                                <th><div align="center">Option</div></th>
                                                                            </tr>
                                                                        </thead>
                                                                                  
                                                                        <c:forEach var="OTItems" items="${overtimeList}">
                                                                              <c:if test="${OTItems.status == 5}">
                                                                            <c:if test="${profileItem2.id == OTItems.empId}">
                                                                                <c:if test="${OTItems.dayName == 'Sat' || OTItems.dayName == 'Sun'}">                                                                               
                                                                                    <tr bgcolor="D3F6FF">                                                                                        
                                                                                        <td align="center">${OTItems.date} ${OTItems.month} ${OTItems.year}</td>
                                                                                        <td align="center">${OTItems.timeIn}</td>
                                                                                        <td align="center">${OTItems.timeOut}</td>
                                                                                        <td align="center">${OTItems.total}</td>
                                                                                        <td align="center">${OTItems.description}</td>
                                                                                        <td align="center">${OTItems.remark}</td>

                                                                                        <c:if test="${OTItems.status == 5}">
                                                                                             <td align="center">
                                                                                                   <a href="<c:url value="/"/>main/overtime/editForm2/${OTItems.id}?empId=${profileItem2.id}" class="btn btn-info">Sent again </a>
                                                                                                   <a href="<c:url value="/"/>main/overtime/delete/${OTItems.id}?empId=${profileItem2.id}"class="btn btn-danger"> Delete</a> 
                                                                                                </td>
                                                                                        </c:if>
                                                                                       
                                                                                    </tr>
                                                                                    </tbody>
                                                                                </c:if>
                                                                                <c:if test="${OTItems.dayName != 'Sat' && OTItems.dayName != 'Sun'}">                                                                                
                                                                                    <tbody>
                                                                                        <tr>                                                                                        
                                                                                            <td align="center">${OTItems.date} ${OTItems.month} ${OTItems.year}</td>
                                                                                            <td align="center">${OTItems.timeIn}</td>
                                                                                            <td align="center">${OTItems.timeOut}</td>
                                                                                            <td align="center">${OTItems.total}</td>
                                                                                            <td align="center" style="word-wrap: break-word;">${OTItems.description}</td>
                                                                                            <td align="center" style="word-wrap: break-word;">${OTItems.remark}</td>
                                                                                           
                                                                                            <c:if test="${OTItems.status == 5}">
                                                                                                <td align="center">
                                                                                                <a href="<c:url value="/"/>main/overtime/editForm2/${OTItems.id}?empId=${profileItem2.id}" class="btn btn-info ">Sent again </a>
                                                                                                <a href="<c:url value="/"/>main/overtime/delete/${OTItems.id}?empId=${profileItem2.id}"class="btn btn-danger"> Delete</a> 
                                                                                                </td>
                                                                                                </c:if>      
                                                                                           
                                                                                            
                                                                                        </tr>                                                    
                                                                                    </c:if>

                                                                                </c:if>
                                                                                         </c:if>
                                                                            </c:forEach>
                                                                            
                                                                        </tbody>
                                                                    </table>
                                                                        </div>
                                                          </div>
                                                                    </c:if>
                                                        
                                                                        
                                                                        
                                                                        
                                                                        
                                                                        <br>    
                                                                    <c:if test="${checkLeave2 == 1}">
                                                                      <div class="panel panel-primary">
                                                                    <div class="panel-heading">
                                                                    <h4 class="panel-title">Leave Rejected</h4>
                                                                    </div>  
                                                                             <div class="panel-body">

                                                                    <br>
                                                                    <table class="table table-bordered" id="leave${profileItem2.id}" cellspacing="0">                                                                    
                                                                        <thead>
                                                                            <tr class="bg-primary">                                                                                
                                                                                <th><div align="center">Date</div></th>
                                                                                <th><div align="center">Start Date</div></th>
                                                                                <th><div align="center">End Date</div></th>
                                                                                <th><div align="center">Total</div></th>
                                                                                <th><div align="center">On Leave</div></th>
                                                                                <th><div align="center">Description</div></th>
                                                                                <th><div align="center">Option</div></th>
                                                                            </tr>
                                                                        </thead>
                                                                                  
                                                                        <c:forEach var="LeaveItems" items="${leaveList}">
                                                                              <c:if test="${LeaveItems.status == 4}">
                                                                            <c:if test="${profileItem2.id == LeaveItems.empId}">                                                                                           
                                                                                                                                                                         
                                                                                       <td align="center">${LeaveItems.date2}</td>
                                                                                        <td align="center">${LeaveItems.from2}</td>
                                                                                        <td align="center">${LeaveItems.to2}</td>
                                                                                        <td align="center">${LeaveItems.total}</td>
                                                                                        <td align="center">${LeaveItems.type}</td>
                                                                                        <td align="center" style="word-wrap: break-word;"> ${LeaveItems.description}</td>
                                                                                

                                                                                        <c:if test="${LeaveItems.status == 4}">
                                                                                             <td align="center">
                                                                                                <a href="<c:url value="/"/>main/leave/editForm2/${LeaveItems.id}?empId=${profileItem3.id}&start=${profileItem3.startWorking}" class="btn btn-info">Sent again </a>
                                                                                                <a href="<c:url value="/"/>main/leave/delete/${LeaveItems.id}?empId=${profileItem3.id}&start=${profileItem3.startWorking}" class="btn btn-danger"> Delete</a> 
                                                                                                </td>
                                                                                        </c:if>
                                                                                       
                                                                                    </tr>
                                                                                    </tbody>
                                                                                </c:if>
                                                                               

                                                                                </c:if>
                                                                                        
                                                                            </c:forEach>
                                                                            
                                                                        </tbody>
                                                                    </table>
                                                                          </div>
                                                            </div>
                                                                    </c:if>
                                                                
                                                                  
                                                                        
                                                                        <br>
                                                                    <c:if test="${checkPayment2 == 1}">
                                                                      <div class="panel panel-primary">
                                                                    <div class="panel-heading">
                                                                    <h4 class="panel-title">Payment Rejected</h4>
                                                                    </div>  
                                                                             <div class="panel-body">
                                                                    <br>
                                                                    <table class="table table-bordered" id="data_payment${profileItem2.id}" cellspacing="0">                                                                    
                                                                        <thead>
                                                                           <tr class="bg-primary">
                                                                                <th><div align="center">Receipt No.</div></th>
                                                                                <th><div align="center">Date</div></th>
                                                                                <th><div align="center">Description</div></th>
                                                                                <th><div align="center">Amount</div></th>
                                                                                <th><div align="center">Option</div></th>
                                                                            </tr>
                                                                        </thead>
                                                                                  
                                                                        <c:forEach var="paymentItems" items="${paymentList}">
                                                                              <c:if test="${paymentItems.status == 5}">
                                                                            <c:if test="${profileItem2.id == paymentItems.empId}">                                                                                           
                                                                                                                                                                     
                                                                                       <td align="center">${paymentItems.receiptNo}</td>
                                                                                        <td align="center">${paymentItems.date}</td>
                                                                                        <td align="center" style="word-wrap: break-word;">${paymentItems.description}</td>
                                                                                        <td align="center" style="word-wrap: break-word;">${paymentItems.amount}</td>
                                                                                      

                                                                                        <c:if test="${paymentItems.status == 5}">
                                                                                             <td align="center">
                                                                                                <a href="<c:url value="/"/>main/payment/editForm2/${paymentItems.id}?empId=${profileItem2.id}" class="btn btn-info">Sent again </a>
                                                                                                <a href="<c:url value="/"/>main/payment/delete/${paymentItems.id}?empId=${profileItem2.id}"class="btn btn-danger"> Delete</a></td>  
                                                                                                
                                                                                        </c:if>
                                                                                       
                                                                                    </tr>
                                                                                    </tbody>
                                                                                </c:if>
                                                                               

                                                                                </c:if>
                                                                                         
                                                                            </c:forEach>
                                                                            
                                                                        </tbody>
                                                                    </table>
                                                                    </div> 
                                                                      </div>
                                                                    </c:if>
                                                      
                                                    </div></div></div>             
                                                    </div>
                                                </div>
                                            </c:forEach> 
                                        </div>
                                       
            </body>                  
         </c:if>
</c:if>
         
</html> 