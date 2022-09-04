<html><head>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

    <script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {

        var data = google.visualization.arrayToDataTable([
          ['Task', 'Hours per Day'],
          % for n in title:
 ['{{n[0]}}',     {{n[2]}}],
%end
        ]);

        var options = {
          title: 'My Daily Activities'
        };

        var chart = new google.visualization.PieChart(document.getElementById('piechart'));

        chart.draw(data, options);
      }
    </script>


 <script src=
"https://code.jquery.com/jquery-1.12.4.min.js">
    </script>
        <script type="text/javascript">  
            function selects(){  
                var ele=document.getElementsByName('chk');  
                for(var i=0; i<ele.length; i++){  
                    if(ele[i].type=='checkbox')  
                        ele[i].checked=true;  
                }  
            }  
            function deSelect(){  
                var ele=document.getElementsByName('chk');  
                for(var i=0; i<ele.length; i++){  
                    if(ele[i].type=='checkbox')  {
                        ele[i].checked=false; 
                    }
                         
                      
                }  
            }             
        </script>  

        <script>
        
                $(document).ready(function() {
                $('input[type="checkbox"]').click(function() {
                    var inputValue = $(this).attr("value");
                    $("." + inputValue).toggle();
                });
            });
        </script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="preconnect" href="https://fonts.googleapis.com/">
    <link rel="preconnect" href="https://fonts.gstatic.com/" crossorigin="">
    <link href="./pantsmaners.github.io_files/css2" rel="stylesheet">
    <style>
    div#count {
    color: white;
    display: inline;
    font-family: 'Inter', sans-serif;
}
        .message {
            color: #dedee3;
            font-family: 'Inter', sans-serif;
            display: inline;
        }

        .person {
            font-family: 'Inter', sans-serif;
            display: inline;
            font-weight: 700;
        }
        ul{list-style-type: none;}
        li{
            padding-top:  4px;
            padding-bottom: 4px;
            font-size:18px;
        }
        
    </style>
</head>

<body style=" background-color: #18181b;">
    <form method="post" action="/list">
        <fieldset>
            <legend>SAMPLE FORM</legend>
            <ul>
                <li><div class="message">type in a channel name here </div><input name='first'>
                </li>
            </ul><input type='submit' value='Submit Form'>
        </fieldset>
    </form>
    
    <div id="piechart" style="width: 900px; height: 500px;"></div>

    <ul>
% for n in title:
<li>
<input type="checkbox" name="chk" value="{{n[0]}}" checked> <div class="person" style="color: {{n[1]}}">{{n[0]}}</div> <div id="count">{{n[2]}} / {{total}} </div> </li>
%end

<li><div class="message">NOW FOR THE CHAT!</div></li>
         % for c in content:
<li class="{{c[1]}}">
<a href = "https://www.twitch.tv/videos/{{id}}?t={{c[0]}}" target="_blank"><span class="material-symbols-outlined" style="
    color: coral;
    font-size:18px;
">
subdirectory_arrow_right
</span></a> {{!c[4]}}
                     <div class="person" style="color: {{c[3]}}">{{c[1]}}<span id="colon">:</span></div>
            <div class="message">{{!c[2]}}</div>
        </li> 
     % end
        
              
       
    </ul>



</body></html>