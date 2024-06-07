CREATE DATABASE dbManagementPersonal;
GO

USE dbManagementPersonal;
GO

CREATE TABLE tabUsuario(
    codigo int primary key identity(1,1),
    usuario varchar(200),
    senha varchar(200),
    nome varchar(200)
);
GO

CREATE TABLE tabContaCorrente(
    codigo int primary key identity(1,1),
    agencia varchar(200),
    usuarioCodigo int foreign key (UsuarioCodigo) references tabUsuario(codigo),
    saldo decimal(18,2)
);
GO

CREATE TABLE tabCartao(
    codigo int primary key identity(1,1),
    formaPagamento varchar(200),
    dataValidade datetime,
    bandeiraCartao varchar(200),
    CVV varchar(200),
    limite decimal(18,2),
    contaCorrenteCodigo int foreign key(ContaCorrenteCodigo) references tabContaCorrente(codigo)
);
GO

CREATE TABLE tabModalidade(
    codigo int primary key identity(1,1),
    nomeModalidade varchar(200)
);
GO

CREATE TABLE tabHistoricoTransacao(
    codigo int primary key identity(1,1),
    dataTransacao datetime,
    valorTransacao decimal(18,2),
    formaPagamento varchar(200),
    contaCorrenteCodigo int foreign key(contaCorrenteCodigo) references tabContaCorrente(codigo),
    modalidadeCodigo int foreign key(modalidadeCodigo) references tabModalidade(codigo),
    titulo varchar(200),
    descricao varchar(200),
    usuarioCodigo int foreign key(usuarioCodigo) references tabUsuario(codigo),
    cvvCartao varchar(200),
    isDeposito bit
);
GO

INSERT INTO tabModalidade (nomeModalidade) VALUES 
    ('Saúde'),
    ('Transporte'),
    ('Alimentação'),
    ('Investimentos'),
    ('Lazer'),
    ('Compras'),
    ('Outra...');
