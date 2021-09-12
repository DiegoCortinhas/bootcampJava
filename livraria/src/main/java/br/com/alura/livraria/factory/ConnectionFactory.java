package br.com.alura.livraria.factory;

import br.com.alura.livraria.dao.CadastroDao;
import java.sql.Connection;
import java.sql.DriverManager;
import javax.management.RuntimeErrorException;


public class ConnectionFactory {
	public Connection getConnection() {
		try {

			String url = "jdbc:mysql://localhost:3306/livraria?useTimezone=true&serverTimezone=UTC";
			String username = "root";
			String password = "admin";

			// Para forçar o carregamento do driver da class Mysql
			Class.forName("com.mysql.cj.jdbc.Driver");
			// Tomcat não carrega automaticamente o driver do Jdbc

			Connection conexao = DriverManager.getConnection(url, username, password);
			return conexao;

		} catch (Exception e) {
			throw new RuntimeException(e);
		}

		
	}
}
