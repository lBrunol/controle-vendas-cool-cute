<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
        <ol class="breadcrumb">
            <li><a href="#">Início</a></li>
            <li><a href="#">Clientes</a></li>
            <li class="active">Criar/Editar</li>
        </ol>
        <c:if test="${retorno != null }">
            <c:if test="${retorno == true }">
                <div class="alert alert-success alert-dismissible fade in" role="alert"> 
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span></button> 
                    <i class="fa fa-fw fa-check"></i> ${msg}
                </div>
            </c:if>
            <c:if test="${retorno == false }">
                <div class="alert alert-danger alert-dismissible fade in" role="alert"> 
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span></button> 
                    <i class="fa fa-fw fa-times"></i> ${msg}
                </div>
            </c:if>
        </c:if> 
        <h2>Cadastrar Clientes</h2>
        <hr />
        <form method="post" action="/adicionarAlterarCliente" id="formClientes">
            <div class="row">
                <div class="hidden">
                    <c:choose>
                        <c:when test="${not empty cliente.codigo}">
                          <input type="hidden" name="codigo" value="${cliente.codigo}" />
                        </c:when>
                        <c:otherwise>
                          <input type="hidden" name="codigo" value="0" />
                        </c:otherwise>
                    </c:choose>
                </div>
                <div class="form-group col-md-6 col-xs-12">
                    <label for="nome">Nome do Cliente</label>
                    <input type="text" id="input-cliente" class="form-control" name="nome" value="${cliente.getNome()}" />
                </div> 
                <div class="form-group col-md-6 col-xs-12">
                    <label for="email">Email</label>
                    <input type="text" id="input-email"class="form-control" name="email" value="${cliente.getEmail()}" />
                </div>
            </div>
            <div class="row margin-std-bottom">
                <div class="col-md-12">
                    <hr />
                </div>
            </div>       
            <div class="row">
                <div class="col-md-12">
                    <button type="submit" class="btn btn-salvar margin-std-right margin-std-top"><i class="fa fa-fw fa-floppy-o"></i> Salvar</button>                
                    <a role="button" href="/cliente/consultar/" class="btn btn-vermelho margin-std-top"><i class="fa fa-fw fa-chevron-left"></i> Voltar</a>
                </div>
            </div>
        </form>
   </div>
    
    <%-- INCLUDE DO RODAPÉ --%>
    <%@include file="/includes/rodape.jsp" %>  
    <script type="text/javascript">
        $(function () {
            /* Validação dos campos do formulário */
            $("#formClientes").validate({
                errorPlacement: function(error, element) {
                $( element )
                    .closest( "form" )
                        .find( "label[for='" + element.attr( "name" ) + "']" )
                            .append( error );                
                },
                errorElement: "span",
                rules: {
                    nome: "required",
                    email: "required"                   
                }, 
                messages: {
                    nome: "Por favor, insira um nome válido",
                    email: "Por favor, insira um e-mail válido"                                    
                }                   
            });            
        });
    </script>       
</body>
</html>