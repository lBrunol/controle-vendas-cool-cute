<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Cadastro de Produtos - Cool & Cute - Vendas</title>
    <%-- INCLUDE DO TOPO --%>
    <%@include file="/includes/topo.jsp" %>
</head>
<body>
    <%-- INCLUDE DO MENU --%>
    <%@include file="/includes/menu.jsp" %>
    <!-- CONTEÚDO -->
    <div class="container content">
        <h2>Cadastro de Produtos</h2>
        <hr>
        <div class="row">
                       <ol class="breadcrumb">
      <li><a href="#">Início</a></li>
      <li class="active">Cadastrar Produtos</li>
    </ol>
            </div>

        
            <h2>Cadastrar Produtos</h2>
            <hr />
            <form method="post" action="javascript:void(0);">    

                          <!-- ####CAMPO DE CÓDIGO DO PRODUTO OCULTO#### -->  
                        <input type="hidden" class="form-control" name="txtCodigoProduto" />   
                           <!-- ####CAMPO DE CÓDIGO DO PRODUTO OCULTO#### -->           
                           <div class="row">
                    <div class="form-group col-md-6 col-xs-12">
                        <label for="txtNomeProduto">Nome do Produto</label>
                        <input type="text" class="form-control" name="txtNomeProduto" />
                    </div>

</div>

<div class="row">
<div class="form-group col-md-6 col-xs-12">
   <label for="slcStatus">Status</label>
                    <select class="form-control">
                        <option>Ativo</option>
                        <option>Inativo</option>
                   </select>
</div>
</div>
<div class="row">
<div class="form-group col-md-6 col-xs-12">
     <label for="txtEstoqueMinimo">Estoque Mínimo</label><input type="number" class="form-control input-qtde" name="txtEstoqueMinimo" />
</div>
</div>



 



                
              
            
          
              
                <div class="row">
                    <div class="col-md-12">
                        <button type="submit" class="btn btn-salvar margin-std-right margin-std-top"><i class="fa fa-fw fa-floppy-o"></i> Salvar</button>
                        <button type="button" class="btn btn-vermelho margin-std-top""><i class="fa fa-fw fa-chevron-left"></i> Voltar</button>
                    </div>
                </div>
            </form>
   </div>
    <%-- INCLUDE DO RODAPÉ --%>
    <%@include file="/includes/rodape.jsp" %>    
</body>
</html>