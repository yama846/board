<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>記事詳細</title>
</head>
<body>
    <%
    String author = request.getParameter("author");
    String postname = request.getParameter("postname");
    String posttext = request.getParameter("posttext");
    String IPaddress = request.getRemoteAddr();//IPアドレスを取得
    String host = request.getRemoteHost();//クライアント名
    String User = request.getRemoteUser();//リモートユーザー名
    String UserHeader = request.getHeader("User-Agent");//アクセスしているブラウザを取得
    String error = ""; // エラーメッセージの初期化
    Date datetime = new Date();
    SimpleDateFormat format_date = new SimpleDateFormat("yyyy/MM/dd/ HH:mm:ss");
    String formated_date = format_date.format(datetime);
    String[] postDatas = new String[]{postname,posttext,formated_date,author};
    //postnameまたはposttextが空かチェック
    if(postname.isEmpty()|| posttext.isEmpty()){
         error = "記事名か内容のどちらかが入力されていません";
    }else{
         

         //記事の処理                        
        ArrayList<String[]> posts = (ArrayList<String[]>) application.getAttribute("posts");
        //実際にはデータベースで処理するコード、今回は学習のためpcに保存する
        if(posts == null){
        posts = new ArrayList<>();
        }
        posts.add(postDatas);//トピック情報をリストに追加
        application.setAttribute("posts",posts);//更新されたリストをアプリケーションスコープに保存
        error = "記事が投稿されました";//成功メッセージ

    }
        request.setAttribute("errorMessage", error);
    %>
    
    <p><%=host %></p>
    <p><%=IPaddress %></p>
    <p><%=User %></p>
    <p><%=UserHeader %></p>
   

    

    <% if(!"".equals(error)) { %>
        <h2><%=error %></h2>
    <% } %>
    <a href ="index.jsp">記事一覧に戻る</a>
    <p><%=formated_date %></p>
</body>
</html>