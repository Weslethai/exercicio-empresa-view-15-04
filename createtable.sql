use exercicioview;

create table Marcas (
  mrc_id			INT	 PRIMARY KEY	AUTO_INCREMENT,
  mrc_nome			varchar (50)	NOT	NULL,
  mrc_nacionalidade varchar (50)	NOT	NULL
);
create table Produtos (
  prd_id			INT	PRIMARY	KEY	AUTO_INCREMENT,
  prd_nome			varchar (50)	NOT	NULL,
  prd_qtd_estoque	int		NOT	NULL		DEFAULT 0,
  prd_estoque_min	int		NOT	NULL 		DEFAULT 0,		
  prd_data_fab		timestamp  default now(),
  prd_perecivel		boolean,
  prd_valor			decimal (9,2),
  prd_marca_id		int,
  CONSTRAINT fk_marcas	FOREIGN KEY(prd_marca_id) REFERENCES Marcas(mrc_id)
);
CREATE table Fornecedores (
  frn_id	INT PRIMARY KEY	AUTO_INCREMENT,
  frn_nome	varchar (50)	not null,
  frn_email	varchar (50)	not null
  );
  
  CREATE table Produto_fornecedor (
  pf_prod_id int	REFERENCES Produtos (prd_id),
  pf_forn_id int  REFERENCES Fornecedores (frn_id),
  PRIMARY KEY (pf_prod_id,pf_forn_id)
  );