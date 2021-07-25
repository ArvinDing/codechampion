<style>
    body {
        margin: 0;
    }

    .navbar {
        overflow: hidden;
        background-color: rgb(255, 254, 254);
        margin: 0;
        top: 0;
        width: 100%;
        font-family: Arial, Helvetica, sans-serif;
    }

    /*make scrollbar transparent */
    ::-webkit-scrollbar {
        width: 0px;
        background: transparent;
    }

    .container {
        padding: 10px;
        float: left;
        cursor: pointer;
        position: relative;
        z-index: 6;
        width:40px;
    }

   

    .navbar a {
        float: left;
        font-size: 16px;
        color: black;
        text-align: center;
        padding: 20px 20px;
        text-decoration: none;
    }



    .active {
        background-color: #4CAF50;
    }


    .dropdown {
        float: left;
        overflow: hidden;
    }

    .dropdown .dropbtn {
        font-size: 16px;
        border: none;
        outline: none;
        color: white;
        padding: 20px 20px;
        background-color: inherit;
        font-family: inherit;
        margin: 0;
    }


    .navbar a:hover:not(.codechampiontitle),
    .dropdown:hover .dropbtn {
        background-color: rgb(173, 218, 255);
    }

    .dropdown-content e:hover {
        background-color: #ddd;
    }

    .dropdown-content {
        display: none;
        position: absolute;
        background-color: #666666;
        min-width: 160px;
        box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
        z-index: 1;
    }

    .dropdown-content a {
        float: none;
        color: white;
        padding: 20px 20px;
        text-decoration: none;
        display: block;
        text-align: left;
    }

    .bar1,
    .bar2,
    .bar3 {
        width: 35px;
        height: 5px;
        background-color: black;
        margin: 6px 0;
        transition: 0.4s;
    }

    .change .bar1 {
        -webkit-transform: rotate(-45deg) translate(-9px, 6px);
        transform: rotate(-45deg) translate(-9px, 6px);
        background-color: white;

    }

    .change .bar2 {
        opacity: 0;
        background-color: white;

    }

    .change .bar3 {
        -webkit-transform: rotate(45deg)  translate(-9px, -7px);
        transform: rotate(45deg) translate(-9px, -7px);
        background-color: white;

    }

    .dropdown:hover .dropdown-content {
        display: block;
    }


    .sidenav {
        height: 100%;
        width: 0;
        position: fixed;
        z-index: 5;
        top: 0;
        left: 0;
        background-color: #111;
        overflow-x: hidden;
        transition: 0.5s;
        padding-top: 60px;
    }

    .sidenav a {
        padding: 8px 8px 8px 32px;
        text-decoration: none;
        font-size: 24px;
        color: white;
        font-family: "arial";
        display: block;
        transition: 0.3s;
    }
</style>
<div class="navbar" >
    <div style="height:100px; position:relative;">  <img class="logo" src="img/NewLogo.PNG" alt="Code Champion" align="center" width="120px" href="home.html">
        <a class = "codechampiontitle" href="home.html" style="color:#0288bd; font-size:3vw; text-align:center"  id ="word" ><b>Code Champion</b></a>
      </div>
       <div style="height:15px; position:relative;"></div>
        <div class="container" onclick="yell();">
            <div class="bar1"></div>
            <div class="bar2"></div>
            <div class="bar3"></div>
        </div>
        <a class="navLinks" href="home.html">Home</a>
        <a class="navLinks" href="join.html">Join Us</a>
        <a class="navLinks" href="contact.html">Contact Us</a>
        <a class="navLinks" href="about.html">The Team</a>
  
    </div>
</div>

<div id="testSide" class="sidenav">
    <a  href="home.html">Home</a>
    <a  href="join.html">Join Us</a>
    <a  href="contact.html">Contact Us</a>
    <a  href="about.html">The Team</a>
</div>
<script>


    $(function () {
        if (window.innerWidth < 600) {
            $(".navLinks").css("display", "none");
            $("#word").css("font-size", "30px");
            $("#word").css("padding-top", "35px");
            $(".logo").css("width", "80px");
            $(".logo").css("padding-top", "15px");
        } else {
            $(".container").css("display", "none");

        }
        $('body').click(function (evt) {
            if (menuOn && (new Date().getTime() - timeOpen) >= 100) {
                yell();
                change();
            }
        });
    }
    );

   
    var timeOpen;
    var menuOn = false;
    function yell() {
        timeOpen = new Date().getTime();
        menuOn = !menuOn;
        if (!menuOn) {
            document.getElementById("testSide").style.width = "0px";
            $("body").css("opacity", "1");
            $(".container").css("display","block");
            
        } else {
            $(".container").css("display","none");
            $("body").css("opacity", "0.97");
            document.getElementById("testSide").style.width = "250px";
        }
    }
</script>