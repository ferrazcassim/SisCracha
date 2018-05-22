<!doctype html>
<html lang="en">
<head>
	<meta charset="utf-8" />
	<link rel="icon" type="image/png" href="assets/img/favicon.ico">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

	<title>SisCrachá</title>

	<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
    <meta name="viewport" content="width=device-width" />

    <!-- Bootstrap core CSS     -->
    <link href="assets/css/bootstrap.min.css" rel="stylesheet" />

    <!-- Animation library for notifications   -->
    <link href="assets/css/animate.min.css" rel="stylesheet"/>

    <!--  Light Bootstrap Table core CSS    -->
    <link href="assets/css/light-bootstrap-dashboard.css?v=1.4.0" rel="stylesheet"/>

    <!--  CSS for Demo Purpose, don't include it in your project     -->
    <link href="assets/css/demo.css" rel="stylesheet" />

    <link href="assets/css/main.css" rel="stylesheet" />
    <link href="assets/css/alertify.css" rel="stylesheet" />

    <!--     Fonts and icons     -->
    <link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
    <link href='http://fonts.googleapis.com/css?family=Roboto:400,700,300' rel='stylesheet' type='text/css'>
    <link href="assets/css/pe-icon-7-stroke.css" rel="stylesheet" />
    <script src="https://code.jquery.com/jquery-3.2.1.min.js" integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4=" crossorigin="anonymous"></script>
    <link href="assets/css/more.css" rel="stylesheet" />
    <link href="assets/css/bootstrap-datepicker.min.css" rel="stylesheet" />
    <!-- <script src="assets/js/ajaxhome.js"></script> -->
    <script src="assets/js/vue.js"></script>
    <script src="assets/js/vue-router.js"></script>
    <script src="assets/js/vuex.js"></script>
    <script src="assets/js/vue-resource.js"></script>
    <script src="assets/js/alertify.js"></script>
    <script src="assets/js/bootstrap-datepicker.min.js"></script>
    <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/vuejs-paginator/2.0.2/vuejs-paginator.js"></script>
	<!-- <script src="assets/js/darkroom.js"></script>
	<script src="assets/css/darkroom.css"></script> -->
	<!-- <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script> -->
    <script src="assets/js/verificaLogin.js"></script>  
    <script src="assets/js/getCookies.js"></script>  
</head>
<body>

<div class="wrapper">
    <div class="sidebar" data-color="azure" data-image="assets/img/sidebar-5.jpg">
        <!--
        Tip 1: you can change the color of the sidebar using: data-color="blue | azure | green | orange | red | purple"
        Tip 2: you can also add an image using data-image tag
        -->
        <div class="sidebar-wrapper">
            <div class="logo">
                <a href="default.asp" class="simple-text">
                    <span class="pe-7s-keypad"></span> SisCrachá
                </a>
                 <div class="boxUser">
                <div class="clear-fix" style="height:10px;"></div>

                <img src="" class="imgUser">

                <div class="clear-fix" style="height:10px;"></div>

                <b><span class="nomeUsuario"> 
                </span><b>

                <div class="clear-fix"></div>

                <small><span class="nomeCompleto"> 
                </span></small>

                 <div class="clear-fix" style="height:10px;"></div>
                 
                    <a href="login.asp" class="btn btn-primary btnSair">
                        <span class="pe-7s-repeat"></span>
                        SAIR
                    </a>
               

            </div>
            </div>   

            <!--LISTA CONTENDO AS OPÇOES EM COMUM PARA TODOS OS USUARIOS-->
            <ul class="nav">
                 <li class="active">
                    <a href="default.asp">
                        <i class="pe-7s-graph"></i>
                        <p>INÍCIO</p>
                    </a>
                </li>
            </ul>
            <!--FIM LISTA TODOS OS USUARIOS-->


            <!--LISTA DOS ITENS RH-->
            <ul class="nav moduloRH">            
                 
                <li>
                    <a href="pedidos_rh.asp">
                        <i class="pe-7s-users"></i>
                        <p>Pedidos RH</p>
                    </a>
                </li>
            
            </ul>
            <!--FIM LISTA RH-->

         <ul class="nav moduloSerac">
                   <li>
                    <a href="aluno.asp">
                        <i class="pe-7s-add-user"></i>
                        <p>Adicionar Pedido Aluno</p>
                    </a>
                </li>
            </ul>


            <ul class="nav moduloGerencia">
               <li>
                    <a href="pedidos.asp">
                        <i class="pe-7s-cloud-download"></i>
                        <p>Finalizar Pedidos</p>
                    </a>
                </li>
                <li>
                    <a href="finalizados.asp">
                        <i class="pe-7s-ticket"></i>
                        <p>Finalizados</p>
                    </a>
                </li>                   
            </ul>
               
             
             
 

         

           
        </div>       
    </div>

<div class="main-panel">
<nav class="navbar navbar-default navbar-fixed  text-uppercase">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navigation-example-2">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand top-nav-title" href="default.asp">INÍCIO</a>
        </div>
        <div class="collapse navbar-collapse">
            <ul class="nav navbar-nav navbar-left">
                <li>
                    <a href="">
                        <i class="pe-7s-refresh" style="font-weight: bolder; font-size: 1.2em;"></i>
                        <p class="hidden-lg hidden-md"></p>
                    </a>
                </li>

            </ul>
            <!--ul class="nav navbar-nav navbar-right">
              <li class="separator hidden-lg"></li>
                 <li>
                    <a href="login.asp" class="btn btn-info btn-sair">
                        <span class="pe-7s-repeat"></span>
                        SAIR
                    </a>
                </li>
                <li class="separator hidden-lg"></li>
            </ul-->
        </div>
    </div>
</nav>
