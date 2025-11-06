<%@page import="com.mycompany.sistemadeclinica.models.IndicadorExame"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastro de Indicador de Exame</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
        
        <h1>${(requestScope.indicadorExame ne null)?'Alterar':'Cadastro de novo'} indicador de exame</h1>
        
        <form method="post" action="IndicadorExame">
            ${(requestScope.indicadorExame ne null)?'<input type="hidden" name="op" value="alterar"/>':''}
            
            <div class="mb-3">
                <label for="codigo" class="form-label">Código:</label>
                <input type="number" class="form-control" id="codigo" name="codigo"
                       ${(requestScope.indicadorExame ne null)?'readonly="true" value="'
                         .concat(requestScope.indicadorExame.codigo).concat('"'):''} 
                       required/>
            </div>
            
            <div class="mb-3">
                <label for="indicador" class="form-label">Indicador:</label>
                <input type="text" class="form-control" id="indicador" name="indicador" 
                       value="${(requestScope.indicadorExame ne null)?requestScope.indicadorExame.indicador:''}"
                       required/>
            </div>
            
            <div class="mb-3">
                <label for="descricao" class="form-label">Descrição:</label>
                <textarea class="form-control" id="descricao" name="descricao" rows="3" required>${(requestScope.indicadorExame ne null)?requestScope.indicadorExame.descricao:''}</textarea>
            </div>
            
            <div class="mb-3">
                <label for="minValorReferencia" class="form-label">Valor Mínimo de Referência:</label>
                <input type="text" class="form-control" id="minValorReferencia" name="minValorReferencia" 
                       value="${(requestScope.indicadorExame ne null)?requestScope.indicadorExame.minValorReferencia:''}"
                       required/>
            </div>
            
            <div class="mb-3">
                <label for="maxValorReferencia" class="form-label">Valor Máximo de Referência:</label>
                <input type="text" class="form-control" id="maxValorReferencia" name="maxValorReferencia" 
                       value="${(requestScope.indicadorExame ne null)?requestScope.indicadorExame.maxValorReferencia:''}"
                       required/>
            </div>
            
            <button type="submit" class="btn btn-primary">
                ${(requestScope.indicadorExame ne null)?'Alterar':'Cadastrar'}
            </button>
        </form>
    </body>
</html>
