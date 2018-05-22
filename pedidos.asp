<!-- #include file="top.asp"  -->

<div class="content">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="header">
                        <h3 class="text-uppercase text-center"><span class="pe-7s-pendrive"></span> Finalizar Pedidos</h3>
                        <hr>
                    </div>
                    <div class="content">

                    </div>
                </div>
            </div>
        	<div class="col-md-6">
        		<div class="card">
        			<div class="header text-center">
        				<h4 class="text-uppercase">gerar pacote para produção <small>(Acadêmico)</small>  </h4>
        				<hr>
                        <a href="http://medicinapetropolis.com.br/ApiSisCracha/api/FinalizarPedido" class="btn btn-warning text-uppercase">Finalizar Pedidos <small>(Acadêmico)</small> </a>
        			</div>
        			<div class="content text-center">
        				<h2 class="pe-7s-cloud-download" style="font-size: 4em;"></h2>
        				<p>
        					<a href="http://medicinapetropolis.com.br/ApiSisCracha/api/BaixarPedidos" class="btn btn-warning text-uppercase" style="border: none; font-size: 1.4em;" onclick="alerta()">
        						-- Gerar Pacote --
        					</a>
        				</p>
        			</div>
        		</div>
        	</div>
        	<div class="col-md-6">
        		<div class="card">
        			<div class="header text-center">
        				<h4 class="text-uppercase">gerar pacote para produção <small>(RH)</small> </h4>
        				<hr>
                        <a href="http://medicinapetropolis.com.br/ApiSisCracha/api/FinalizarPedidoRH" class="btn btn-warning text-uppercase">Finalizar Pedidos <small>(RH)</small> </a>
        			</div>
        			<div class="content text-center">
        				<h2 class="pe-7s-cloud-download" style="font-size: 4em;"></h2>
        				<p>
        					<a href="http://medicinapetropolis.com.br/ApiSisCracha/api/BaixarPedidosRH" class="btn btn-warning text-uppercase" style="border: none; font-size: 1.4em;" onclick="alerta()">
        						-- Gerar Pacote --
        					</a>
        				</p>
        			</div>
        		</div>
        	</div>
        </div>
    </div>
</div>

<script>

$(document).ready(function(){
    $('#form').submit(function(e){

        e.preventDefault();
        var apiurl = "http://medicinapetropolis.com.br/ApiSisCracha";

        var data = [];

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

    })
})




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
