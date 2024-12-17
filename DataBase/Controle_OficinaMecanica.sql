CREATE TABLE IF NOT EXISTS `Clientes` (
	`ID_Cliente` int NOT NULL,
	`Nome_Cliente` varchar(255) NOT NULL DEFAULT '100',
	`CPF` varchar(255) NOT NULL DEFAULT '14',
	`Endereco` varchar(255) NOT NULL DEFAULT '255',
	`Data_Nascimento` date NOT NULL,
	`Email` varchar(255) NOT NULL DEFAULT '100',
	`Telefone` varchar(255) NOT NULL DEFAULT '15',
	`Data_Cadastro` date NOT NULL,
	`Autorizacao` boolean NOT NULL,
	`Observacoes` text,
	PRIMARY KEY (`ID_Cliente`)
);

CREATE TABLE IF NOT EXISTS `Veiculos` (
	`ID_Veiculo` int NOT NULL,
	`ID_Equipe` int NOT NULL,
	`Modelo` varchar(255) NOT NULL DEFAULT '100',
	`Marca` varchar(255) NOT NULL DEFAULT '100',
	`Ano` int NOT NULL,
	`Chassi` varchar(255) NOT NULL DEFAULT '20',
	`Cor` varchar(255) NOT NULL DEFAULT '30',
	`Km_atual` int NOT NULL,
	`Observacoes` text,
	`Placa` varchar(255) NOT NULL DEFAULT '10',
	PRIMARY KEY (`ID_Veiculo`)
);

CREATE TABLE IF NOT EXISTS `Mecanicos` (
	`ID_Mecanico` int NOT NULL,
	`ID_Equipe` int NOT NULL DEFAULT '100',
	`Endereco` varchar(255) NOT NULL DEFAULT '255',
	`Especialidade` varchar(255) NOT NULL DEFAULT '100',
	`Observacoes` text,
	PRIMARY KEY (`ID_Mecanico`)
);

CREATE TABLE IF NOT EXISTS `Ordens_Servico` (
	`ID_OS` int NOT NULL,
	`Data_Emissao` date NOT NULL,
	`Valor_Total` decimal(10,0) NOT NULL,
	`Status` varchar(255) NOT NULL DEFAULT '50',
	`Data_Conclusao` date,
	`Observacoes` text,
	PRIMARY KEY (`ID_OS`)
);

CREATE TABLE IF NOT EXISTS `Pagamentos` (
	`ID_Pagamento` int NOT NULL,
	`ID_OS` int NOT NULL,
	`ID_Cliente` int NOT NULL,
	`Forma_Pagamento` varchar(255) NOT NULL DEFAULT '50',
	`Data_Pagamento` date NOT NULL,
	`Valor_Pago` decimal(10,0) NOT NULL,
	`Metodo_Pagamento` varchar(255) NOT NULL DEFAULT '50',
	`Status` varchar(255) NOT NULL DEFAULT '50',
	`Observacoes` text,
	PRIMARY KEY (`ID_Pagamento`)
);

CREATE TABLE IF NOT EXISTS `Equipe` (
	`ID_Equipe` int NOT NULL,
	`ID_OS` int NOT NULL,
	`Especialidade` varchar(255) NOT NULL DEFAULT '100',
	`Status` varchar(255) NOT NULL DEFAULT '50',
	`Data_Execucao` date NOT NULL,
	`Avaliacao` text NOT NULL,
	PRIMARY KEY (`ID_Equipe`)
);

CREATE TABLE IF NOT EXISTS `Mao_de_Obra` (
	`Valor_Por_Peca` int AUTO_INCREMENT NOT NULL UNIQUE,
	`Valor_Total` decimal(10,0) NOT NULL,
	PRIMARY KEY (`Valor_Por_Peca`)
);


ALTER TABLE `Veiculos` ADD CONSTRAINT `Veiculos_fk1` FOREIGN KEY (`ID_Equipe`) REFERENCES `Equipe`(`ID_Equipe`);
ALTER TABLE `Mecanicos` ADD CONSTRAINT `Mecanicos_fk1` FOREIGN KEY (`ID_Equipe`) REFERENCES `Equipe`(`ID_Equipe`);

ALTER TABLE `Pagamentos` ADD CONSTRAINT `Pagamentos_fk1` FOREIGN KEY (`ID_OS`) REFERENCES `Ordens_Servico`(`ID_OS`);

ALTER TABLE `Pagamentos` ADD CONSTRAINT `Pagamentos_fk2` FOREIGN KEY (`ID_Cliente`) REFERENCES `Clientes`(`ID_Cliente`);
ALTER TABLE `Equipe` ADD CONSTRAINT `Equipe_fk1` FOREIGN KEY (`ID_OS`) REFERENCES `Ordens_Servico`(`ID_OS`);
ALTER TABLE `Mao_de_Obra` ADD CONSTRAINT `Mao_de_Obra_fk1` FOREIGN KEY (`Valor_Total`) REFERENCES `Ordens_Servico`(`Valor_Total`);