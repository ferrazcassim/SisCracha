<!-- #include file="top.asp" -->

<div class="container-fluid">
    <div class="row">
        <div class="col-md-12">
            <div class="spacer-min"></div>
            <div class="card">
                <div class="header">
                    <h4 class="text-uppercase">lista de pedidos <small>(recursos humanos)</small></h4>
                    <p class="text-right">
                        <a href="default.asp" class="btn btn-default text-uppercase">
                            <span class="pe-7s-refresh"></span> início
                        </a>
                        <a href="http://medicinapetropolis.com.br/ApiSisCracha/api/BaixarPedidosRH" class="btn btn-success text-uppercase moduloGerencia" onclick="alerta()">
                            <span class="pe-7s-cloud-download"></span> Download dos Pedidos
                        </a>
                        <a class="btn btn-primary text-uppercase" data-toggle="modal" data-target=".bs-example-modal-lg">
                            <span class="pe-7s-add-user"></span> Novo Pedido
                        </a>
                    </p>
                    <hr>
                </div>
                <div class="content">
                    <table class="table table-bordered table-hover" id="app">
                        <thead>
                            <th>ID</th>
                            <th>Nome</th>
                            <th>Setor</th>
                            <th>Número de Ponto</th>
                            <th>Status</th>
                            <th width="200px">Ações</th>
                        </thead>
                        <tbody class="tbody"></tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- modal recursos humanos -->

<div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">
                <i class="pe-7s-close"></i>
            </button>
            <h4 class="text-uppercase">
                <span class="pe-7s-add-user"></span> Novo Pedido <small>(Recursos Humanos)</small>
            </h4>
        </div>
        <div class="modal-body">
            <form  action="#" method="post"  id="formCadastro" enctype="multipart/form-data">
                <p>
                    <input type="text" name="NumeroPonto" id="NumeroPonto" class="form-control" placeholder="Número de Ponto" value="" maxlength="7">
                </p>
                <p>
                    <input type="text" name="NomeCompleto" id="NomeCompleto" class="form-control" placeholder="Nome Completo" value="">
                </p>
                <p>
                    <input type="text" name="Apelido" id="Apelido" class="form-control" placeholder="Apelido" value="">
                </p>
                <p id="app2" >
                    <select name="Setor" class="form-control text-uppercase" id="Setor">
                        <option value="">Selecione o Setor</option>
                        <option v-for="d in dados" v-bind:value="d.Nome" >{{ d.Nome }}</option>
                    </select>
                </p>
                <p>
                    <!-- <label for="Foto">Foto:</label> -->
                    <input type="file" name="Foto" class="form-control" id="Foto" placeholder="Foto" />
                </p>
                <p>
                    <select name="Tipo" id="Tipo" class="form-control text-uppercase">
                        <option value="">SELECIONE O TIPO</option>
                        <option value="Adminstrativo">Adminstrativo</option>
                        <option value="Professor">Professor</option>
                    </select>
                </p>
                <p class="text-right">
                    <input type="submit" value="Cadastrar" class="btn btn-info text-uppercase">
                </p>
                <hr>
            </form>
        </div>

        <div id="response"></div>


        </div>
    </div>
</div>

<!-- fim modal recursos humanos -->

<!-- <script type="text/javascript">
// cropper
var dark = new Darkroom('#Foto');
</script> -->


<script type="text/javascript">

// loading setores data
var app2 = new Vue({
el: '#app2',
data: {
    dados: []
},
created() {
    fetch("http://medicinapetropolis.com.br/ApiSisCracha/api/CadastrarPedidos/getSetores")
    .then(response => response.json())
    .then(json =>{
        	this.dados = json;
        	// console.log("Dados= " + this.dados);
        })
    }
});

$(document).ready(function () {
    loadData();
});

// var path = "http://medicinapetropolis.com.br/ApiSisCracha"
var path = "http://localhost:57460";
var token = getCookie("token");  

