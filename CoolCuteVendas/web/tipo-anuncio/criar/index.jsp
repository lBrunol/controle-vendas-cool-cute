<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Cadastro de Tipos de Anúncios - Cool & Cute - Vendas</title>
    <%-- INCLUDE DO TOPO --%>
    <%@include file="/includes/topo.jsp" %>
</head>
<body>
    <%-- INCLUDE DO MENU --%>
    <%@include file="/includes/menu.jsp" %>
    <!-- CONTEÚDO -->
    <div class="container content">
        <h2>Cadastro de Tipos de Anúncios</h2>
        <hr>
        <form method="post" action="/TipoAnuncioController" id="formTipoAnuncio">
            <div class="row">
                <div class="form-group col-md-6 col-sm-6">
                    <label for="txtDescricao">Descrição</label>
                    <input type="text" class="form-control" name="txtDescricao" />
                </div>            
                <div class="form-group col-md-6 col-sm-6">
                    <label for="txtPercentual">Percentual</label>
                    <input type="number" class="form-control" name="txtPercentual" onkeypress="return(apenasNumeros(event))" />
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
        $("#formTipoAnuncio").validate({
            errorPlacement: function(error, element) {
            $( element )
                .closest( "form" )
                    .find( "label[for='" + element.attr( "name" ) + "']" )
                        .append( error );                
            },
            errorElement: "span",
            rules: {
                txtDescricao: "required",
                txtPercentual: {
                    required: true,
                    number: true
                }
            },
            messages: {
                txtDescricao: "Por favor, preencha a descrição",
                txtPercentual: "Por favor, preencha o percentual"
            }     
        });
    </script>    
</body>
</html>