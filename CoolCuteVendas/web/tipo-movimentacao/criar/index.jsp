<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Cadastro de Tipo de Movimentação - Cool & Cute - Vendas</title>
    <%-- INCLUDE DO TOPO --%>
    <%@include file="/includes/topo.jsp" %>
</head>
<body>
    <%-- INCLUDE DO MENU --%>
    <%@include file="/includes/menu.jsp" %>
    <!-- CONTEÚDO -->
    <div class="container content">
        <h2>Cadastro de Tipo de Movimentação</h2>
        <hr>
        <form method="post" action="javascript:void(0);" id="formTipoMovimentacao">
            <div class="row">
                <div class="form-group col-md-6 col-sm-6">
                    <label for="txtDescricao">Descrição</label>
                    <input type="text" class="form-control" name="txtDescricao" />
                </div>
                <div class="form-group col-md-6 col-sm-6">
                    <label for="slcOperacao">Operação</label>
                    <select class="form-control">
                        <option value="true">Entrada</option>
                        <option value="false">Saída</option>
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
        $("#formTipoMovimentacao").validate({
            errorPlacement: function(error, element) {
            $( element )
                .closest( "form" )
                    .find( "label[for='" + element.attr( "name" ) + "']" )
                        .append( error );                
            },
            errorElement: "span",
            rules: {
                txtDescricao: "required"
            },
            messages: {
                txtDescricao: "Por favor, preencha a descrição"
            }     
        });
    </script>
</body>
</html>