<%@page import="com.mycompany.sistemadeclinica.models.Medicamento"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastro de Medicamento</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
        
        <h1>${(requestScope.medicamento ne null)?'Alterar':'Cadastro de novo'} medicamento</h1>
        
        <form method="post" action="Medicamento">
            ${(requestScope.medicamento ne null)?'<input type="hidden" name="op" value="alterar"/>':''}
            
            <div class="mb-3">
                <label for="codigo" class="form-label">Código:</label>
                <input type="number" class="form-control" id="codigo" name="codigo"
                       ${(requestScope.medicamento ne null)?'readonly="true" value="'
                         .concat(requestScope.medicamento.codigo).concat('"'):''} 
                       required/>
            </div>
            
            <div class="mb-3">
                <label for="nome" class="form-label">Nome:</label>
                <input type="text" class="form-control" id="nome" name="nome" 
                       value="${(requestScope.medicamento ne null)?requestScope.medicamento.nome:''}"
                       required/>
            </div>
            
            <div class="mb-3">
                <label for="dosagem" class="form-label">Dosagem:</label>
                <input type="number" class="form-control" id="dosagem" name="dosagem" 
                       value="${(requestScope.medicamento ne null)?requestScope.medicamento.dosagem:''}"
                       required/>
            </div>
            
            <div class="mb-3">
                <label for="tipoDosagem" class="form-label">Tipo de Dosagem:</label>
                <input type="text" class="form-control" id="tipoDosagem" name="tipoDosagem" 
                       value="${(requestScope.medicamento ne null)?requestScope.medicamento.tipoDosagem:''}"
                       placeholder="Ex: mg, ml, comprimidos"
                       required/>
            </div>
            
            <div class="mb-3">
                <label for="descricao" class="form-label">Descrição:</label>
                <textarea class="form-control" id="descricao" name="descricao" rows="3" required>${(requestScope.medicamento ne null)?requestScope.medicamento.descricao:''}</textarea>
            </div>
            
            <div class="mb-3">
                <label for="observacao" class="form-label">Observação:</label>
                <textarea class="form-control" id="observacao" name="observacao" rows="2">${(requestScope.medicamento ne null)?requestScope.medicamento.observacao:''}</textarea>
            </div>
            
            <button type="submit" class="btn btn-primary">
                ${(requestScope.medicamento ne null)?'Alterar':'Cadastrar'}
            </button>
        </form>
    </body>
</html>
