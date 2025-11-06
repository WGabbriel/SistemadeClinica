<%@page import="com.mycompany.sistemadeclinica.models.Medico"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastro de Médico</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
        
        <h1>${(requestScope.medico ne null)?'Alterar':'Cadastro de novo'} médico</h1>
        
        <form method="post" action="Medico">
            ${(requestScope.medico ne null)?'<input type="hidden" name="op" value="alterar"/>':''}
            
            <div class="mb-3">
                <label for="crm" class="form-label">CRM:</label>
                <input type="text" class="form-control" id="crm" name="crm"
                       ${(requestScope.medico ne null)?'readonly="true" value="'
                         .concat(requestScope.medico.crm).concat('"'):''} 
                       required/>
            </div>
            
            <div class="mb-3">
                <label for="nome" class="form-label">Nome:</label>
                <input type="text" class="form-control" id="nome" name="nome" 
                       value="${(requestScope.medico ne null)?requestScope.medico.nome:''}"
                       required/>
            </div>
            
            <div class="mb-3">
                <label for="especialidade" class="form-label">Especialidade:</label>
                <input type="text" class="form-control" id="especialidade" name="especialidade" 
                       value="${(requestScope.medico ne null)?requestScope.medico.especialidade:''}"
                       required/>
            </div>
            
            <div class="mb-3">
                <label for="contato" class="form-label">Contato:</label>
                <input type="text" class="form-control" id="contato" name="contato" 
                       value="${(requestScope.medico ne null)?requestScope.medico.contato:''}"
                       required/>
            </div>
            
            <button type="submit" class="btn btn-primary">
                ${(requestScope.medico ne null)?'Alterar':'Cadastrar'}
            </button>
        </form>
    </body>
</html>
