<%@page import="com.mycompany.sistemadeclinica.models.Paciente"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <title>Pacientes - Sistema de Clínica</title>
    </head>
    <body>
        <div class="container mt-5">
            <%
                List<Paciente> pacientes = (List) session.getAttribute("pacientes");

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

            <h1>Pacientes Cadastrados</h1>
            <a href="index.html" class="btn btn-secondary mb-3">Voltar</a>
            <a href="#" class="btn btn-success mb-3"
               data-bs-toggle="modal" data-bs-target="#modalCadastro">Cadastrar Novo Paciente</a>
            
            <%
                if (pacientes == null || pacientes.isEmpty()) {
            %>
            <div class="alert alert-warning">Não existem pacientes cadastrados</div>
            <%
            } else {
            %>
            
            <table class="table table-striped table-hover">
                <thead>
                    <tr>
                        <th>CPF</th>
                        <th>Nome</th>
                        <th>Endereço</th>
                        <th>Contato</th>
                        <th>Plano de Saúde</th>
                        <th>Ações</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        for (Paciente p : pacientes) {
                    %>
                    <tr>
                        <td><%= p.getCpf()%></td>
                        <td><%= p.getNome()%></td>
                        <td><%= p.getEndereco()%></td>
                        <td><%= p.getContato()%></td>
                        <td><%= p.getPlanoSaude() != null ? p.getPlanoSaude() : "Sem plano"%></td>
                        <td>
                            <a href="Paciente?cpf=<%= p.getCpf()%>&op=alterar"
                               class="btn btn-info btn-sm">Alterar</a>
                            <a href="Paciente?cpf=<%= p.getCpf()%>&op=deletar"
                               class="btn btn-warning btn-sm"
                               onclick="return confirm('Deseja realmente deletar este paciente?')">Deletar</a>
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
                            <h5 class="modal-title" id="exampleModalLabel">Cadastro de Paciente</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <%@include file="cadastropaciente.jsp" %>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

    </body>
</html>
