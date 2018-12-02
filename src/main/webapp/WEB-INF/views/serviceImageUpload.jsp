<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page isELIgnored="false" %>


<div id="service-images"></div>

<!-- image1 -->
<form:form id="form1" action="/image/upload" method="POST" enctype="multipart/form-data">
    <input name="serviceId" style="display: none" value="${aService.id}" type="text" />
    <table>
        <tr>
            <!-- TODO: add image preview thumbnail -->
            <td><input type="file" name="file" /></td>
            <td><a href="#" onclick="uploadImg('form1')">Upload Image</a></td>
        </tr>
    </table>
</form:form>

<nav style="padding-top: 1em" aria-label="Page navigation example">
  <ul class="pagination justify-content-center">
    <li class="page-item">
      <a class="page-link" href="${flowExecutionUrl}&_eventId=previous">Previous</a>
    </li>
    <li class="page-item">
      <a class="page-link" href="#" onclick="next()">Next</a>
    </li>
  </ul>
</nav>

<meta name="_csrf" content="${_csrf.token}"/>
<meta name="_csrf_header" content="${_csrf.headerName}"/>

<script type="text/javascript">
uploadImg = (formId) => {
    var formElement = document.getElementById("form1")
    var request = new XMLHttpRequest()
    request.open("POST", "/uploadImg")
    request.onload = (e) => {
        serviceId = document.getElementsByName("serviceId")[0].value
        getServiceImgs(serviceId)
    }
    request.send(new FormData(formElement))
}

getServiceImgs = (serviceId) => {
    csrfToken = document.getElementsByName('_csrf')[0].getAttribute('content')
    csrfHeader = document.getElementsByName('_csrf_header')[0].getAttribute('content')

    request = new XMLHttpRequest()

    request.open("GET", "/getServiceImgs/"+serviceId)
    request.setRequestHeader(csrfHeader, csrfToken)
    request.onload = (e) => {
        console.log(request.responseText)
        arrayOfImgs = JSON.parse(request.responseText)

        imgsDiv = document.getElementById("service-images")
        while (imgsDiv.firstChild) {
            imgsDiv.removeChild(imgsDiv.firstChild);
        }

        arrayOfImgs.forEach((imgUrl) => {
            nxtImg = document.createElement("img")
            nxtImg.setAttribute("src", "/" + imgUrl)
            imgsDiv.appendChild(nxtImg)
        })
    }

    request.send()
}

window.onload = () => {
    serviceId = document.getElementsByName("serviceId")[0].value
    getServiceImgs(serviceId)
}
</script>