<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Page</title>
</head>
<body>
    <h1>상품 등록</h1>
    <form action="" method="post">
        <div class="classification">
            <table class="table">
                <tr>
                    <td>
                        <p>1차 분류</p>
                    </td>
                    <td>
                        <select class="selectOption" name="category">
                            <option value="skincare">skincare</option>
                            <option value="base">base</option>
                            <option value="lip">lip</option>
                            <option value="eye">eye</option>
                            <option value="cheek">cheek</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>
                        <p>상품명</p>
                    </td>
                    <td>
                        <input name="pname" type="text" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <p>상품가격</p>
                    </td>
                    <td>
                        <input name="price" type="number" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <p>상품수량</p>
                    </td>
                    <td>
                        <input name="stock" type="number" />
                    </td>
                </tr>
            </table>
        <div class="main">
            <p>메인 이미지(1장)</p>
            <input type="file" name="mainImage">
            <p>서브 이미지(여러장)</p>
            <input type="file" name="subImage" multiple>
        </div>
        <button type="submit">제출</button>
        <button type="reset">취소</button>
    </form>
</body>
</html>