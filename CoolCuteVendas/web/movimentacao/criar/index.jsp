<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <h2>Cadastro de Movimentações</h2>
        <hr>
        <form method="post" action="javascript:void(0);" id="formMovimentacoes">
            <div class="row">
                <div class="form-group col-md-6 col-sm-6">
                    <label for="txtDescricao">Descrição</label>
                    <input type="text" class="form-control" name="txtDescricao" />
                </div>
                <div class="form-group col-md-6 col-sm-6">
                    <label for="txtData">Data</label>
                    <input type="date" class="form-control" name="txtData" />
                </div>                
            </div>
            <div class="row">
                <div class="form-group col-md-6 col-sm-6">
                    <label for="txtValor">Valor</label>
                    <input type="text" class="form-control" name="txtValor" onkeypress="return(apenasNumeros(event))" onblur="atribuiTexto($(this),numeroParaMoeda($(this).val()))" />
                </div>
                <div class="form-group col-md-6 col-sm-6">
                    <label for="slcMovimentacao">Tipo de Movimentação</label>
                    <select class="form-control">
                        <option value="2">Outros Gastos</option>
                        <option value="6">Reembolso</option>
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
                    <button type="button" class="btn btn-vermelho margin-std-top"><i class="fa fa-fw fa-chevron-left"></i> Voltar</button>
                </div>
            </div>
        </form>
    </div>    
    <%-- INCLUDE DO RODAPÉ --%>
    <%@include file="/includes/rodape.jsp" %>
    <script type="text/javascript">
        /* Validação dos campos do formulário */
        $("#formMovimentacoes").validate({
            errorPlacement: function(error, element) {
            $( element )
                .closest( "form" )
                    .find( "label[for='" + element.attr( "name" ) + "']" )
                        .append( error );                
            },
            errorElement: "span",
            rules: {
                txtDescricao: "required",
                txtData: "required",
                txtValor: "required"
            },
            messages: {
                txtDescricao: "Por favor, preencha a descrição",
                txtData: "Por favor, preencha a data",
                txtValor: "Por favor, preencha o valor"
            }     
        });
    </script>    
</body>
</html>