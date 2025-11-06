<%@page import="com.mycompany.sistemadeclinica.models.Medicamento"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <title>Medicamentos - Sistema de Clínica</title>
    </head>
    <body>
        <div class="container mt-5">
            <%
                List<Medicamento> medicamentos = (List) session.getAttribute("medicamentos");
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

            <h1>Medicamentos Cadastrados</h1>
            <a href="index.html" class="btn btn-secondary mb-3">Voltar</a>
            <a href="#" class="btn btn-success mb-3"
               data-bs-toggle="modal" data-bs-target="#modalCadastro">Cadastrar Novo Medicamento</a>
            
            <%
                if (medicamentos == null || medicamentos.isEmpty()) {
            %>
            <div class="alert alert-warning">Não existem medicamentos cadastrados</div>
            <%
            } else {
            %>
            
            <table class="table table-striped table-hover">
                <thead>
                    <tr>
                        <th>Código</th>
                        <th>Nome</th>
                        <th>Dosagem</th>
                        <th>Tipo</th>
                        <th>Descrição</th>
                        <th>Ações</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        for (Medicamento m : medicamentos) {
                    %>
                    <tr>
                        <td><%= m.getCodigo()%></td>
                        <td><%= m.getNome()%></td>
                        <td><%= m.getDosagem()%></td>
                        <td><%= m.getTipoDosagem()%></td>
                        <td><%= m.getDescricao()%></td>
                        <td>
                            <a href="Medicamento?codigo=<%= m.getCodigo()%>&op=alterar"
                               class="btn btn-info btn-sm">Alterar</a>
                            <a href="Medicamento?codigo=<%= m.getCodigo()%>&op=deletar"
                               class="btn btn-warning btn-sm"
                               onclick="return confirm('Deseja realmente deletar este medicamento?')">Deletar</a>
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
                            <h5 class="modal-title" id="exampleModalLabel">Cadastro de Medicamento</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <%@include file="cadastromedicamento.jsp" %>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>

    </body>
</html>
