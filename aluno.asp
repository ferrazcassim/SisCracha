<!-- #include file="top.asp" -->

<!-- styles for the cropbox -->
<style media="screen">
.imageBox
{
    margin-top: -10px;
    position: relative;
    height:350px;
    width:350px;
    border:1px solid #aaa;
    background: #fff;
    overflow: hidden;
    background-repeat: no-repeat;
    cursor:move;
}

.imageBox .thumbBox
{
    position: absolute;
    top: 50%;
    left: 50%;
    width: 200px;
    height: 200px;
    margin-top: -100px;
    margin-left: -100px;
    box-sizing: border-box;
    border: 1px solid rgb(102, 102, 102);
    box-shadow: 0 0 0 1000px rgba(0, 0, 0, 0.5);
    background: none repeat scroll 0% 0% transparent;
}

.imageBox .spinner
{
    position: absolute;
    top: 0;
    left: 0;
    bottom: 0;
    right: 0;
    text-align: center;
    line-height: 400px;
    background: rgba(0,0,0,0.7);
}

/* changes to the input file field */

.inputfile {
    width: 0.1px;
    height: 0.1px;
    opacity: 0;
    overflow: hidden;
    position: absolute;
    z-index: -1;
}

.my-button {
    background: none;
    border: none;
    font-size: 1.4em;
    font-weight: bolder;
}

.recorte {
    font-size: 1em !important;
}

</style>
<!-- end of styles for the cropbox -->

<div class="container-fluid">
    <div class="row">
        <div class="col-md-12">
            <div class="spacer-min"></div>
            <div class="card">
                <div class="header">
                    <h4 class="text-uppercase">lista de pedidos <small>(Alunos)</small></h4>
                    <p class="text-right">
                        <a href="default.asp" class="btn btn-default text-uppercase">
                            <span class="pe-7s-refresh"></span> início
                        </a>
                        <a href="http://medicinapetropolis.com.br/ApiSisCracha/api/BaixarPedidos" class="btn btn-success text-uppercase" onclick="alerta()">
                            <span class="pe-7s-cloud-download"></span> Download dos Pedidos
                        </a>
                        <a class="btn btn-primary text-uppercase" data-toggle="modal" data-target=".bs-example-modal-lg">
                            <span class="pe-7s-add-user"></span> Novo Pedido
                        </a>
                    </p>
                </div>
                <div class="content">
                    <table class="table table-bordered">
                        <thead>
                            <th>ID</th>
                            <th>Nome</th>
                            <th>Matricula</th>
                            <th>Curso</th>
                            <th>Status</th>
                            <th width="260px">Ações</th>
                        </thead>
                        <tbody class="tbody"></tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>


<!-- modal pedido aluno -->

<div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">
                <i class="pe-7s-close"></i>
            </button>
            <h4 class="text-uppercase">
                <span class="pe-7s-add-user"></span> Novo Pedido <small>(Alunos)</small>
            </h4>
        </div>
        <div class="modal-body">
            <div class="row">
                <div class="col-md-6">
                    <form class="" action="" method="post" id="formCadastro">
                        <p>
                            <input type="text" name="Nome" id="Nome" value="" class="form-control" placeholder="Nome Completo">
                        </p>
                        <p>
                            <input type="num" name="Matricula" id="Matricula" value="" class="form-control" placeholder="Matricula" maxlength="7">
                        </p>
                        <p>
                            <input type="text" name="Identidade" id="Identidade" value="" class="form-control" placeholder="Identidade" maxlength="9">
                        </p>
                        <p>
                            <input type="text" name="Expeditor" id="Expeditor" value="" class="form-control" placeholder="Expeditor">
                        </p>
                        <p>
                            <input type="date" name="DataNascimento" id="DataNascimento" value="" class="form-control" placeholder="DataNascimento">
                        </p>
                        <p>
                            <input type="text" name="ValidadeCracha" id="ValidadeCracha" value="" class="form-control" placeholder="ValidadeCracha">
                        </p>
                        <p>
                            <input type="text" name="Curso" value="" id="Curso" class="form-control" placeholder="Curso">
                        </p>
                        <p>
                            <div class="cropped"></div>
                            <input type="hidden" id="Foto" class="link cropped" value="" onchange="encodeImagetoBase64(this)"/>
                        </p>
                </div>
                <div class="col-md-6">
                        <p>
                            <!-- <label for="Foto">Foto:</label> -->
                            <!--
                            <input type="file" class="form-control" placeholder="Foto" onchange="encodeImagetoBase64(this)"/>
                            <input type="hidden" name="Foto" class="link" value="" id="Foto">
                            -->

                            <div class="imageBox">
                                <div class="thumbBox"></div>
                                <div class="spinner" style="display: none">
                                    <h4 style="color: #fff;">FOTO</h4>
                                    <input type="hidden" class="cropped link" id="Foto" value="" />
                                </div>
                            </div>
                            <div class="spacer-min"></div>
                            <div class="action">
                                <input type="file" id="file" style="float:left; width: 230px">
                                <input type="button" id="btnCrop" value="recortar" style="float: right" class="my-button">
                                <input type="button" id="btnZoomIn" value="+" style="float: right" class="my-button">
                                <input type="button" id="btnZoomOut" value="-" style="float: right" class="my-button recorte">
                            </div>                            
                        </p>
                        <div class="spacer-min"></div>
                        <p>
                            <input type="submit" value="cadastrar" class="btn btn-info text-uppercase">
                        </p>
                    </form>                                
                </div>
            </div>
        </div>

        <div id="response"></div>
        </div>
    </div>
