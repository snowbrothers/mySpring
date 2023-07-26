<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Bulletin Board Detail Page</title>
    <style>
        /* Add your CSS styles here */

        /* Example styles for demonstration purposes */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }

        .header {
            /* Styles for the upper part */
            background-color: #f1f1f1;
            padding: 20px;
            text-align: center;
        }

        .material {
            /* Styles for the material part */
            background-color: #fff;
            padding: 20px;
        }

        .cooking-order {
            /* Styles for the cooking order part */
            background-color: #f9f9f9;
            padding: 20px;
        }

        .cooking-review {
            /* Styles for the cooking review part */
            background-color: #f1f1f1;
            padding: 20px;
        }

        .recently-viewed {
            /* Styles for the recently viewed section */
            background-color: #fff;
            padding: 20px;
        }

        /* Example styles for photo review section */
        .photo-review {
            /* Styles for the photo review part */
            background-color: #f9f9f9;
            padding: 20px;
        }

        .photo-review img {
            /* Styles for displaying images in photo review */
            max-width: 100%;
            height: auto;
            display: block;
            margin: 10px auto;
        }

        /* Example styles for general comment section */
        .general-comment {
            /* Styles for the general comment part */
            background-color: #fff;
            padding: 20px;
        }

        /* Example styles for comment writing section */
        .comment-writing {
            /* Styles for the comment writing part */
            background-color: #f9f9f9;
            padding: 20px;
        }
    </style>
</head>
<body>
    <!-- 상단 -->
    <div class="header">
        <!-- Insert representative photo here -->
        
        <h1>${board.title }</h1>
        
        <p>${board.intro }</p>
    </div>

    <!-- 재료 -->
    <div class="material">
        <!-- Add information about materials, required quantity, etc. here -->
    </div>

    <!-- 조리 순서 -->
    <div class="cooking-order">
        <!-- Add cooking order details here -->
    </div>

    <!-- 요리후기  -->
    <div class="cooking-review">
        <!-- 포토리뷰 -->
        <div class="photo-review">
            <!-- Display only images here -->
            <img src="path/to/image1.jpg" alt="Review Image 1">
            <img src="path/to/image2.jpg" alt="Review Image 2">
            <!-- Add more images if needed -->
        </div>

        <!-- 일반 요리 후기 -->
        <div class="general-comment">
           		
        </div>

        <!-- 댓글 작성 부분, 사진 첨부 추가 -->
        <div class="comment-writing">
            <!-- Add comment writing form here -->
        </div>
    </div>

    <!-- 최근 방문한 레시피 -->
    <div class="recently-viewed">
        <!-- Display recently viewed recipes as clickable images -->
        <a href="link-to-recipe1"><img src="path/to/recipe1.jpg" alt="Recipe 1"></a>
        <a href="link-to-recipe2"><img src="path/to/recipe2.jpg" alt="Recipe 2"></a>
        <!-- Add more recently viewed recipes if needed -->
    </div>
</body>
</html>
