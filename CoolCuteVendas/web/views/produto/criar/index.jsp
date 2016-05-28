<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
    <title>Cadastro de Produto - Cool & Cute - Vendas</title>
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
            <li><a href="#">Produto</a></li>
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
                    <form:errors path="produto.*" />
                </div>
            </c:if>
        </c:if>
        <h2>Cadastro de Produto</h2>
        <hr>
        <form method="post" action="/adicionarAlterarProduto" id="formProduto">
            <div class="row">
                <div class="hidden">
                    <c:choose>
                        <c:when test="${not empty produto.codigo}">
                          <input type="hidden" name="codigo" value="${produto.codigo}" />
                        </c:when>
                        <c:otherwise>
                          <input type="hidden" name="codigo" value="0" />
                        </c:otherwise>
                    </c:choose>
                </div>
                <div class="form-group col-md-6">
                    <label for="nome">Nome</label>
                    <input type="text" class="form-control" name="nome" value="${produto.getNome()}"/>
                </div>
                <div class="form-group col-md-3">
                    <label for="estoqueMinimo">Estoque Mínimo</label>
                    <input type="number" class="form-control" name="estoqueMinimo" value="${produto.getEstoqueMinimo()}"/>
                </div>
                <div class="form-group col-md-3">
                    <label for="preco">Preço</label>
                    <input type="text" class="form-control" name="preco" value="${produto.getPreco()}" onkeypress="return(apenasNumeros(event))" onblur="atribuiTexto($(this),numeroParaMoeda($(this).val()))" />
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
                    <a role="button" href="/produto/consultar/" class="btn btn-vermelho margin-std-top"><i class="fa fa-fw fa-chevron-left"></i> Voltar</a>
                </div>
            </div>
        </form>
    </div>    
    <%-- INCLUDE DO RODAPÉ --%>
    <%@include file="/includes/rodape.jsp" %>
    <script type="text/javascript">
        /* Validação dos campos do formulário */
        $("#formProduto").validate({
            errorPlacement: function(error, element) {
            $( element )
                .closest( "form" )
                    .find( "label[for='" + element.attr( "name" ) + "']" )
                        .append( error );                
            },
            errorElement: "span",
            rules: {
                nome: "required",
                estoqueMinimo: "required",
                preco: "required"
            },
            messages: {
                nome: "Por favor, preencha o nome",
                estoqueMinimo: "Por favor, preencha a quantidade mínima ",
                preco: "Por favor, preencha o preço"
            }     
        });
    </script>    
</body>
</html>