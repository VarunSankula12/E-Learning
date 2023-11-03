<%@ page import="java.util.Arrays" %>
<jsp:useBean id="quizBean" class="" scope="request" />
<%
    int numQuestions = Integer.parseInt(request.getParameter("numQuestions"));
    String[] answers = new String[numQuestions];
    for (int i = 0; i < numQuestions; i++) {
        String questionName = "question" + (i + 1);
        answers[i] = request.getParameter(questionName);
    }
    quizBean.setAnswers(answers);
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Quiz Form Results</title>
</head>
<body>
    <h1>Quiz Form Results</h1>
    <p>Answers: <%= Arrays.toString(quizBean.getAnswers()) %></p>
</body>
</html>
