<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
    <title>Cadastro de Movimentações - Cool & Cute - Vendas</title>
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
            <li><a href="#">Movimentações</a></li>
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
                    <form:errors path="movimentacao.*" />
                </div>
            </c:if>
        </c:if>        
        <h2>Cadastro de Movimentações</h2>
        <hr>
        <form method="post" action="/adicionarAlterarMovimentacao" id="formMovimentacao">
            <div class="row">
                <div class="hidden">
                    <c:choose>
                        <c:when test="${not empty movimentacao.codigo}">
                          <input type="hidden" name="codigo" value="${movimentacao.codigo}" id="hdnCodigo" />
                        </c:when>
                        <c:otherwise>
                          <input type="hidden" name="codigo" value="0" id="hdnCodigo" />
                        </c:otherwise>
                    </c:choose>
                </div>
                <div class="form-group col-md-6">
                    <label for="descricao">Descrição</label>
                    <input type="text" class="form-control" name="descricao"  value="${movimentacao.getDescricao()}"/>
                </div>
                <div class="form-group col-md-6 col-xs-12">
                    <label for="valor">Valor</label>
                    <input type="text" class="form-control" name="valor" value="${movimentacao.getValor()}" onkeypress="return(apenasNumeros(event))" onblur="atribuiTexto($(this),numeroParaMoeda($(this).val()))" />
                </div>
            </div>
            <div class="row">
                <div class="form-group col-md-6 col-xs-12">
                    <label for="data">Data</label>
                    <input type="date" class="form-control" name="data" value="${movimentacao.getData()}" />
                </div>
                <div class="form-group col-md-6 col-xs-12">
                    <label for="tipoMovimentacao.codigo">Tipo de Movimentação</label>
                    <select class="form-control" name="tipoMovimentacao.codigo" id="tipoMovimentacao">
                        <c:forEach items="${tipoMovimentacao}" var="tipoMovimentacao">
                            <option value="${tipoMovimentacao.getCodigo()}">${tipoMovimentacao.getDescricao()}</option>
                        </c:forEach>
                    </select>
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
                    <a role="button" href="/movimentacao/consultar/" class="btn btn-vermelho margin-std-top"><i class="fa fa-fw fa-chevron-left"></i> Voltar</a>
                </div>
            </div>
        </form>
    </div>    
    <%-- INCLUDE DO RODAPÉ --%>
    <%@include file="/includes/rodape.jsp" %>
    <script type="text/javascript">
        $(function () {            
            /* Validação dos campos do formulário */
            $("#formMovimentacao").validate({
                errorPlacement: function(error, element) {
                $( element )
                    .closest( "form" )
                        .find( "label[for='" + element.attr( "name" ) + "']" )
                            .append( error );                
                },
                errorElement: "span",
                rules: {
                    descricao: "required",
                    valor: "required",
                    data: "required"
                },
                messages: {
                    descricao: "Por favor, preencha a descrição",
                    valor: "Por favor, preencha o valor",
                    data: "Por favor, preencha a data"
                }
            });
        });            
        <c:if test="${movimentacao.tipoMovimentacao.codigo != null }">            
            selectValorDropdownList(${movimentacao.tipoMovimentacao.codigo}, 'tipoMovimentacao');            
        </c:if>
    </script>    
</body>
</html>