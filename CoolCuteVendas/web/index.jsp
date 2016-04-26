<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Home - Cool & Cute - Vendas</title>
    <%-- INCLUDE DO TOPO --%>
    <%@include file="/includes/topo.jsp" %>
</head>
<body>
    <%-- INCLUDE DO MENU --%>
    <%@include file="/includes/menu.jsp" %>
    <!-- CONTEÚDO -->
    <div class="container content">
        <h1>Home</h1>
        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce sollicitudin neque a diam eleifend mattis congue laoreet est. In fringilla tincidunt volutpat. In eget interdum orci. Fusce porttitor imperdiet tortor, sit amet vehicula arcu sagittis vel. In vitae lacus arcu. Duis commodo maximus metus a dignissim. Aliquam sagittis lacus eu libero pretium, non ultricies sapien fermentum. Aliquam in lacinia odio, id blandit est. Praesent dignissim luctus risus lacinia placerat. Suspendisse blandit eleifend ante a semper. Ut sem turpis, laoreet ac facilisis eget, bibendum dictum purus. Donec eget risus nec turpis tincidunt tincidunt.</p>
        <form action="TipoAnuncioController">
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
            <input type="submit" class="form-control" value="enviar" />
        </form>
    </div>
    <%-- INCLUDE DO RODAPÉ --%>
    <%@include file="/includes/rodape.jsp" %>    
</body>
</html>