<!-- #include file="top.asp" -->

<div class="content">
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-6">
				<div class="card">
					<div class="header">
						<h4 class="title text-uppercase">
							Lista de pedidos fnalizados(alunos)
							<hr>
						</h4>
					</div>
					<div class="content">
                        <table id="app" class="table table-hover  table-bordered">
                            <thead>
                            <tr class="text-uppercase">
                                <td> Id </td>
                                <td> Nome </td>
                                <td> Matricula </td>
                                <td> Curso</td>
                                <td> Status</td>

                            </tr>
                            </thead>
                            <tbody  v-for="user in pedidos" :key="user.Id">
                                <td>{{ user.Id }}</td>
                                <td>{{ user.Nome }}</td>
                                <td>{{ user.Matricula }}</td>
                                <td>{{ user.Curso }}</td>
                                <td>
                                    <span class="label label-warning">
                                       <span class="pe-7s-keypad"></span> {{ user.Status }}
                                    </span>
                                </td>
                            </tbody>
                        </table>
                        <div id="msg"></div>

                        </table>
					</div>
				</div>
			</div>
			<div class="col-md-6">
				<div class="card">
					<div class="header">
						<h4 class="title text-uppercase">
							Lista de pedidos fnalizados(RH)
							<hr>
						</h4>
					</div>
					<div class="content">
                        <table id="rh" class="table table-hover  table-bordered">
                            <thead>
                            <tr class="text-uppercase">
                                <td> Id </td>
                                <td> Nome </td>
                                <td> Matricula </td>
                                <td> Curso</td>
                                <td> Status</td>

                            </tr>
                            </thead>
                            <tbody  v-for="user in pedidos" :key="user.Id">
                                <td>{{ user.Id }}</td>
                                <td>{{ user.NomeCompleto }}</td>
                                <td>{{ user.NumeroPonto }}</td>
                                <td>{{ user.Setor }}</td>
                                <td>
                                    <span class="label label-warning">
                                       <span class="pe-7s-keypad"></span> {{ user.Status }}
                                    </span>
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
</div>


<script>
var app = new Vue({

    el: "#app",
    data: {
        pedidos: []
    },

    created() {
        var vm = this
        // axios.get('http://medicinapetropolis.com.br/ApiSisCracha/api/ListarPedidos/Finalizados')
        axios.get('http://medicinapetropolis.com.br/ApiSisCracha/api/ListarPedidos/Pendentes')
        .then(function(response) {
            vm.pedidos = response.data
            console.log(this.data)
        })
    }  
});

var rh = new Vue({

    el: "#rh",
    data: {
        pedidos: []
    },

    created() {
        var vm = this
        axios.get('http://medicinapetropolis.com.br/ApiSisCracha/api/listarPedidosRh/Pendentes')
        .then(function(response) {
            vm.pedidos = response.data
            // console.log(this.pedidos)
        })
    }
});
</script>

<!-- #include file="footer.asp" -->