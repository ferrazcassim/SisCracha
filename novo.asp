<!-- #include file="top.asp" -->

<div class="content">
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-5">
				<div class="card">
					<div class="header">
						<h4 class="title text-uppercase">
							Adicionar pedido de crachá <small>(aluno)</small>
						</h4>
						<hr>
					</div>
					<div class="content">
                        <form  action="#" method="post"  id="formCadastro" v-model="postPost" @change="postPost()">
                            <p>
                                <input type="text" name="Nome" id="Nome" class="form-control" placeholder="Nome Completo" value="">
                            </p>
                            <p>
                                <input type="text" name="Matricula" id="Matricula" class="form-control" placeholder="Número da Matrícula" value="">
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
                            <p id="app">
                                <select class="form-control" name="Curso" id="Curso">
                                    <option value="0" selected>SELECIONAR CURSO</option>
                                    <option v-for="c in categorias" v-bind:value="c.Nome">{{ c.Nome }}</option>
                                </select>
                            </p>                                    
                            <p>
                                <input type="text" name="Foto" class="form-control" value="" id="Foto">
                            </p>                                                                                                              
                            <!-- <input type="hidden" name="Status" value="Pendente" id="Status">-->
                            <p class="text-right">
                                <input type="submit" value="Cadastrar" class="btn btn-info text-uppercase" >
                            </p>
                        </form>
                        <div id="response"></div>						
					</div>
				</div>
			</div>
			<div class="col-md-7">
				<div class="card">
					<div class="header">
						<h4 class="title text-uppercase">
							Lista de Pedidos <small>(aluno)</small>
						</h4>
						<hr>
					</div>
					<div class="content">
						<table id="app2" class="table table-hover  table-bordered">
							<thead>
								<tr class="text-uppercase">
									<td> Id </td>
									<td> Nome </td>
									<td> Matricula </td>
									<td> Identidade </td>
									<td> Curso</td>
									<td>Status</td>
								</tr>
							</thead>
							<tbody  v-for="user in users" :key="user.Id">
								<td>{{ user.Id }}</td>
								<td>{{ user.Nome }}</td>
								<td>{{ user.Matricula }}</td>
								<td>{{ user.Identidade }}</td>
								<td>{{ user.Curso }}</td>
								<td>
									<span class="label label-warning">
										<span class="pe-7s-keypad"></span> {{ user.Status }}
									</span>
								</td>
							</tbody>
						</table>
						<v-paginator :options="options" :resource_url="resource_url" @update="updateResource"></v-paginator>						
					</div>
				</div>				
			</div>
		</div>
	</div>
</div>

<script>
var app = new Vue({
el: '#app',
data: {
    categorias: []
},
created() {
    fetch("http://medicinapetropolis.com.br/ApiSisCracha/api/cadastrarPedido")
    .then(response => response.json())
    .then(json =>{
        this.categorias = json;
        	// console.log(this.categorias);
        })
    } 
});


var app2 = new Vue({
  el: '#app2',
  data: {
    users: []
  },

  //   options: {
  //     remote_data: 'nested.data',
  //     remote_current_page: 'nested.current_page',
  //     remote_last_page: 'nested.last_page',
  //     remote_next_page_url: 'nested.next_page_url',
  //     remote_prev_page_url: 'nested.prev_page_url',
  //     next_button_text: 'Go Next',
  //     previous_button_text: 'Go Back'
  // },  
  created () {
    var vm = this
    axios.get('http://medicinapetropolis.com.br/ApiSisCracha/api/ListarPedidos/Pendentes')
      .then(function (response) {
        vm.users = response.data
        console.log(this.data)
      })
  }
});

</script>

<script>
$(document).ready(function() {
    $("#formCadastro").submit(function(e) {
        e.preventDefault();

        var apiurl = "http://medicinapetropolis.com.br/ApiSisCracha/api/cadastrarPedido";

        var data = 
        {

            Nome: $("#Nome").val().trim(),
            Matricula: $("#Matricula").val().trim() ,
            DataNascimento: $("#DataNascimento").val().trim() ,
            Expeditor: $("#Expeditor").val().trim() ,
            Foto: $("#Foto").val().trim() ,
            Identidade: $("#Identidade").val().trim() ,
            ValidadeCracha: $("#ValidadeCracha").val().trim() ,
            Curso: $("#Curso").val().trim(), 
        }


        $.ajax({
            url: apiurl,
            type: 'POST',
            dataType: 'json',
            data: data,
            contentType: 'application/x-www-form-urlencoded',
            success: function() {
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