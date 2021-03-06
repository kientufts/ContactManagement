<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<title>Contact List</title>

<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/style.css" />
</head>

<body>
	<div id="wrapper">
		<div id="header">
			<h2>Contact Management</h2>
		</div>
	</div>

	<div id="container">
		<div id="content">

			<input type="button" value="Add Contact"
				onclick="window.location.href='showFormForAdd'; return false"
				class="add-button" />
				
			<form:form action="search" method="POST">
				Search contact: <input type="text" name="searchName"/>
				<input type="submit" value="Search" class="add-button"/>
			</form:form>

			<table>
				<tr>
					<th>First Name</th>
					<th>Last Name</th>
					<th>Email</th>
					<th>Action</th>
				</tr>

				<c:forEach var="tempContact" items="${contacts}">
					<!-- Create link with contact id -->
					<c:url var="updateLink" value="/contact/showFormForUpdate">
						<c:param name="contactId" value="${tempContact.id}"></c:param>
					</c:url>
					
					<c:url var="deleteLink" value="/contact/delete">
						<c:param name="contactId" value="${tempContact.id}"></c:param>
					</c:url>
					
					<tr>
						<td>${tempContact.firstName}</td>
						<td>${tempContact.lastName}</td>
						<td>${tempContact.email}</td>
						<td>
							<a href="${updateLink}">Update</a>
							|
							<a href="${deleteLink}" onclick="if (!(confirm('Are you sure you want to delete this contact?'))) return false">Delete</a>
						</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
</body>
</html>