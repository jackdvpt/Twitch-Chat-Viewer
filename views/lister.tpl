<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@900&family=Work+Sans&display=swap"
        rel="stylesheet">

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Cabin&family=Space+Mono:ital,wght@1,700&display=swap"
        rel="stylesheet">

    <style>
        <style>.card-title {
            font-family: 'Roboto Slab', serif;
            font-size: 20px;
        }

        * {
            box-sizing: border-box;
        }

        body {
            font-family: Arial, Helvetica, sans-serif;
            margin: 0px;
        }

        /* Float four columns side by side */
        .column {
            float: left;
            width: 25%;
            padding: 0 10px 15px 10px;

            padding-bottom: 100px;
        }

        /* Remove extra left and right margins, due to padding */
        .row {
            margin: 0 -5px;
        }

        /* Clear floats after the columns */
        .row:after {
            content: "";
            display: table;
            clear: both;
        }

        /* Responsive columns */
        @media screen and (max-width: 600px) {
            .column {
                width: 100%;
                display: block;
                margin-bottom: 20px;
                padding-bottom: 0px
            }
        }

        @media screen and (min-width: 601px) {
            .card {
                height: 300px;
            }
        }

        h4 {
            margin: 15px;
            font-family: 'Cabin', sans-serif;

        }

        /* Style the counter cards */
        .card {
            box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
            text-align: center;
        }

        p {
            font-size: 18px;
            font-family: 'Space Mono', monospace;

        }

        img {
            border-radius: 5px 5px 0 0;
        }

        a {
            text-decoration: none;
        }

        .container {
            color: coral;
            text-decoration: none;
            background-color: floralwhite;
            font-family: 'Roboto', sans-serif;
            font-size: 18px;
            padding: 3px;
        }

        .intro {
            padding-left: 25px;
            padding-right: 25px;
        }

        .myDIV {
            margin-left: 15px;
            margin-right: 15px;
        }
    </style>

    </style>
</head>

<body style=" background-color: #18181b;">
    <form method="post" action="/list">

        <legend style="font-family: 'Montserrat', sans-serif; color:white; font-size: 100px">{{person}}</legend>
        <input type="text" value="{{person}}" name="first"
            style="  width: 80%;  padding: 12px 20px;  font-size: 24px;font-family: 'Work Sans', sans-serif;    font-weight: 600;  ">

        <input type="submit" value="SEARCH"
            style="background-color: purple;border: none;color: white;text-decoration: none;cursor: pointer;width: 19%;padding-top: 6px;padding-bottom: 14px;font-family: 'Work Sans', sans-serif;font-weight: bold;font-size: 34px;">
    </form>

    %for blah in title:

    % thumb = blah["thumbnail_url"]
    % thumb = thumb.replace("%{width}", "1200")
    % thumb = thumb.replace("%{height}", "720")

    <div class="column">
        <a href="/vod/{{blah["id"]}}">
            <div class="card"><img src="{{thumb}}" style="width:100%">
                <div class="container">
                    <h4 class="card-title"><b>{{blah["title"]}}</b></h4>


                    <script>
                        console.log("hello")

                        //function from https://stackoverflow.com/a/25275808

                        function formatDate(date) {
                            var hours = date.getHours();
                            var minutes = date.getMinutes();
                            var ampm = hours >= 12 ? 'pm' : 'am';
                            hours = hours % 12;
                            hours = hours ? hours : 12; // the hour '0' should be '12'
                            minutes = minutes < 10 ? '0' + minutes : minutes;
                            var strTime = hours + ':' + minutes + ' ' + ampm;
                            return date.getDate() + "/" + (date.getMonth() + 1) + "/" + date.getFullYear() + "  " +
                                strTime;
                        }
                        var d = new Date("{{blah['created_at']}}")
                        console.log(d);
                        var div = document.createElement('p'), // Create a new div
                            script = document.scripts[document.scripts.length -
                            1]; // A reference to the currently running script

                        div.innerHTML = formatDate(d) +
                        ' | {{blah["duration"]}}'; // Add some content to the newly-created div
                        script.parentElement.insertBefore(div, script); // Add the newly-created div to the page
                    </script>
                </div>
            </div>
        </a></div>
    %end


</body>

</html>