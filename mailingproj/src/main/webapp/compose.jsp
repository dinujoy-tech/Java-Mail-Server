<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <title>Compose Email</title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }

        h1 {
            text-align: center;
            margin-bottom: 20px;
        }

        /* Styling for the Compose button */
        button {
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            border: none;
            cursor: pointer;
        }

        /* Styling for the pop-up window */
        .popup {
            display: none;
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            width: 400px;
            background-color: #f0f0f0;
            padding: 20px;
            border: 1px solid #ccc;
            box-shadow: 0px 0px 10px #aaa;
            z-index: 9999;
        }

        /* Styling for form elements */
        form {
            margin-top: 10px;
        }

        label {
            display: block;
            margin-bottom: 5px;
        }

        input[type="text"],
        textarea {
            width: 100%;
            padding: 5px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 3px;
        }

        input[type="submit"],
        button[type="button"] {
            background-color: #4CAF50;
            color: white;
            padding: 8px 15px;
            border: none;
            cursor: pointer;
        }

        button[type="button"] {
            background-color: #f44336;
            margin-left: 10px;
        }
    </style>
</head>
<body>
    <h1>Compose Email</h1>
    <button onclick="openComposeWindow()">Compose</button>

    <div id="composePopup" class="popup">
        <h2>New Email</h2>
        <form action="sendmail" method="post">
            <label for="to">To:</label>
            <input type="text" name="to" id="to" required>
            <br>
            <label for="subject">Subject:</label>
            <input type="text" name="subject" id="subject">
            <br>
            <label for="body">Body:</label>
            <textarea name="body" id="body" rows="5"></textarea>
            <br>
            <input type="submit" value="Send">
            <button type="button" onclick="closeComposeWindow()">Cancel</button>
        </form>
    </div>

    <script>
        function openComposeWindow() {
            document.getElementById("composePopup").style.display = "block";
        }

        function closeComposeWindow() {
            document.getElementById("composePopup").style.display = "none";
        }
    </script>
</body>
</html>
