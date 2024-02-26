<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.css" type="text/css">
    <title>シンプル掲示板</title>
</head>
<body>
    <h2>記事を投稿する</h2>

    <div class="form">
        <form action="post.jsp" method="POST" > <%--enctype="multipart/form-data"--%>
            <p>投稿者:<input type="text" name="author"></p>
            <p>記事名: <input type="text" name="postname"></p>
            <p>内容: <textarea name="posttext" id="" cols="100" rows="10"></textarea></p>
            <%--<p>画像をアップロード: <input type="file" name="image"></p>
            <p>音声ファイルをアップロード: <input type="file" name="audio"></p>--%>
            <input type="submit" value="投稿する">
        </form>
    </div>

    <hr>

    <h2>投稿された記事</h2>
    <%
    //投稿された記事があれば表示する
    ArrayList<String[]> posts = (ArrayList<String[]>) application.getAttribute("posts");
    if(posts == null){
        posts = new ArrayList<>();
        application.setAttribute("posts",posts);
    }
    %>

    <div class="posts">
        <%
        for(int i=posts.size()-1;i>=0; i--){
            String[] post = posts.get(i);
        %>
         <section>
            <p class="name"><%=post[0] %></p>
            <p class="text"><%=post[1] %></p>
            <p class="text">投稿日:<%=post[2] %></p>
            <p class="text">投稿者:<%=post[3] %></p>
            
        </section>
        <%
        }
        %>
        <%--<section>
            <p class="name">サンプル太郎</p>
            <p class="text">テキストが入ります。テキストが入ります。
        </section>--%>
    </div>
</body>
</html>
