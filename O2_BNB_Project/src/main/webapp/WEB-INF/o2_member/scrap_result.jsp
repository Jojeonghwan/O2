<?xml version="1.0" encoding="UTF-8"?>
<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<result>
	<c:if test="${scrap_result=='1'}">
		<scrap_result>${scrap_result}</scrap_result>
		<sc_num>${sc_num}</sc_num>
	</c:if>
	<c:if test="${scrap_result!='1'}">
		<scrap_result>${scrap_result}</scrap_result>
	</c:if>
</result>