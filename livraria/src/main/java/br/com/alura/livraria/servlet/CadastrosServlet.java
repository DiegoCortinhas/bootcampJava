package br.com.alura.livraria.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.alura.livraria.dao.CadastroDao;
import br.com.alura.livraria.factory.ConnectionFactory;
import br.com.alura.livraria.modelo.Cadastro;

/**
 * Servlet implementation class CadastrosServlet
 */
@WebServlet("/cadastros")
public class CadastrosServlet extends HttpServlet {
	
	private CadastroDao dao;

    
    public CadastrosServlet() {
    	this.dao = new CadastroDao(new ConnectionFactory().getConnection());
    }

	
    @Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
    	req.setAttribute("cadastros", dao.listar());
    	req.getRequestDispatcher("/WEB-INF/jsp/cadastros.jsp")
		.forward(req, res);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String nome = req.getParameter("nome");
			String email = req.getParameter("email");
			LocalDate data =  LocalDate.parse(req.getParameter("data"),
					DateTimeFormatter.ofPattern("dd/MM/yyyy"));
			String miniCV = req.getParameter("miniCV");
			
			
			Cadastro cadastro = new Cadastro(
					nome,
					email,
					data,
					miniCV);
			
			dao.cadastrar(cadastro);
			
			//como se estivesse fazendo uma requisicao Get para transacoes
			resp.sendRedirect("cadastros");
		}catch(NumberFormatException e){
			resp.sendRedirect("cadastros?erro= campo invalido");
		}
	}

}
