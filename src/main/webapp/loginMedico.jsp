<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <%@page contentType="text/html" pageEncoding="UTF-8" %>

    <!DOCTYPE html>
    <html>

    <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
      <title>Login Médicos - Sistema de Clínica</title>
    </head>

    <body>
      <c:if test="${sessionScope.medicoLogado ne null}">
        <c:redirect url="loginMedico" />
      </c:if>

      <div class="container mt-5">
        <div class="row justify-content-center">
          <div class="col-md-6 col-lg-5">

            <c:if test="${sessionScope.msg ne null}">
              <div class="alert alert-${(sessionScope.svd eq 'ok')?'success':'danger'} alert-dismissible fade show"
                role="alert">
                ${sessionScope.msg}
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
              </div>
              <c:remove var="msg" scope="session" />
              <c:remove var="svd" scope="session" />
            </c:if>

            <div class="card shadow">
              <div class="card-body p-4">
                <h1 class="text-center mb-4">Login de Médicos</h1>

                <form method="post" action="loginMedico">
                  <input type="hidden" name="op" value="login" />

                  <div class="mb-3">
                    <label for="crm" class="form-label">CRM</label>
                    <input type="text" name="crm" id="crm" class="form-control" placeholder="Digite seu CRM" required />
                  </div>

                  <div class="mb-3">
                    <label for="password" class="form-label">Senha</label>
                    <input type="password" name="password" id="password" class="form-control"
                      placeholder="Digite sua senha" required />
                  </div>

                  <button type="submit" class="btn btn-primary w-100 mb-3">
                    Entrar
                  </button>

                  <div class="text-center">
                    <p class="mb-0">
                      Não possui cadastro?
                      <a href="#" data-bs-toggle="modal" data-bs-target="#modalCadastro">
                        Registre-se aqui
                      </a>
                    </p>
                  </div>
                </form>
              </div>
            </div>

          </div>
        </div>
      </div>

      <div class="modal fade" id="modalCadastro" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title" id="exampleModalLabel">Cadastro de Médico</h5>
              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
              <form method="post" action="loginMedico">
                <input type="hidden" name="op" value="cadastro" />

                <div class="mb-3">
                  <label for="crmCadastro" class="form-label">CRM:</label>
                  <input type="text" name="crm" id="crmCadastro" class="form-control" placeholder="Digite o CRM"
                    required />
                </div>

                <div class="mb-3">
                  <label for="nomeCadastro" class="form-label">Nome:</label>
                  <input type="text" name="nome" id="nomeCadastro" class="form-control"
                    placeholder="Digite o nome completo" required />
                </div>

                <div class="mb-3">
                  <label for="especialidadeCadastro" class="form-label">Especialidade:</label>
                  <input type="text" name="especialidade" id="especialidadeCadastro" class="form-control"
                    placeholder="Digite a especialidade" required />
                </div>

                <div class="mb-3">
                  <label for="contatoCadastro" class="form-label">Contato:</label>
                  <input type="text" name="contato" id="contatoCadastro" class="form-control"
                    placeholder="Digite telefone ou email" required />
                </div>

                <div class="mb-3">
                  <label for="senhaCadastro" class="form-label">Senha:</label>
                  <input type="password" name="password" id="senhaCadastro" class="form-control"
                    placeholder="Digite a senha" required />
                </div>

                <button type="submit" class="btn btn-primary">
                  Cadastrar
                </button>
              </form>
            </div>
          </div>
        </div>
      </div>

      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>

    </body>

    </html>