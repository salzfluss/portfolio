<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, 
    maximum-scale=1.0, minimum-scale=1.0">

    <link rel="stylesheet" href="/css/customer/pwCheck.css">

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
        integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
        integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
        crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"
        integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI"
        crossorigin="anonymous"></script>
    <title>비밀번호 확인</title>
    <style>
        @import url("https://fonts.googleapis.com/css2?family=Josefin+Sans:wght@100&display=swap");
        @import url("https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap");
        * {
        margin: 0;
        padding: 0;
        font-family: "Josefin Sans", sans-serif;
        }
        /* 화살표 제거 */
        .dropdown-toggle::after {
            border: none;
        }

        /* 마우스오버시 팝업 */
        .dropdown:hover .dropdown-content {
            display: block;
            /* 팝업메뉴가 닫히지 않도록 */
            margin-top: 0;
        }

        .main {
            padding: 15px;
        }

        table {
            width: 400px;
        }

        table tr:nth-child(1) {
            background-color: #e0baba;
            color: #fff;
            font-weight: bold;
            height: 50px;
        }

        table tr:nth-child(1) td {
            padding-left: 10px;
        }

        table tr:nth-child(2) td {
            font-size: 12px;
            padding-top: 20px;
        }

        table tr:nth-child(3) {
            height: 80px;
            background-color: #fff1f1;
        }

        table tr:nth-child(3) img {
            padding-left: 10px;
        }

        input[type="text"] {
            height: 20px;
            text-align: left;
            font-size: 12px;
        }

        div div:nth-child(2) {
            text-align: center;
            padding-top: 10px;
            padding-bottom: 20px;
        }

        div div:nth-child(3) {
            text-align: right;
            background-color: #fff8f8;
        }

        .em {
            width: 200px;
        }

        #qna_submit {
            width: 50px;
            height: 30px;
            border-radius: 2px;

            border: 1px solid #eec3c3;
            background-color: #eec3c3;

            font-size: 13px;
        }

        #qna_cancel {
            width: 50px;
            height: 20px;
            border-radius: 2px;

            margin-left: 10px;
            padding-top: 4px;
            border: 1px solid #e6d6d6;
            background-color: #f8eeee;

            font-size: 10px;
        }
    </style>
</head>

<body>
    <form method="post" action="" name="frm">
        <div class="main">
            <table>
                <tr>
                    <td colspan="2">비밀번호입력</td>
                </tr>
                <tr>
                    <td colspan="2">글 작성시 입력한 비밀번호를 입력하세요.</td>
                </tr>
                <tr>
                    <td style="width: 20%; padding-left: 15px; font-size: 13px;">비밀번호</td>
                    <td style="width: 80%;">
                        <input type="password" name="items_qna_password" style="border: solid 1px #bebebe;">
                        <input type="hidden" name="item_idx" value=${ dto.item_idx }>
                        <input type="hidden" name="items_qna_idx" value=${ items_qna_dto.items_qna_idx }>
                    </td>

                </tr>

            </table>
            <div style="width: 400px;">
                <button type="submit" id="qna_submit" formaction="itemQnAview" onclick="popup_close()">확인</button>
            </div>
            <div style="width: 400px;">
                
                    <button id="qna_cancel"  onClick='window.close()'>X 닫기</button>
                
            </div>
        </div>
    </form>

    <script type="text/javascript">

        function popup_close() {
            opener.name = "parent";
            document.frm.method = "post";
            document.frm.action = "itemQnAview";
            document.frm.target = opener.window.name;
            document.frm.submit();
            window.open("about:blank", "_self").close();
        }

    </script>

</body>

</html>