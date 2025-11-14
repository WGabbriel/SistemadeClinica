<%@page contentType="text/html" pageEncoding="UTF-8" %>
  <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!DOCTYPE html>
    <html lang="pt-BR">

    <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <title>Médico</title>
      <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>

    <body>
      <div class="container mt-4">
        <h2>Gerenciamento de Consultas</h2>

        <button class="btn btn-success mb-3" data-bs-toggle="modal" data-bs-target='#modalConsulta'>
          Marcar Nova Consulta
        </button>

        <table class="table table-striped">
          <tbody>
            <c:forEach var="consulta" items="${requestScope.consultas}">
              <tr>
                <td>${consulta.paciente.nome}</td>
                <td>${consulta.dataConsulta}</td>
                <td>${consulta.horario}</td>
                <td>${consulta.especialidade}</td>
                <td>
                  <span class="badge ${consulta.status == 'Agendada' ? 'bg-warning' : 'bg-success'}">
                    ${consulta.status}
                  </span>
                </td>
                <td>
                  <button class="btn btn-sm btn-primary">Editar</button>
                  <button class="btn btn-sm btn-danger">Cancelar</button>
                </td>
              </tr>
            </c:forEach>
          </tbody>
        </table>

        <!-- Modal para Marcar Consulta -->
        <div class="modal fade" id="modalConsulta" tabindex="-1" aria-labelledby="modalConsultaLabel"
          aria-hidden="true">
          <div class="modal-dialog modal-lg">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title" id="modalConsultaLabel">Marcar Nova Consulta</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
              </div>
              <div class="modal-body">
                <form method="post" action="consultas">
                  <div class="row">
                    <div class="col-md-6">
                      <div class="mb-3">
                        <label for="paciente" class="form-label">Paciente</label>
                        <select name="pacienteId" class="form-select" required>
                          <option value="">Selecione um paciente</option>
                          <c:forEach var="paciente" items="${requestScope.pacientes}">
                            <option value="${paciente.cpf}">${paciente.nome}</option>
                          </c:forEach>
                        </select>
                        <input type="hidden" name="medicoCrm" value="${sessionScope.medico.crm}">
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-md-6">
                      <div class="mb-3">
                        <label for="dataConsulta" class="form-label">Data da Consulta</label>
                        <input type="date" name="dataConsulta" class="form-control" required>
                      </div>
                    </div>
                    <div class="col-md-6">
                      <div class="mb-3">
                        <label for="dataHoraVolta" class="form-label">Data da Volta</label>
                        <input type="date" name="dataHoraVolta" class="form-control" required>
                      </div>
                    </div>
                  </div>
                  <div class="mb-3">
                    <label for="observacoes" class="form-label">Observações</label>
                    <textarea class="form-control" name="observacoes" rows="3"
                      placeholder="Observações adicionais sobre a consulta..."></textarea>
                  </div>
                  <div class="d-flex justify-content-end">
                    <button type="button" class="btn btn-secondary me-2" data-bs-dismiss="modal">Cancelar</button>
                    <button type="submit" class="btn btn-primary">Marcar Consulta</button>
                  </div>
                </form>
              </div>
            </div>
          </div>
        </div>
      </div>

      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    </body>

    </html>