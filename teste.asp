<!-- #include file="top.asp" -->

<div class="content">
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-6">
				<div class="card">
					<div class="header">
						<h4 class="title text-uppercase"><i class="pe-7s-add-user"></i> Novo Cadastro <small>(aluno)</small></h4>
						<hr>
					</div>
					<div class="content">
						<form method="POST" class="form-group" id="formCadastro">
							<p>
								<input type="text" class="form-control" name="Nome" id="Nome" placeholder="Nome" />
							</p>
							<p>
								<input type="text" class="form-control" name="Matricula" id="Matricula" placeholder="Matricula" />
							</p>
							<p>
								<input type="text" class="form-control" name="Identidade" id="Identidade" placeholder="Identidade" />
							</p>
							<p>
								<input type="text" class="form-control" name="Expeditor" id="Expeditor" placeholder="Expeditor" />
							</p>
							<p>
								<input type="text" class="form-control" name="DataNascimento" id="DataNascimento" placeholder="DataNascimento" />
							</p>
							<p>
								<input type="text" class="form-control" name="ValidadeCracha" id="ValidadeCracha" placeholder="ValidadeCracha" />
							</p>
							<p>
								<input type="text" class="form-control" name="Foto" id="Foto" placeholder="Foto" />
							</p>
							<p>
								<input type="text" class="form-control" name="Curso" id="Curso" placeholder="Curso" />
							</p>
							<p>
								<input type="submit" value="Cadastrar" class="btn btn-info">
							</p>
						</form>						
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<script>
$(document).ready(function() {
    $("#formCadastro").submit(function(e) {
        e.preventDefault();

        var apiurl = "http://www.medicinapetropolis.com.br/apiSisCracha/api/CadastrarPedidos/rh";

        var data = [];        

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