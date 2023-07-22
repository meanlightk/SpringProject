<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />

<title>클레임 관리 게시판</title>
<style>
.w3-container {
  padding: 0.01em 16px;
}

.w3-container:after,
.w3-container:before,
.w3-panel:after,
.w3-panel:before,
.w3-row:after,
.w3-row:before,
.w3-row-padding:after,
.w3-row-padding:before,
.w3-cell-row:before,
.w3-cell-row:after,
.w3-topnav:after,
.w3-topnav:before,
.w3-clear:after,
.w3-clear:before,
.w3-btn-group:before,
.w3-btn-group:after,
.w3-btn-bar:before,
.w3-btn-bar:after,
.w3-bar:before,
.w3-bar:after {
  content: "";
  display: table;
  clear: both;
}

.w3-responsive {
  overflow-x: auto;
}

.w3-table,
.w3-table-all {
  border-collapse: collapse;
  border-spacing: 0;
  width: 100%;
  display: table;
}

.w3-table-all {
  border: 1px solid #ccc;
}

.w3-bordered tr,
.w3-table-all tr {
  border-bottom: 1px solid #ddd;
}

.w3-table-all tr:nth-child(odd) {
  background-color: #fff;
}

.w3-table-all tr:nth-child(even) {
  background-color: #f1f1f1;
}

.w3-table td,
.w3-table th,
.w3-table-all td,
.w3-table-all th {
  padding: 8px 8px;
  display: table-cell;
  text-align: left;
  vertical-align: top;
}

.w3-table th:first-child,
.w3-table td:first-child,
.w3-table-all th:first-child,
.w3-table-all td:first-child {
  padding-left: 16px;
}

.w3-center {
  text-align: center !important;
}

.w3-center .w3-bar {
  display: inline-block;
  width: auto;
}

.w3-bar-block .w3-center .w3-bar-item {
  text-align: center;
}

.w3-pagination {
  display: inline-block;
  padding: 0;
  margin: 0;
}

.w3-pagination li {
  display: inline;
}

.w3-pagination li a {
  text-decoration: none;
  color: #000;
  float: left;
  padding: 8px 16px;
}

.w3-pagination li a:hover {
  background-color: #ccc;
}

.w3-btn,
.w3-btn-floating,
.w3-dropnav a,
.w3-btn-floating-large,
.w3-btn-block,
.w3-navbar a,
.w3-navblock a,
.w3-sidenav a,
.w3-pagination li a,
.w3-hoverable tbody tr,
.w3-hoverable li,
.w3-accordion-content a,
.w3-dropdown-content a,
.w3-dropdown-click:hover,
.w3-dropdown-hover:hover,
.w3-opennav,
.w3-closenav,
.w3-closebtn,
*[class*="w3-hover-"] {
  -webkit-transition: background-color 0.25s, color 0.15s, box-shadow 0.25s,
    opacity 0.25s, filter 0.25s, border 0.15s;
  transition: background-color 0.25s, color 0.15s, box-shadow 0.15s,
    opacity 0.25s, filter 0.25s, border 0.15s;
}

.w3-green,
.w3-hover-green:hover {
  color: #fff !important;
  background-color: #4caf50 !important;
}
</style>
</head>
<body>
  <div class="w3-container">
    <h2>테스트 게시판</h2>
    <div class="w3-responsive">
      <table class="w3-table-all">
        <tr>
          <th>번호</th>
          <th>글 제목</th>
          <th>작성일</th>
          <th>작성자</th>
          <th>조회수</th>
        </tr>
        <tr>
          <td>3</td>
          <td>테스트3</td>
          <td>2017.01.10</td>
          <td>김대성</td>
          <td>50</td>
        </tr>
        <tr>
          <td>2</td>
          <td>테스트2</td>
          <td>2017.01.10</td>
          <td>김대성</td>
          <td>50</td>
        </tr>
        <tr>
          <td>1</td>
          <td>테스트1</td>
          <td>2017.01.10</td>
          <td>김대성</td>
          <td>50</td>
        </tr>
      </table>
    </div>

    <br />

    <div class="w3-center">
      <ul class="w3-pagination">
        <li><a href="#">&laquo;</a></li>
        <li><a class="w3-green" href="#">1</a></li>
        <li><a href="#">2</a></li>
        <li><a href="#">3</a></li>
        <li><a href="#">4</a></li>
        <li><a href="#">5</a></li>
        <li><a href="#">&raquo;</a></li>
      </ul>
    </div>
  </div>
  
<!-- 
w3-container

w3-responsive

w3-table-all

w3-center

w3-pagination

w3-green
   -->
  
</body>
</html>
