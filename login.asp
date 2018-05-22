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




    <!--     Fonts and icons     -->
    <link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
    <link href='http://fonts.googleapis.com/css?family=Roboto:400,700,300' rel='stylesheet' type='text/css'>
    <link href="assets/css/pe-icon-7-stroke.css" rel="stylesheet" />
    <script src="https://code.jquery.com/jquery-3.2.1.min.js" integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4=" crossorigin="anonymous"></script>
    <!-- <script src="assets/js/ajaxhome.js"></script> -->
    <script src="assets/js/vue.js"></script>
    <script src="assets/js/vuex.js"></script>
    <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
    <script src="assets/js/login.js"></script>
    
    <style>
        body {
            background: url('assets/img/bg.jpg');
            background-repeat: no-repeat;
            background-size: 100%;
        }
    </style>
</head>
<body>
<div class="login">
    <div class="content">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-4 col-md-offset-4">
                    <div class="spacer-full"></div>
                    <div class="spacer-full"></div>
                    <div class="card">
                        <div class="header text-center">
                            <h2><span class="pe-7s-keypad"></span> SISCRACHÁ</h2>
                            <h3 class="text-uppercase">login</h3>
                            <hr>
                        </div>
                        <div class="content">
                            <form method="POST" name="formLogin">
                                <p>
                                    <input type="text" id="usuario" required name="usuario" value="" class="form-control" placeholder="Usuário">
                                </p>
                                <p>
                                    <input type="password" id="senha" required name="senha" value="" class="form-control" placeholder="Senha">
                                    <div class="alert alert-info avisoUser" style="display:none;">
                                        <span>Usuário ou senha invalido(s).</span>
                                    </div>
                                </p>
                                <p class="text-center">
                                    <a href="#" class="btn btn-primary btnLogar">ENTRAR</a>                                
                                </p>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
