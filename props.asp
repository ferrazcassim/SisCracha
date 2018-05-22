<!-- #include file='top.asp' -->

<div class="spacer-min"></div>

<div class="container-fluid">
    <div class="row">
        <div class="col-md-12">
            <div class="card">
                <div class="header">
                    <h3>Controle de Pedidos</h3>
                    <hr>
                </div>
                <div class="content">
                    <table class="table table-bordered">
                        <thead>
                            <th>ID</th>
                            <th>Nome</th>
                            <th>Matricula</th>
                            <th>Curso</th>
                            <th width="20%">Ações</th>
                        </thead>
                        <div class=""  v-for="d in dados">
                            <tbody id="app">
                                <td>{{ d.Id }}</td>
                                <td>{{ d.Nome }}</td>
                                <td>{{ d.Matricula }}</td>
                                <td>{{ d.Curso }}</td>
                                <td>
                                    <a href="#" class="btn btn-warning">EDIT</a>
                                    <a href="#" class="btn btn-danger">DELETE</a>
                                </td>
                            </tbody>
                        </div>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
var app = new Vue({
el: '#app',
data: {
    dados: []
},
created() {
    fetch("http://medicinapetropolis.com.br/ApiSisCracha/api/ListarPedidos/Pendentes")
    .then(response => response.json())
    .then(json =>{
        	this.dados = json;
        })
    }
});
</script>

<!-- #include file="footer.asp" -->
