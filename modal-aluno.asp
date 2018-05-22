<!-- MODAL NOVO PEDIDO -->
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
<!-- FIM MODAL NOVO -->