<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Consulta de Clientes - Cool & Cute - Vendas</title>
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
                     
            <h2>Consultar Cliente</h2>
            <hr />
                   
 
 <h3> Selecionar Filtro :</h3>
 <div class="row">
<div class="col-md-12">


<div class="panel panel-default">
  <div class="panel-body">


<input type="radio" name="radioFiltroCliente" id="pesquisaPorNome"> Pesquisa por Nome</input>
<br />
<br />
<input type="radio" name="radioFiltroCliente" id="pesquisaPorNome"> Pesquisa por Email</input>

  </div>
</div>

</div>
</div>



<!--#### CAMPO DE CONSULTA AO CLIENTE ####-->
<br />
<div class="row">
<div class="col-md-12">
<div class="input-group">
  <input type="text" class="form-control" placeholder="Pesquisar Cliente" aria-describedby="basic-addon2" id="pesquisaPorCliente">
  <span class="input-group-addon" id="basic-addon2">Consultar</span>
</div>
</div>
</div>


<!--#### DESCRIÇÃO E RESULTADO DA CONSULTA #####-->
    </div>
    <%-- INCLUDE DO RODAPÉ --%>
    <%@include file="/includes/rodape.jsp" %>    
</body>
</html>