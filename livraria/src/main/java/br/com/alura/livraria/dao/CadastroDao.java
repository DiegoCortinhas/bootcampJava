package br.com.alura.livraria.dao;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;


import br.com.alura.livraria.modelo.Cadastro;

public class CadastroDao {
private Connection conexao;
	
	public CadastroDao(Connection conexao) {
		this.conexao = conexao;
	}

	//Metodo recebe Transacao e insere no BD
	public void cadastrar (Cadastro cadastro) {
		try {
								
			String sql = "insert into cadastros(nome, email, data, miniCV) values(?,?,?,?)";
			
			PreparedStatement ps = conexao.prepareStatement(sql);
			ps.setString(1, cadastro.getNome());
			ps.setString(2, cadastro.getEmail());
			ps.setDate(3, Date.valueOf(cadastro.getData()));
			ps.setString(4, cadastro.getMiniCV());
			
			ps.execute();
			
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	//Fazer select no BD
	public List<Cadastro> listar(){
		
		try {
						
			String sql = "select * from cadastros";
			PreparedStatement ps = conexao.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			
			List<Cadastro> cadastros = new ArrayList<>();
			
			
			//boolean true tem proximo registro - false nao tem
			while(rs.next()) {
				Cadastro cadastro = new Cadastro();
				
				cadastro.setNome(rs.getString("nome"));
				cadastro.setEmail(rs.getString("email"));
				cadastro.setData(rs.getDate("data").toLocalDate());
				cadastro.setMiniCV(rs.getString("miniCV"));
				
				cadastros.add(cadastro);
			}
			return cadastros;
			
		} catch (SQLException e) {
			throw new RuntimeException(e); //exceção nao checada (do Java e não precisa ficar fazendo o try catch) 
		}
		
		
	}
}
