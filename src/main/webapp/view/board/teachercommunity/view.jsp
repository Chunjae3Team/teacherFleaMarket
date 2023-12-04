<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>TEACHER MARKET</title>

</head>
<body>
<header>

  <jsp:include page="${contextPath}/view/common/header.jsp"></jsp:include>

</header>

<h2>게시글 상세 보기(View)</h2>

<table border="1" width="90%">
  <colgroup>
    <col width="15%"/> <col width="35%"/>
    <col width="15%"/> <col width="*"/>
  </colgroup>

  <!-- 게시글 정보 -->
  <tr>
    <td>번호</td> <td>${ dto.brdId }</td>
    <td>작성자</td> <td>${ dto.userId }</td>
  </tr>
  <tr>
    <td>작성일</td> <td>${ dto.regDate }</td>
    <td>조회수</td> <td>${ dto.viewCnt }</td>
  </tr>
  <tr>
    <td>제목</td>
    <td colspan="3">${ dto.title }</td>
  </tr>
  <tr>
    <td>내용</td>
    <td colspan="3" height="100">
      ${ dto.content }
      <c:if test="${ not empty dto.ofile and isImage eq true }">
        <br><img src="../Uploads/${ dto.sfile }" style="max-width:100%;"/>
      </c:if>
    </td>
  </tr>

  <!-- 첨부파일 -->
  <tr>
    <td>첨부파일</td>
    <td>
      <c:if test="${ not empty dto.ofile }">
        ${ dto.ofile }
<%--                <a href="/teachercommunity/download.do?ofile=${ dto.ofile }&sfile=${ dto.sfile }&idx=${ dto.brdId }">--%>
<%--                  [다운로드]--%>
<%--                </a>--%>
      </c:if>
    </td>
  </tr>

  <!-- 하단 메뉴(버튼) -->
  <tr>
    <td colspan="4" align="center">
      <c:set var="userId" value="${ userId }" />
      <c:set var="dtouserId" value="${ dto.userId }" />
      <%
        String userId = (String)request.getSession().getAttribute("userId");
      %>
      <c:choose>
        <c:when test="${ dtouserId eq userId }">
          <button type="button" onclick="location.href='${contextPath}/teachercommunity/pass.do?mode=edit&brdId=${ param.brdId }';">
            수정하기
          </button>
          <button type="button" onclick="location.href='${contextPath}/teachercommunity/pass.do?mode=delete&brdId=${ param.brdId }';">
            삭제하기
          </button>
          <button type="button" onclick="location.href='${contextPath}/teachercommunity/list.do?cateSub=${ map.cateSub }';">
            목록 바로가기
          </button>
        </c:when>
        <c:otherwise>
          <button type="button"><a href="#">신고하기</a></button>
          <button type="button" onclick="location.href='${contextPath}/teachercommunity/list.do?cateSub=${ map.cateSub }';">
            목록 바로가기
          </button>
        </c:otherwise>
      </c:choose>
<%--        </c:otherwise>--%>
<%--      </c:choose>--%>
<%--            <button type="button" onclick="location.href='${contextPath}/teachercommunity/pass.do?mode=edit&brdId=${ param.brdId }';">--%>
<%--              수정하기--%>
<%--            </button>--%>
<%--            <button type="button" onclick="location.href='${contextPath}/teachercommunity/pass.do?mode=delete&brdId=${ param.brdId }';">--%>
<%--              삭제하기--%>
<%--            </button>--%>
<%--&lt;%&ndash;            <input type="hidden" name="cateSub" value="${ map.cateSub }" />&ndash;%&gt;--%>
<%--            <button type="button"><a href="#">신고하기</a></button>--%>
<%--            <button type="button" onclick="location.href='${contextPath}/teachercommunity/list.do?cateSub=${ map.cateSub }';">--%>
<%--              목록 바로가기--%>
<%--            </button>--%>
    </td>
  </tr>
</table>
</body>
</html>

