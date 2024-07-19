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

CREATE TABLE tabLogExcecao (
    codigo bigint primary key identity(1,1),
    dataHora datetime,
    referencia varchar(200),
    excecao varchar(200)
);
GO

INSERT tabUsuario VALUES ('KaioPereira','teste','Kaio')
GO

INSERT INTO tabModalidade (nomeModalidade) VALUES 
    ('Saúde'),
    ('Transporte'),
    ('Alimentação'),
    ('Investimentos'),
    ('Lazer'),
    ('Compras'),
    ('Outra...');
    GO

INSERT tabContaCorrente VALUES ('Santander', 1, 500)
GO

INSERT tabCartao VALUES ('debito','2024-05-30T00:00:00','Nubank','123456789',1000, 1)
GO

INSERT tabHistoricoTransacao VALUES ('2024-07-16T21:13:27.587', 600, 'Pix', 1, 4, 'Primeiro Deposito', 'deposito teste', 1, '123456789', 1) 
GO    

INSERT tabLogExcecao VALUES('2024-07-16T21:13:27.587', 'NOME TELA - TESTE', 'PRIMARY EXCEPTION TEST')

