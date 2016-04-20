<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Cadastro de Clientes - Cool & Cute - Vendas</title>
    <%-- INCLUDE DO TOPO --%>
    <%@include file="/includes/topo.jsp" %>
</head>
<body>
    <%-- INCLUDE DO MENU --%>
    <%@include file="/includes/menu.jsp" %>
    <!-- CONTEÚDO -->
    <div class="container content">
        <!--BreadCrumbs-->
        <ol class="breadcrumb">
            <li><a href="#">Início</a></li>
            <li><a href="#">Clientes</a></li>
            <li class="active">Criar/Editar</li>
        </ol>
        <!--Fim BreadCrumbs-->                 
        <h2>Cadastrar Clientes</h2>
        <hr />
        <form method="post" action="javascript:void(0);">
            <div class="row">
                <div class="form-group col-md-6 col-xs-12">
                    <label for="txtNomeCliente">Nome do Cliente</label>
                    <input type="text" id="input-cliente"class="form-control" name="txtNomeCliente" />
                </div> 

                <div class="form-group col-md-6 col-xs-12">
                    <label for="txtEmailCliente">Email</label>
                    <input type="text" id="input-email"class="form-control" name="txtEmailCliente" />
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