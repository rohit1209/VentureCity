<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="https://apis.google.com/js/platform.js" async defer></script>

<meta name="google-signin-scope" content="profile email">
<meta name="google-signin-client_id"
     content="215667000062-u9i9c8t37keq6o37q7dt1u8gcq1a9rhp.apps.googleusercontent.com">

<title>Servlet OAuth example</title>

<style type="text/css">
.main{
width: 800px;
height: 600px;
border-radius:1px solid black;

margin: auto;
}
.header{
width: 800px;
height: 150px;
border-radius:1px solid black;

}
</style>

</head>
<body>
<div class="main">
<div class="header">
<img alt="" src="Venture-City-Page-Header.jpg" style="width: 800px; height: 150px;">
</div>
<div class="main_body">

	<br>
	<div class="g-signin2" style="margin-left: 300px;" data-onsuccess="onSignIn" ></div>

  <script>
      //google callback. This function will redirect to our login servlet
      function onSignIn(googleUser) {
         var profile = googleUser.getBasicProfile();
         console.log('ID: ' + profile.getId());
         console.log('Name: ' + profile.getName());
         console.log('Image URL: ' + profile.getImageUrl());
         console.log('Email: ' + profile.getEmail());
         console.log('id_token: ' + googleUser.getAuthResponse().id_token);

         //do not post all above info to the server because that is not secure.
         //just send the id_token

         

         //using jquery to post data dynamically
         var form = $('<form action="/login" method="post">' +
                          '<input type="text" name="id_token" value="' +
                           googleUser.getAuthResponse().id_token + '" />' +
                                                                '</form>');
         $('body').append(form);
         form.submit();
      }

   </script>
   <form action="login" method="post">' +
                          '<input type="text" name="id_token" value="' +
                           googleUser.getAuthResponse().id_token + '" />' +
                                                                '</form>
</div>
</div>
</body>
</html>