<!-- #include file="top.asp" -->


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
                        <a href="http://medicinapetropolis.com.br/ApiSisCracha/api/BaixarPedidos" class="btn btn-success text-uppercase moduloGerencia" onclick="alerta()">
                            <span class="pe-7s-cloud-download"></span> Download dos Pedidos
                        </a>
                        <a class="btn btn-primary text-uppercase" data-toggle="modal" data-target=".bs-example-modal-lg">
                            <span class="pe-7s-add-user"></span> Novo Pedido
                        </a>
                    </p>
                    <hr>
                </div>
                <div class="content">
                    <table class="table table-bordered">
                        <thead>
                            <th>ID</th>
                            <th>Nome</th>
                            <th>Matricula</th>
                            <th>Curso</th>
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
            <form class="" action="" method="post" id="formCadastro">
                <p>
                    <input type="text" name="Nome" id="Nome" value="" class="form-control" placeholder="Nome Completo" required>
                </p>
                <p>
                    <input type="text" name="Matricula" id="Matricula" value="" class="form-control" placeholder="Matricula" required>
                </p>
                <p>
                    <input type="text" name="Identidade" id="Identidade" value="" class="form-control" placeholder="Identidade" required>
                </p>
                <p>
                    <input type="text" name="Expeditor" id="Expeditor" value="" class="form-control" placeholder="Expeditor" required>
                </p>
                <p>
                    <input type="date" name="DataNascimento" id="DataNascimento" value="" class="form-control" placeholder="DataNascimento" required>
                </p>
                <p>
                    <input type="text" name="ValidadeCracha" id="ValidadeCracha" value="" class="form-control" placeholder="ValidadeCracha">
                </p>
                <p>
                    <input type="text" name="Foto" value="" id="Foto" class="form-control" placeholder="Foto" required>
                </p>
                <p>
                    <input type="text" name="Curso" value="" id="Curso" class="form-control" placeholder="Curso" required>
                </p>

                <p>
                    <input type="submit" name="" value="cadastrar" class="btn btn-info text-uppercase">
                </p>
            </form>
        </div>

        <div id="response"></div>
        </div>
    </div>
</div>
<!--fim modal pedido aluno -->

<script type="text/javascript">
$(document).ready(function(){
    loadData();
});

//var path = "http://medicinapetropolis.com.br/ApiSisCracha"
var path = "http://localhost:57460"
var token = getCookie("token");  
             
  




function loadData() {
    $.ajax({     
        url: path + "/api/ListarPedidos/Pendentes",
        type: "GET",
        dataType: "json",
        beforeSend: function(xhr){xhr.setRequestHeader('Authorization', 'bearer ' + token);},
        success: function(result) {
            var html = "";
            $.each(result, function(key, item) {
                html += '<tr>';
                html += '<td>' + item.Id +'</td>';
                html += '<td>' + item.Nome +'</td>';
                html += '<td>' + item.Matricula +'</td>';
                html += '<td>' + item.Curso +'</td>';
                html += '<td class="status-warning" style="text-transform: uppercase;">' + item.Status + '</td>';
                html += '<td class="text-center text-uppercase"><a href="#" onclick="return getbyID(' + item.Id + ')" class="btn btn-info btn-xs">Editar</a>  <a href="#" onclick="Delele(' + item.Id + ')" class="btn btn-warning btn-xs">Remover</a></d>';
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


        var data = {
            Nome: $("#Nome").val().trim(),
            Matricula: $("#Matricula").val().trim(),
            Identidade: $("#Identidade").val().trim(),
            Expeditor: $("#Expeditor").val().trim(),
            DataNascimento: $("#DataNascimento").val().trim(),
            ValidadeCracha: $("#ValidadeCracha").val().trim(),
            Foto: $("#Foto").val().trim(),
            Curso: $("#Curso").val().trim()
        }

        $.ajax({
            url: path + "/api/CadastrarPedido",
            method: 'POST',
            dataType: 'json',
            data: data,

            beforeSend: function(xhr){xhr.setRequestHeader('Authorization', 'bearer ' + token);},

            success: function(d) {
                $("#response").html("<div class='alert alert-success text-center text-uppercase'>Cadastro realizado com sucesso!</div>");
                document.getElementById("formCadastro").reset();
                location.reload(true);
            },

            error: function(err) {               
                $("#response").html("<div class='alert alert-danger text-center text-uppercase'>"+ err.responseText +"</div>");
                //$("#response").html("<div class='alert alert-danger text-center text-uppercase'>Erro ao salvar os dados!</div>");
                //document.getElementById("formCadastro").reset();
            }
        });
    });
});

function Delele(id) {
    var answer = confirm("Tem certeza que deseja remover este pedido?");

    if(answer) {
        $.ajax({
            url: path + "/api/Excluir/" + id,
            type: "GET",
            dataType: "json",
            beforeSend: function(xhr){xhr.setRequestHeader('Authorization', 'bearer ' + token);},

            success: function(result) {
                alert("Pedido removido com sucesso!");
                loadData();
            },

            error: function(errormessage) {
                alert("Deu ruim meu jovem: " + errormessage.responseText);
            }
        });
    }
}

</script>

<!-- #include file="footer.asp" -->
