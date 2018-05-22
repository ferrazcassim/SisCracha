<!-- #include file="top.asp" -->

<div class="content">
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-6">
				<div class="card">
					<div class="header">
						<h4 class="title text-uppercase">
							Adicionar pedido de crachá <small>(Recursos Humanos)</small> <span class="pe-7s-add-user"></span>
						</h4>
						<hr>
					</div>
					<div class="content">
						<form  action="#" method="post"  id="formCadastro">
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
						        <!-- <input type="text" name="Setor" id="Setor" class="form-control" placeholder="Setor" value=""> -->
						        <select name="Setor" class="form-control text-uppercase" id="Setor">
						            <option value="">Selecione o Setor</option>
						            <!-- <option v-for="d in dados" v-bind:value="d.Nome" >{{ d.Nome }}</option> -->
									<option value="Informatica">Informatica</option>
						        </select>
						    </p>
						    <p>
						        <input type="text" name="Foto" class="form-control" id="Foto" placeholder="Foto">
						    </p>
						    <p>
						        <!-- <input type="text" name="Tipo" class="form-control" placeholder="Tipo" id="Tipo"> -->
						        <select name="Tipo" id="Tipo" class="form-control text-uppercase">
						            <option value="">SELECIONE O TIPO</option>
						            <option value="Adminstrativo">Adminstrativo</option>
						            <option value="Professor">Professor</option>
						        </select>
						    </p>
						    <p class="text-right">
						        <input type="submit" value="Cadastrar" class="btn btn-info text-uppercase">
						    </p>
						</form>

						<div id="response"></div>
					</div>
				</div>
			</div>
			<div class="col-md-6">
                <div class="card">
                    <div class="header">
                        <h4 class="text-uppercase" style="margin-top: -1px;">Cadastrar Setor <span class="pe-7s-plus"></span></h4>
                        <hr>
                    </div>
                    <div class="content">
                        <form @submit.prevent="buttonClicked" action="#" method="post" id="form">
                            <p>
                                <input type="text" name="Nome" id="" value="" placeholder="Nome" class="form-control">
                            </p>
                            <p>
                                <select name="Status" id="" class="form-control text-uppercase" value="">
                                    <option value="">Selecione o Status</option>
                                    <option value="Ativo">Ativo</option>
                                    <option value="Inativo">Inativo</option>
                                </select>
                            </p>
                            <p class="text-right">
                                <input type="submit" value="CADASTRAR" class="btn btn-info">
                            </p>
                        </form>
                        <div id="msg"></div>
                    </div>
                </div>
			</div>

		</div>
	</div>
</div>

<script>
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

</script>

<script>
// cadastrar setor
$(document).ready(function(){
    $('#form').submit(function(){

        $('#msg').html("<b>Loading...</b>");

        $.ajax({
            type: 'POST',
            url: 'http://www.medicinapetropolis.com.br/apisiscracha/api/CadastroSetor/cadastro',
            data: $(this).serialize(),
            contentType: 'application/json'
        })
        .done(function(data){
            $('#msg').html(data);
            $("#msg").html('<div class="alert alert-success">Cadastro realizado com sucesso!</div>');
            location.reload(true);

        })
        .fail(function() {
            $('#msg').html('<div class="alert alert-danger">Erro ao cadastar.</div>');
            console.log(error());
        });

        return false;

    });
});
// cadastrar pedido rh
$(document).ready(function() {
    $("#formCadastro").submit(function(e) {
        e.preventDefault();

        var apiurl = "http://www.medicinapetropolis.com.br/apiSisCracha/api/CadastrarPedidos/rh";

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
            url: apiurl,
            type: 'POST',
            dataType: 'json',
            data: data,
            success: function(d) {
                console.log(data);
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
</script>


<!-- #include file="footer.asp" -->
