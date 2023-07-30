<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>score demo</title>
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <script src="https://cdn.jsdelivr.net/gh/hiphop5782/score@latest/score.js"></script>
    <script>
        $(function(){
            $(".test-score1").score();
           
        });
    </script>
</head>
<body>
    <div class="test-score1" data-max="5" data-rate="4.5"></div>
    <hr>
   
</body>
</html>