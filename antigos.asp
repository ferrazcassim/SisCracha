<!-- #include file="top.asp" -->
<style>
	.view-text { font-size: 0.9em }
	.actions-field { width: 110px; }
	.id-field { width: 60px; }
</style>


<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<div class="spacer-min"></div>
		</div>
	</div>
	<div class="row">
		<div class="col-md-6">
			<div class="card">
				<div class="header">
					<h4 class="title text-uppercase">
						Registros antigos <small>(Acadêmico)</small>
					</h4>
					<hr>
				</div>
				<div class="content">
					<table class="table table-bordered" id="app">
						<thead>
							<th class="id-field">ID</th>
							<th>Nome</th>
							<th>Matricula</th>
							<th>Curso</th>
							<th>Ações</th>
						</thead>
						<p >
						<tbody v-for="r in registros">
							<td>{{ r.Id }}</td>
							<td>{{ r.Nome }}</td>
							<td>{{ r.Matricula }}</td>
							<td>{{ r.Curso }}</td>
							<td class="actions-field">
								<a href="" class="text-uppercase view-text" data-toggle="modal" data-target=".bs-example-modal-lg" v-key="r.id">
									<i class="pe-7s-menu"></i> vizualizar
								</a>
							</td>
						</tbody>
						</p>
					</table>
				</div>
			</div>
		</div>
		<div class="col-md-6">
			<div class="card">
				<div class="header">
					<h4 class="title text-uppercase">
						Registros antigos <small>(Recursos Humanos)</small>
					</h4>
					<hr>
				</div>
				<div class="content">
					<table class="table table-bordered" id="app2">
						<thead>
							<th class="id-field">ID</th>
							<th>Apelido</th>
							<th>Número de Ponto</th>
							<th>Setor</th>
							<th>Ações</th>
						</thead>
						<tbody v-for="rh in registrosRh">
							<td>{{ rh.Id }}</td>
							<td>{{ rh.NomeCompleto }}</td>
							<td>{{ rh.NumeroPonto }}</td>
							<td>{{ rh.Setor }}</td>
							<td class="actions-field">
								<a href="" class="text-uppercase view-text" data-toggle="modal" data-target=".bs-example-modal-lg" v-key="rh.id">
									<i class="pe-7s-menu"></i> vizualizar
								</a>
							</td>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>


<!-- info modal  -->

<div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">
            <i class="pe-7s-close"></i>
        </button>      	
      	<h4 class="title">Informações do Pedido</h4>
      </div>
      <div class="modal-body">
      	<div class="row">
      		<div class="col-md-6">
      			<h4>Nome do Sujeito</h4>
      		</div>
      		<div class="col-md-6"></div>
      	</div>

      </div>
    </div>
  </div>
</div>

<!-- end of info modal  -->


<script>
	// Catching the students list
	let app = new Vue({
	el: '#app',
	data: {
		registros: []
	},
	created() {
	    fetch("http://medicinapetropolis.com.br/ApiSisCracha/api/ListarPedidos/Pendentes")
	    .then(response => response.json())
	    .then(json =>{
	        	this.registros = json;
	        	// console.log(this.registros);
	        })
	    }
	});


	//Catching the employees list
	let app2 = new Vue({
	el: '#app2',
	data: {
		registrosRh: []
	},
	created() {
	    fetch("http://medicinapetropolis.com.br/ApiSisCracha/api/ListarPedidosRH/Pendentes")
	    .then(response => response.json())
	    .then(json =>{
	        	this.registrosRh = json;
	        	// console.log(this.registros);
	        })
	    }
	});	
</script>


<!-- #include file="footer.asp" -->