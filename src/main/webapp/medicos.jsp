<%@page import="com.mycompany.sistemadeclinica.models.Medico"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <title>Médicos - Sistema de Clínica</title>
    </head>
    <body>
        <div class="container mt-5">
            <%
                List<Medico> medicos = (List) session.getAttribute("medicos");
                String msg = (String) session.getAttribute("msg");

                if (msg != null) {
            %>
            <div class="alert alert-success alert-dismissible fade show" role="alert">
                <%= msg%>
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
            <%
                    session.removeAttribute("msg");
                }
            %>

            <h1>Médicos Cadastrados</h1>
            <a href="index.html" class="btn btn-secondary mb-3">Voltar</a>
            <a href="#" class="btn btn-success mb-3"
               data-bs-toggle="modal" data-bs-target="#modalCadastro">Cadastrar Novo Médico</a>
            
            <%
                if (medicos == null || medicos.isEmpty()) {
            %>
            <div class="alert alert-warning">Não existem médicos cadastrados</div>
            <%
            } else {
            %>
            
            <table class="table table-striped table-hover">
                <thead>
                    <tr>
                        <th>CRM</th>
                        <th>Nome</th>
                        <th>Especialidade</th>
                        <th>Contato</th>
                        <th>Ações</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        for (Medico m : medicos) {
                    %>
                    <tr>
                        <td><%= m.getCrm()%></td>
                        <td><%= m.getNome()%></td>
                        <td><%= m.getEspecialidade()%></td>
                        <td><%= m.getContato()%></td>
                        <td>
                            <a href="Medico?crm=<%= m.getCrm()%>&op=alterar"
                               class="btn btn-info btn-sm">Alterar</a>
                            <a href="Medico?crm=<%= m.getCrm()%>&op=deletar"
                               class="btn btn-warning btn-sm"
                               onclick="return confirm('Deseja realmente deletar este médico?')">Deletar</a>
                        </td>
                    </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
            <%
                }
            %>

            <div class="modal fade" id="modalCadastro" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Cadastro de Médico</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <%@include file="cadastromedico.jsp" %>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>

    </body>
</html>
