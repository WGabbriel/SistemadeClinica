<%@page import="com.mycompany.sistemadeclinica.models.Paciente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastro de Paciente</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
        
        <h1>${(requestScope.paciente ne null)?'Alterar':'Cadastro de novo'} paciente</h1>
        
        <form method="post" action="Paciente">
            ${(requestScope.paciente ne null)?'<input type="hidden" name="op" value="alterar"/>':''}
            
            <div class="mb-3">
                <label for="cpf" class="form-label">CPF:</label>
                <input type="text" class="form-control" id="cpf" name="cpf"
                       ${(requestScope.paciente ne null)?'readonly="true" value="'
                         .concat(requestScope.paciente.cpf).concat('"'):''} 
                       required/>
            </div>
            
            <div class="mb-3">
                <label for="nome" class="form-label">Nome:</label>
                <input type="text" class="form-control" id="nome" name="nome" 
                       value="${(requestScope.paciente ne null)?requestScope.paciente.nome:''}"
                       required/>
            </div>
            
            <div class="mb-3">
                <label for="endereco" class="form-label">Endereço:</label>
                <input type="text" class="form-control" id="endereco" name="endereco" 
                       value="${(requestScope.paciente ne null)?requestScope.paciente.endereco:''}"
                       required/>
            </div>
            
            <div class="mb-3">
                <label for="contato" class="form-label">Contato:</label>
                <input type="text" class="form-control" id="contato" name="contato" 
                       value="${(requestScope.paciente ne null)?requestScope.paciente.contato:''}"
                       required/>
            </div>
            
            <div class="mb-3">
                <label for="planoSaude" class="form-label">Plano de Saúde:</label>
                <input type="text" class="form-control" id="planoSaude" name="planoSaude" 
                       value="${(requestScope.paciente ne null)?requestScope.paciente.planoSaude:''}"/>
            </div>
            
            <button type="submit" class="btn btn-primary">
                ${(requestScope.paciente ne null)?'Alterar':'Cadastrar'}
            </button>
        </form>
    </body>
</html>
