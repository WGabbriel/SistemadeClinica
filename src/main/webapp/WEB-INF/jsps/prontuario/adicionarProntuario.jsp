<%@ page contentType="text/html;charset=UTF-8" language="java" %>
  <!DOCTYPE html>
  <html lang="pt-BR">

  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Adicionar Prontuário</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  </head>

  <body>
    <div class="container">
      <form action="prontuario" method="post">
        <input type="hidden" name="op" value="add">
        <input type="hidden" name="consulta" value="${consulta.codigo}">
        <div class="mb-3">
          <label for="descricao" class="form-label">Descrição</label>
          <textarea id="descricao" name="descricao" class="form-control" rows="4" required
            placeholder="Descreva a descrição do prontuário"></textarea>
        </div>
        <div class="mb-3">
          <label for="observacao" class="form-label">Observações</label>
          <textarea id="observacao" name="observacao" class="form-control" rows="3"
            placeholder="Observações"></textarea>
        </div>
        <button type="button" class="btn btn-secondary" onclick="window.history.back()">Cancelar</button>
        <button type="submit" class="btn btn-success" onclick="window.history.back()">Salvar</button>
      </form>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
  </body>

  </html>