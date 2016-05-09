<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Cadastro de Anúncios - Cool & Cute - Vendas</title>
    <%-- INCLUDE DO TOPO --%>
    <%@include file="/includes/topo.jsp" %>
</head>
<body>
    <%-- INCLUDE DO MENU --%>
    <%@include file="/includes/menu.jsp" %>
    <!-- CONTEÚDO -->
    <div class="container content">
        <h2>Cadastro de Anúncios</h2>
        <hr>
        <!-- MODAIS -->
        <!-- MODAL ANÚNCIO -->
        <div class="modal unique-selection fade" id="modal-anuncio" tabindex="-1" role="dialog">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">                        
                        <div class="col-md-8">
                            <h4 class="modal-title">Selecione o Anúncio</h4>
                        </div>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <div class="col-md-4">
                            <button type="button" class="btn btn-salvar pull-right data-modal" data-dismiss="modal" data-target="#input-anuncio">OK</button>
                        </div>                        
                    </div>
                    <div class="modal-body">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>Anúncio</th>
                                    <th>Código</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td class="data-value">Mochila Azul</td>
                                    <td class="data-attr">1</td>                        
                                </tr>
                                <tr>
                                    <td class="data-value">Mochila Rosa</td>
                                    <td class="data-attr">2</td>
                                </tr>
                                <tr>
                                    <td class="data-value">Bolsa Tommy</td>
                                    <td class="data-attr">3</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-salvar data-modal" data-dismiss="modal" data-target="#input-anuncio">OK</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal unique-selection fade" id="modal-cliente" tabindex="-1" role="dialog">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <div class="col-md-8">
                            <h4 class="modal-title">Selecione o Cliente</h4>
                        </div>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <div class="col-md-4">
                            <button type="button" class="btn btn-salvar pull-right data-modal" data-dismiss="modal" data-target="#input-cliente">OK</button>
                        </div>
                    </div>
                    <div class="modal-body">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>Id</th>
                                    <th>Cliente</th>
                                    <th>E-mail</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td class="data-attr">1</td>                                    
                                    <td class="data-value">Carlos da Silva</td>
                                    <td>carlos-silva@hotmail.com</td>
                                </tr>
                                <tr>
                                    <td class="data-attr">2</td>                                    
                                    <td class="data-value">Andrea de souza lemos ramos da costa</td>
                                    <td>deia-lemos@gmail.com</td>
                                </tr>
                                <tr>
                                    <td class="data-attr">3</td>                                    
                                    <td class="data-value">Carlos da Silva</td>
                                    <td>carlos-silva@hotmail.com</td>
                                </tr>
                                <tr>
                                    <td class="data-attr">4</td>                                    
                                    <td class="data-value">Andrea de souza lemos ramos da costa</td>
                                    <td>deia-lemos@gmail.com</td>
                                </tr>                                
                            </tbody>
                        </table>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-salvar data-modal" data-dismiss="modal" data-target="#input-cliente">OK</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal multi-selection fade" id="modal-produto" tabindex="-1" role="dialog">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">

                        <div class="col-md-8">
                            <h4 class="modal-title">Selecione os Produtos</h4>
                        </div>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <div class="col-md-4">

                            <button type="button" class="btn btn-salvar pull-right" data-dismiss="modal">OK</button>
                        </div>

                    </div>
                    <div class="modal-body">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>Anúncio</th>
                                    <th>Preço</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>Mochila Azul</td>
                                    <td>R$ 70,00</td>
                                </tr>
                                <tr>
                                    <td>Mochila Rosa</td>
                                    <td>R$ 70,00</td>
                                </tr>
                                <tr>
                                    <td>Bolsa Tommy</td>
                                    <td>R$ 120,00</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-salvar" data-dismiss="modal">OK</button>
                    </div>
                </div>
            </div>
        </div>

 <!--________________________________________________________________________________________________-->
                      
 

 <!--BreadCrumbs-->
     <ol class="breadcrumb">
      <li><a href="#">Início</a></li>
      <li><a href="#">Anúncios</a></li>
      <li class="active">Criar Anúncio</li>
    </ol>
<!--Fim BreadCrumbs-->



<!--________________________________________________________________________________________________-->
        
            <h2>Cadastrar Anúncio</h2>
            <hr />
<form method="post" action="javascript:void(0);" id="formCadastroAnuncio">
              <div class="row">
                        <div class="form-group col-md-6 col-xs-12">
          <label for="txtDescricaoAnuncio">Descrição</label>
          <input type="text" id="input-descricao-anuncio"class="form-control" name="txtDescricaoAnuncio" />
</div>

<div class="form-group col-md-6 col-xs-12">
   <label for="slcStatusAnuncio">Status do Anúncio</label>
     <select class="form-control">
             <option>Ativo</option>
             <option>Inativo</option>
      </select>

   

</div>
</div>



<div class="row">
<div class="form-group col-md-6 col-xs-12">
          <label for="txtTipoAnuncio">Tipo </label>
          <select class="form-control">
             <option>Grátis</option>
             <option>Premium</option>
             <option>Clássica</option>
      </select>
         
</div>

<div class="form-group col-md-6 col-xs-12">
                    <label for="txtValorAnuncio">Preço</label>
                    <input type="text" class="form-control" name="txtValorAnuncio" onkeypress="return(apenasNumeros(event))" onblur="atribuiTexto($(this),numeroParaMoeda($(this).val()))"/>
                </div>
   </div>

            <div class="row">
                <div class="form-group col-md-6 col-xs-12">
                    <label for="txtStatusAnuncio">Status</label>
                    <select class="form-control">
                        <option>Grátis</option>
                        <option>Premium</option>
                        <option>Clássica</option>
                     </select>    
                </div>
            </div>
</form>

            <div class="row">
                <div class="col-md-12">
                    <button type="submit" class="btn btn-salvar margin-std-right margin-std-top"><i class="fa fa-fw fa-floppy-o"></i> Salvar</button>
                    <button type="button" class="btn btn-vermelho margin-std-top"><i class="fa fa-fw fa-chevron-left"></i> Voltar</button>
                </div>
            </div>





</div>






    <%-- INCLUDE DO RODAPÉ --%>
    <%@include file="/includes/rodape.jsp" %>  






    <!-- ________________________________________________________________________________________-->

 <script type="text/javascript">
        /* Validação dos campos do formulário */
        $("#formCadastroAnuncio").validate({
            errorPlacement: function(error, element) {
            $( element )
                .closest( "form" )
                    .find( "label[for='" + element.attr( "name" ) + "']" )
                        .append( error );                
            },
            errorElement: "span",
            rules: {
                txtDescricaoAnuncio: "required",
                txtValorAnuncio: "required",
            },
            messages: {
                txtDescricaoAnuncio: "Por favor, preencha a descrição",
                txtValorAnuncio: "Por favor, insira um valor para o Anúncio",
            }    
        });
    </script>
</body>
</html>