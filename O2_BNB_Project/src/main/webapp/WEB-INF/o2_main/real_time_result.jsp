<?xml version="1.0" encoding="UTF-8"?>
<%@page import="o2.data.main_rtime_dto"%>
<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<result>
	<lists>
		<c:forEach var="dto" items="${list}">
			<list>
				<homename>${dto.home_name}</homename>
				<hnum>${dto.h_num}</hnum>
			</list>
		</c:forEach>
	</lists>
</result>