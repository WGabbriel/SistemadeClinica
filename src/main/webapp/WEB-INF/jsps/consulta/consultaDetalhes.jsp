<%@page contentType="text/html" pageEncoding="UTF-8" %>
  <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    <!DOCTYPE html>
    <html lang="pt-BR">

    <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <title>Detalhes da Consulta</title>
      <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>

    <body>
      <div class="container mt-4">
        <h2>Detalhes da Consulta</h2>
        <a href="consultas" class="btn btn-secondary mb-3">Voltar</a>

        <c:choose>
          <c:when test="${consulta.prontuario != null}">
            <button class="btn btn-primary mb-3">Ver Prontuário</button>
          </c:when>
          <c:otherwise>
            <button class="btn btn-success mb-3">Adicionar Prontuário</button>
          </c:otherwise>
        </c:choose>
      </div>
      <div class="card mb-3">
        <div class="card-header">Paciente</div>
        <div class="card-body">
          <p><strong>Nome:</strong> ${consulta.paciente.nome}</p>
          <p><strong>CPF:</strong> ${consulta.paciente.cpf}</p>
          <p><strong>Endereço:</strong> ${consulta.paciente.endereco}</p>
          <p><strong>Contato:</strong> ${consulta.paciente.contato}</p>
          <p><strong>Plano de Saúde:</strong> ${consulta.paciente.planoSaude}</p>
        </div>
      </div>

      <div class="card mb-3">
        <div class="card-header">Consulta</div>
        <div class="card-body">
          <p><strong>Código:</strong> ${consulta.codigo}</p>
          <p><strong>Data:</strong> ${consulta.dataHora}</p>
          <p><strong>Data da Volta:</strong> ${consulta.dataHoraVolta}</p>
          <p><strong>Observações:</strong> ${consulta.observacao}</p>
        </div>
      </div>


      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    </body>

    </html>