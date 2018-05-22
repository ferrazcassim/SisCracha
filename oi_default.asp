<!-- #include file="top.asp" -->

<div class="content">
    <div class="container-fluid">
        <div class="row">
        	<div class="col-md-12">

        	</div>
            <div class="col-md-12">
            	<div class="card">
            		<div class="header">
						<h4 class="title">Lista de Pedidos Alunos</h4>
						<p>Pedidos na Fila.</p>
						<p class="text-right">
							<a href="" class="btn btn-info" data-toggle="modal" data-target="#myModal"><span class="pe-7s-add-user"></span> NOVO PEDIDO</a>
						</p>
            		</div>
            		<div class="content">
						<table id="app" class="table table-hover  table-bordered">
							<thead>
								<tr class="text-uppercase">
									<td> Id </td>
									<td> Nome </td>
									<td> Matricula </td>
									<td> Identidade </td>
									<td> Orgão Expeditor </td>
									<td> Data de Nascimento</td>
									<td> Curso</td>
									<!-- <td>Validade do Crachá</td> -->
									<td>Status</td>
									<td> Ações</td>
								</tr>
							</thead>
							<tbody  v-for="user in users" :key="user.Id">
								<td>{{ user.Id }}</td>
								<td>{{ user.Nome }}</td>
								<td>{{ user.Matricula }}</td>
								<td>{{ user.Identidade }}</td>
								<td>{{ user.Expeditor }}</td>
								<td>{{ user.DataNascimento }}</td>
								<td>{{ user.Curso }}</td>
								<!-- <td>{{ user.ValidadeCracha }}</td> -->
								<td>
									<span class="label label-warning">
										<span class="pe-7s-keypad"></span> {{ user.Status }}
									</span>
								</td>
								<td class="text-center">
									<a href="#" class="label label-info" data-toggle="modal" data-target=".bs-example-modal-lg">
										<span class="pe-7s-users"></span> Editar Pedido
									</a>
									&nbsp;
									<a class="label label-danger" v-on:click="deleteData" :key="user.Id">
										<span class="pe-7s-close"></span> Excluir
									</a>
								</td>
							</tbody>
						</table>
						<div id="msg"></div>
						</table>
            	</div>
            </div>
        </div>
    </div>
</div>

<div class="modal fade modal-cadastro" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title text-center" id="myModalLabel"><span class="pe-7s-add-user"></span> Cadastrar Pedido de Crachá Acadêmico <small>(Aluno)</small></h4>
      </div>
      <div class="modal-body">
        <form  action="#" method="post"  id="formCadastro" v-model="postPost" content-type="application/form-data">
            <p>
                <input type="text" name="Nome" id="Nome" class="form-control" placeholder="Nome Completo" value="">
            </p>
            <p>
                <input type="number" name="Matricula" id="Matricula" class="form-control" placeholder="Número da Matrícula" value="">
            </p>
            <p>
                <input type="text" name="Identidade" id="Identidade" class="form-control" placeholder="Número de Identidade" value="">
            </p>
            <p>
                <input type="text" name="Expeditor" id="Expeditor" class="form-control" placeholder="Orgão Expeditor" value="">
            </p>
            <p>
                <input type="text" name="DataNascimento" id="DataNascimento" class="form-control" placeholder="Data de Nascimento" value="">
            </p>
            <p>
                <input type="text" name="ValidadeCracha" id="ValidadeCracha" class="form-control" placeholder="Validade do Crachá" value="">
            </p>
              <!-- <input type="hidden" name="Status" value="Pendente" id="Status"> -->
            <p>
                <input type="text" name="Foto" class="form-control" value="" id="Foto" placeholder="Foto">
            </p>
            <p id="app2">
                <select name="Curso" class="form-control" id="Curso">
                    <option value="" selected="selected">SELECIONAR CURSO</option>
                    <option value="ADMINISTRAÇÃO">ADMINISTRAÇÃO</option>
                    <option value="COBRANÇA">COBRANÇA</option>
                    <option value="ENFERMAGEM">ENFERMAGEM</option>
                    <option value="ENFERMAGEM LICENCIATURA">ENFERMAGEM LICENCIATURA</option>
                    <option value="GESTÃO DE RECURSOS HUMANOS">GESTÃO DE RECURSOS HUMANOS</option>
                    <option value="MEDICINA">MEDICINA</option>
                    <option value="NUTRIÇÃO">NUTRIÇÃO</option>
                    <option value="ODONTOLOGIA">ODONTOLOGIA</option>
                    <option value="PSICOLOGIA">PSICOLOGIA</option>
                    <option value="RADIOLOGIA">RADIOLOGIA</option>
                    <option value="PÓS GRADUAÇÃO">PÓS GRADUAÇÃO</option>
                </select>
            </p>
            <p>
                <!-- <input type="file" name="Foto" class="form-control" value=""> -->
            </p>
            <p class="text-right">
                <button type="button" class="btn btn-default text-uppercase" data-dismiss="modal">Fechar</button>
                <input type="submit" value="Cadastrar" class="btn btn-primary text-uppercase" >
            </p>
        </form>
        <div id="response"></div>
      </div>
      <div class="modal-footer">

      </div>
    </div>
  </div>
</div>


<script>
new Vue({
  el: '#app',
  data: {
    users: []
  },
  created () {
    var vm = this
    axios.get('http://medicinapetropolis.com.br/ApiSisCracha/api/ListarPedidos/Pendentes')
      .then(function (response) {
        vm.users = response.data
      })
  },

  methods: {
        deleteData(cadastroDetail, Id) {
            Id = this.state.user.Id
            axios.delete('http://medicinapetropolis.com.br/ApiSisCracha/api/Excluir/' + this.user.Id)
            .then(response => this.cadastroDetail.splice(index, 1));
            console.log(cadastroDetail);
        },

        editRh(Id) {
            Id = this.state.user.Id
            axios.update('')
            .then(response => this.splice(index, 1));
        }
    }
})
</script>

<script>
// cadastrar pedido aluno
$(document).ready(function() {
    $("#formCadastro").submit(function(e) {
        e.preventDefault();

        var apiurl = "http://www.medicinapetropolis.com.br/apiSisCracha/api/cadastrarPedido";

        var data =
        {

            // Nome: $("#Nome").val(),
            // Matricula: $("#Matricula").val(),
            // Identidade: $("#Identidade").val(),
            // Expeditor: $("#Expeditor").val(),
            // DataNascimento: $("#DataNascimento").val(),
            // ValidadeCracha: $("#ValidadeCracha").val(),
            // Foto: $("#Foto").val(),
            // Curso: $("#Curso").val()
            Nome: $("#Nome").val(),
            Matricula: $("#Matricula").val(),
            Identidade: $("#Identidade").val(),
            Expeditor: $("#Expeditor").val(),
            DataNascimento: $("#DataNascimento").val(),
            ValidadeCracha: $("#ValidadeCracha").val(),
            Foto: $("#Foto").val(),
            Curso: $("#Curso").val(),
            Status: $("#Status").val()

        }

        $.ajax({
            url: apiurl,
            type: 'POST',
            dataType: 'json',
            data: data,
            headers: {
                "accept": "application/json;odata=verbose",
                "content-type": "application/json;odata=verbose",
            },
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



<!-- #include file="footer.asp"-->
