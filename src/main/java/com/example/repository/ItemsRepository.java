package com.example.repository;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.example.domain.Items;

@Repository
@Transactional

public class ItemsRepository {
	
	@Autowired
	private NamedParameterJdbcTemplate template;
	
	private static final RowMapper<Items> items_rowMapper = (rs,i) -> {
		Items items = new Items();
		items.setItemId(rs.getInt("itemId"));
		items.setItemName(rs.getString("itemName"));
		items.setPrice(rs.getInt("price"));
		items.setBrandName(rs.getString("brandName"));
		items.setImagePath(rs.getString("imagepath"));
		return items;		
	};
	
//	itemすべて取得
	public List<Items> findItems(){
		String sql = "SELECT itemId,itemName,price,brandName,imagepath from items";
		List<Items> itemsList = template.query(sql,items_rowMapper);
		return itemsList;
	}
	

	
	
	
}
