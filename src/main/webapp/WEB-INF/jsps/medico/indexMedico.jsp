<%@page contentType="text/html" pageEncoding="UTF-8" %>
  <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!DOCTYPE html>
    <html lang="pt-BR">

    <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <title>Gerenciamento de Consultas</title>
      <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>

    <body>
      <div class="container mt-4">
        <h2>Gerenciamento de Consultas</h2>

        <form class="d-flex justify-content-between mb-3">
          <button class="btn btn-success mb-3" data-bs-toggle="modal" data-bs-target='#modalConsulta' type="button">
            Marcar Nova Consulta
          </button>
          <button formmethod="post" formaction="loginMedico" name="op" value="logout" class="btn btn-danger mb-3"
            type="submit">
            Logout
          </button>
        </form>

        <ul class="nav nav-tabs mb-3">
          <li class="nav-item">
            <a class="nav-link active" href="#" data-section="consultasMarcadas">Consultas Marcadas</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#" data-section="consultasRealizadas">Consultas Realizadas</a>
          </li>
        </ul>

        <jsp:include page="../consulta/consultaMarcada.jsp" />
        <jsp:include page="../consulta/consultaRealizada.jsp" />
      </div>

      <div class="modal fade" id="modalConsulta" tabindex="-1">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title">Marcar Nova Consulta</h5>
              <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <div class="modal-body">
              <form method="post" action="consultas">
                <div class="mb-3">
                  <label class="form-label">Paciente</label>
                  <select name="pacienteId" class="form-select" required>
                    <option value="">Selecione um paciente</option>
                    <c:forEach var="paciente" items="${requestScope.pacientes}">
                      <option value="${paciente.cpf}">${paciente.nome}</option>
                    </c:forEach>
                  </select>
                </div>
                <div class="mb-3">
                  <label class="form-label">Data da Consulta</label>
                  <input type="date" name="dataConsulta" class="form-control" required>
                </div>
                <div class="mb-3">
                  <label class="form-label">Data da Volta</label>
                  <input type="date" name="dataHoraVolta" class="form-control" required>
                </div>
                <div class="mb-3">
                  <label class="form-label">Observações</label>
                  <textarea class="form-control" name="observacoes" rows="3"></textarea>
                </div>
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                <button type="submit" class="btn btn-primary">Marcar Consulta</button>
              </form>
            </div>
          </div>
        </div>
      </div>

      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
      <script>
        document.querySelectorAll('.nav-link').forEach(link => {
          link.addEventListener('click', function (e) {
            e.preventDefault();
            document.querySelectorAll('.nav-link').forEach(l => l.classList.remove('active'));
            document.querySelectorAll('#consultasMarcadas, #consultasRealizadas').forEach(s => s.classList.add('d-none'));
            this.classList.add('active');
            document.getElementById(this.getAttribute('data-section')).classList.remove('d-none');
          });
        });
      </script>
    </body>

    </html>