</div>
<!--fim modal pedido aluno -->

<script type="text/javascript">

function encodeImagetoBase64(element) {

	var file = element.files[0];
	var reader = new FileReader();
	reader.onloadend = function() {

        foto = reader.result;
        fotofinal = foto.replace('data:image/jpeg;base64,','');
		console.log(fotofinal);
        $(".link").attr("value",fotofinal);
        $(".link").text(reader.result);
        $(".valor").text(reader.result);
	}

	reader.readAsDataURL(file);
}




$(document).ready(function(){
    loadData();
});

var path = "http://medicinapetropolis.com.br/ApiSisCracha"

function loadData() {
    $.ajax({
        url: path + "/api/ListarPedidos/Pendentes",
        type: "GET",
        dataType: "json",

        success: function(result) {
            var html = "";
            $.each(result, function(key, item) {
                html += '<tr>';
                html += '<td>' + item.Id +'</td>';
                html += '<td>' + item.Nome +'</td>';
                html += '<td>' + item.Matricula +'</td>';
                html += '<td>' + item.Curso +'</td>';
                html += '<td class="status-warning" style="text-transform: uppercase;">' + item.Status + '</td>';
                html += '<td class="text-center text-uppercase"><a href="#" onclick="Devolver(' + item.Id + ')" class="btn btn-success btn-xs">Devolver</a> <a href="#" onclick="return getbyID(' + item.Id + ')" class="btn btn-info btn-xs">Editar</a>  <a href="#" onclick="Delele(' + item.Id + ')" class="btn btn-warning btn-xs">Remover</a> ';
                html += '</tr>';
            });
            $('.tbody').html(html);
            // console.log(html);
        },

        error: function(errormessage) {
                alert("Deu ruim fera: " + errormessage.responseText);
        }
    });
}

// add a student register
$(document).ready(function(){
    $("#formCadastro").submit(function(e){

        e.preventDefault();


        var data =
        {
            Nome: $("#Nome").val().trim(),
            Matricula: $("#Matricula").val().trim(),
            Identidade: $("#Identidade").val().trim(),
            Expeditor: $("#Expeditor").val().trim(),
            DataNascimento: $("#DataNascimento").val().trim(),
            ValidadeCracha: $("#ValidadeCracha").val().trim(),
            Foto: $("#Foto").val().trim(),
            Curso: $("#Curso").val().trim(),
        }

        $.ajax({
            url: path + "/api/CadastrarPedido",
            method: 'POST',
            dataType: 'json',
            data: data,

            success: function(d) {
                $("#response").html("<div class='alert alert-success text-center text-uppercase'>Cadastro realizado com sucesso!</div>");
                document.getElementById("formCadastro").reset();
                location.reload(true);
            },

            error: function() {
                console.log(data);
                $("#response").html("<div class='alert alert-danger text-center text-uppercase'>Erro ao salvar os dados!</div>");
                document.getElementById("formCadastro").reset();
            }
        });
    });
});


function getbyID(ID) {

    $.ajax({
        url: "http://medicinapetropolis.com.br/ApiSisCracha/api/EditarPedido/" + ID,
        type: "GET",
        contentType: "application/json;charset=UTF-8",
        dataType: "json",
        success: function (result) {

            $('#Id').val(result.Id);
            $('#Nome').val(result.Nome);
            $('#Matricula').val(result.Matricula);
            $('#Identidade').val(result.Identidade);
            $('#Expeditor').val(result.Expeditor);
            $('#DataNascimento').val(result.DataNascimento);
            $('#ValidadeCracha').val(result.ValidadeCracha);
            $('#Foto').val(result.Foto);
            $('#Curso').val(result.Curso);


            $('#myModal').modal('show');
            $('#btnUpdate').show();
            $('#btnAdd').hide();

            console.log(result.Id);
            // alert(result.Id + " - " + result.Nome)
        },
        error: function (errormessage) {
            alert("Ocorreu um erro" + errormessage.responseText);
        }
    });
    return false;
}

function Delele(id) {
    var answer = confirm("Tem certeza que deseja remover este pedido?");

    if(answer) {
        $.ajax({
            url: path + "/api/Excluir/" + id,
            type: "GET",
            dataType: "json",
            success: function(result) {
                // alert("Pedido removido com sucesso!");
                loadData();
            },

            error: function(errormessage) {
                alert("Deu ruim meu jovem: " + errormessage.responseText);
            }
        });
    }
}


function Devolver(ID) {
    alert("O registro slecionado foi o: " + ID);
    $.ajax({
        url: path + "/api/DevolverPedidoAcademico/" + ID,
        type: "GET",
        dataType: "json",
        sucess: function(result) {
            alert("O registro slecionado foi o: " + ID);
            loadData();
        },
        error: function(errormessage) {
            alert("Amiguinho, assim não pode: " + errormessage.responseText());
        }
    });
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