function loadData() {
    $.ajax({
        url: path + "/api/ListarPedidosRH/Pendentes",
        type: "GET",
        // contentType: "application/json;charset=utf-8",
        dataType: "json",

        beforeSend: function(xhr){xhr.setRequestHeader('Authorization', 'bearer ' + token);},

        success: function (result) {
            var html = '';
            $.each(result, function (key, item) {
                html += '<tr>';
                html += '<td>' + item.Id + '</td>';
                html += '<td>' + item.NomeCompleto  + '</td>';
                html += '<td class="text-uppercase text-center">' + item.Setor + '</td>';
                html += '<td>' + item.NumeroPonto  + '</td>';
                html += '<td class="status-warning" style="text-transform: uppercase;">' + item.Status + '</td>';
                html += '<td class="text-center text-uppercase"><a href="#" onclick="return getbyID(' + item.Id + ')" class="btn btn-info btn-xs">Editar</a>  <a href="#" onclick="Delele(' + item.Id + ')" class="btn btn-warning btn-xs">Remover</a></d>';
                html += '</tr>';
            });
            $('.tbody').html(html);
        },
        error: function (errormessage) {
            alert("Ocorreu um erro" + errormessage.responseText);
        }
    });
}

// cadastrar pedido rh
$(document).ready(function() {
    $("#formCadastro").submit(function(e) {
        e.preventDefault();

        // var apiurl = "http://www.medicinapetropolis.com.br/apiSisCracha/api";

        var data =
        {

            NumeroPonto: $("#NumeroPonto").val().trim(),
            NomeCompleto: $("#NomeCompleto").val().trim(),
            Apelido: $("#Apelido").val().trim(),
            Setor: $("#Setor").val().trim(),
            Tipo: $("#Tipo").val().trim(),
            Foto: $("#Foto").val().trim(),
        }

        $.ajax({
            url: path + "/api/CadastrarPedidos/rh",
            type: 'POST',
            dataType: 'json',
            data: data,

            beforeSend: function(xhr){xhr.setRequestHeader('Authorization', 'bearer ' + token);},

            success: function(d) {
                console.log(data);
                $("#response").html("<div class='alert alert-success text-center text-uppercase'>Cadastro realizado com sucesso!</div>");
                document.getElementById("formCadastro").reset();
                location.reload(true);
                // loadData();
            },
            error: function(err) {
                console.log(data);
                $("#response").html("<div class='alert alert-danger text-center text-uppercase'>"+ err.responseText +"</div>");
                document.getElementById("formCadastro").reset();
            }
        });
    });
});


// Edit pedido
function getbyID(Id) {

    $.ajax({
        url: path + "api/EditarPedido/" + Id,
        typr: "GET",
        contentType: "application/json;charset=UTF-8",
        dataType: "json",

        beforeSend: function(xhr){xhr.setRequestHeader('Authorization', 'bearer ' + token);},

        success: function (result) {
            $('#Id').val(result.Id);
            $('#NomeCompleto').val(result.NomeCompleto);
            $('#NumeroPonto').val(result.NumeroPonto);
            $('#Setor').val(result.Setor);
            $('#Status').val(result.Status);
            $('#Foto').val(result.Foto);

            $('#myModal').modal('show');
            $('#btnUpdate').show();
            $('#btnAdd').hide();
        },
        error: function (errormessage) {
            alert("Ocorreu um erro: " + errormessage.responseText);
        }
    });
    return false;
}


// Update data
function Update(Id) {
    $
}

// Deletando um pedido
function Delele(ID) {
    var ans = confirm("Tem certeza que deseja deletar esse registro?");
    if (ans) {
        $.ajax({
            url: path + "/api/ExcluirRH/" + ID,
            type: "GET",
            contentType: "application/json;charset=UTF-8",
            dataType: "json",

            beforeSend: function(xhr){xhr.setRequestHeader('Authorization', 'bearer ' + token);},

            success: function (result) {
                loadData();
                alert("Pedido removido com sucesso!");
            },
            error: function (errormessage) {
                alert("Ocorreu um erro" + errormessage.responseText);
            }
        });
    }
}

function alerta(){
    demo.initChartist();

    $.notify({
        message: "<h6>Pacote gerado com sucesso!</h6>"

    },{
        type: 'success',
        timer: 3000
    });
}

</script>

<!-- #include file="footer.asp" -->
