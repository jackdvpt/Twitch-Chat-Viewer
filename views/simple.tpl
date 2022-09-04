<html><head>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@900&amp;family=Work+Sans&amp;display=swap" rel="stylesheet">
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
    <style>
        .show-more,
.show-less {
  font-size: 13px;
  line-height: 140%;
  background-color: rgba(120, 120, 200, 0.5);
  display: inline-block;
  cursor: pointer;
}

.hidden {
  display: none;
}


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
        
        iframe{
            width:100%
        }
        #vid{
            width:50%
        }
        #block_container
{
    text-align:center;
}
#piechart, #vid
{
    display:inline;
}
    </style>
</head>

<body style=" background-color: #18181b;">
    <form method="post" action="/list">
    
    <legend style="font-family: 'Montserrat', sans-serif; color:white; font-size: 100px">SEARCH FOR A CHANNELS NAME</legend>
<input type="text" name="first" style="  width: 80%;  padding: 12px 20px;  font-size: 24px;font-family: 'Work Sans', sans-serif;    font-weight: 600;  ">
       
  <input type="submit" value="SEARCH" style="background-color: purple;border: none;color: white;text-decoration: none;cursor: pointer;width: 19%;padding-top: 6px;padding-bottom: 14px;font-family: 'Work Sans', sans-serif;font-weight: bold;font-size: 34px;">
</form>
<div id="block_container">
    <div id="piechart" style="width: 900px; height: 500px;"></div>

    <script src= "https://player.twitch.tv/js/embed/v1.js"></script>
<div id="vid"></div>
<script type="text/javascript">
  var options = {
    width: 1200,
    height: 720,
    autoplay:false,
    video: "{{id_real}}",
    // only needed if your site is also embedded on embed.example.com and othersite.example.com
  };
  var player = new Twitch.Player("vid", options);
</script>
</div>
    <ul class="nav-menu">
% for n in title:
<li class="nav-menu" >
<input type="checkbox" name="chk" value="{{n[0]}}" checked> <div class="person" style="color: {{n[1]}}">{{n[0]}}</div> <div id="count">{{n[2]}} / {{total}} </div> </li>
%end

</ul>


<div class='show-more'>SHOW MORE>></div>
<div class='show-less hidden'> SHOW LESS</div>

<script>
    $('.show-more').on('click', function() {
  $('.nav-menu li:gt(3)').show();
  $('.show-less').removeClass('hidden');
  $('.show-more').addClass('hidden');
  Logger.log("CUM")
});

$('.show-less').on('click', function() {
  $('.nav-menu li:gt(3)').hide();
  $('.show-more').removeClass('hidden');
  $('.show-less').addClass('hidden');
});

//Show only four items


    console.log( "ready!" );
    if ($('.nav-menu li').length > 5) {
  $('.nav-menu li:gt(3)').hide();
  $('.show-more').removeClass('hidden');
  

  $('.show-less').click();
}

</script>
<ul>
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