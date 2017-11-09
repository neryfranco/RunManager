-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: 09-Nov-2017 às 16:58
-- Versão do servidor: 5.7.19
-- PHP Version: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `runmanager`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `administrador`
--

DROP TABLE IF EXISTS `administrador`;
CREATE TABLE IF NOT EXISTS `administrador` (
  `email` varchar(45) NOT NULL,
  `senha` varchar(45) DEFAULT NULL,
  `Usuario_cpf` varchar(11) NOT NULL,
  PRIMARY KEY (`email`),
  KEY `fk_Administrador_Usuario1_idx` (`Usuario_cpf`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `atleta`
--

DROP TABLE IF EXISTS `atleta`;
CREATE TABLE IF NOT EXISTS `atleta` (
  `Usuario_cpf` varchar(11) NOT NULL,
  `pace` int(11) NOT NULL,
  `apelido` varchar(45) DEFAULT NULL,
  `email` varchar(60) DEFAULT NULL,
  `senha` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Usuario_cpf`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `boleto`
--

DROP TABLE IF EXISTS `boleto`;
CREATE TABLE IF NOT EXISTS `boleto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cpf` varchar(11) NOT NULL,
  `nomeCliente` varchar(45) DEFAULT NULL,
  `Pagamento_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Boleto_Pagamento1_idx` (`Pagamento_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `camisa`
--

DROP TABLE IF EXISTS `camisa`;
CREATE TABLE IF NOT EXISTS `camisa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tamanho` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cartaocredito`
--

DROP TABLE IF EXISTS `cartaocredito`;
CREATE TABLE IF NOT EXISTS `cartaocredito` (
  `numero` varchar(20) NOT NULL,
  `bandeira` varchar(20) DEFAULT NULL,
  `nomeTitular` varchar(45) DEFAULT NULL,
  `cpfTitular` varchar(11) DEFAULT NULL,
  `dataValidade` varchar(10) DEFAULT NULL,
  `codSeguranca` varchar(5) DEFAULT NULL,
  `numParcelas` int(11) DEFAULT NULL,
  `valorParcelas` double DEFAULT NULL,
  `Pagamento_id` int(11) NOT NULL,
  PRIMARY KEY (`numero`),
  KEY `fk_CartaoCredito_Pagamento1_idx` (`Pagamento_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `categoria`
--

DROP TABLE IF EXISTS `categoria`;
CREATE TABLE IF NOT EXISTS `categoria` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sexo` varchar(1) NOT NULL,
  `idadeIni` varchar(2) DEFAULT NULL,
  `idadeFim` varchar(2) DEFAULT NULL,
  `descricao` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `categoria`
--

INSERT INTO `categoria` (`id`, `sexo`, `idadeIni`, `idadeFim`, `descricao`) VALUES
(1, '1', '15', '25', 'Masculino 15-25'),
(2, '2', '15', '25', 'Feminino 15-25'),
(3, '1', '30', '40', 'Masculino 30-40'),
(4, '2', '30', '40', 'Feminino 30-40');

-- --------------------------------------------------------

--
-- Estrutura da tabela `chip`
--

DROP TABLE IF EXISTS `chip`;
CREATE TABLE IF NOT EXISTS `chip` (
  `numero` int(11) NOT NULL AUTO_INCREMENT,
  `tempoCorrida` time DEFAULT NULL,
  `Percurso_id` int(11) NOT NULL,
  PRIMARY KEY (`numero`),
  KEY `fk_Chip_Percurso1_idx` (`Percurso_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `corrida`
--

DROP TABLE IF EXISTS `corrida`;
CREATE TABLE IF NOT EXISTS `corrida` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) DEFAULT NULL,
  `localLargada` varchar(100) DEFAULT NULL,
  `localChegada` varchar(100) DEFAULT NULL,
  `horaLargada` varchar(10) DEFAULT NULL,
  `duracaoLim` int(11) DEFAULT NULL,
  `dataCorrida` varchar(10) DEFAULT NULL,
  `dataRetiradaKit` varchar(10) DEFAULT NULL,
  `localRetiradaKit` varchar(100) DEFAULT NULL,
  `numMaxInscritos` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `corrida`
--

INSERT INTO `corrida` (`id`, `nome`, `localLargada`, `localChegada`, `horaLargada`, `duracaoLim`, `dataCorrida`, `dataRetiradaKit`, `localRetiradaKit`, `numMaxInscritos`) VALUES
(1, 'KK', 'KK', 'KK', 'KK', 222, 'KK', 'KK', 'KK', 11),
(2, 'MMM', 'LL', 'LL', 'LL', 11, 'LL', 'LL', 'LL', 11);

-- --------------------------------------------------------

--
-- Estrutura da tabela `ingresso`
--

DROP TABLE IF EXISTS `ingresso`;
CREATE TABLE IF NOT EXISTS `ingresso` (
  `num_inscricao` int(11) NOT NULL,
  `Lote_id` int(11) NOT NULL,
  `Atleta_Usuario_cpf` varchar(11) NOT NULL,
  `Kit_id` int(11) NOT NULL,
  PRIMARY KEY (`num_inscricao`),
  KEY `fk_Ingresso_Lote1_idx` (`Lote_id`),
  KEY `fk_Ingresso_Atleta1_idx` (`Atleta_Usuario_cpf`),
  KEY `fk_Ingresso_Kit1_idx` (`Kit_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `kit`
--

DROP TABLE IF EXISTS `kit`;
CREATE TABLE IF NOT EXISTS `kit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Camisa_id` int(11) NOT NULL,
  `Chip_numero` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Kit_Camisa1_idx` (`Camisa_id`),
  KEY `fk_Kit_Chip1_idx` (`Chip_numero`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `list_percurso`
--

DROP TABLE IF EXISTS `list_percurso`;
CREATE TABLE IF NOT EXISTS `list_percurso` (
  `Corrida_id` int(11) NOT NULL,
  `Percurso_id` int(11) NOT NULL,
  PRIMARY KEY (`Corrida_id`),
  KEY `fk_List_Percurso_Corrida1_idx` (`Corrida_id`),
  KEY `fk_List_Percurso_Percurso1_idx` (`Percurso_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `list_tapetes`
--

DROP TABLE IF EXISTS `list_tapetes`;
CREATE TABLE IF NOT EXISTS `list_tapetes` (
  `Percurso_id` int(11) NOT NULL,
  `Tapete_id` int(11) NOT NULL,
  PRIMARY KEY (`Percurso_id`),
  KEY `fk_List_Tapetes_Tapete1_idx` (`Tapete_id`),
  KEY `fk_List_Tapetes_Percurso1_idx` (`Percurso_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `lote`
--

DROP TABLE IF EXISTS `lote`;
CREATE TABLE IF NOT EXISTS `lote` (
  `id` int(11) NOT NULL,
  `preco` double DEFAULT NULL,
  `dataLimite` varchar(10) DEFAULT NULL,
  `Corrida_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Lote_Corrida1_idx` (`Corrida_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `organizador`
--

DROP TABLE IF EXISTS `organizador`;
CREATE TABLE IF NOT EXISTS `organizador` (
  `Usuario_cpf` varchar(11) NOT NULL,
  `email` varchar(60) NOT NULL,
  `senha` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Usuario_cpf`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pagamento`
--

DROP TABLE IF EXISTS `pagamento`;
CREATE TABLE IF NOT EXISTS `pagamento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `preco` int(11) NOT NULL,
  `metodoPag` varchar(1) DEFAULT NULL,
  `Ingresso_num_inscricao` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Pagamento_Ingresso1_idx` (`Ingresso_num_inscricao`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `percurso`
--

DROP TABLE IF EXISTS `percurso`;
CREATE TABLE IF NOT EXISTS `percurso` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `itinerario` varchar(300) DEFAULT NULL,
  `distancia` int(11) DEFAULT NULL,
  `Categoria_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Percurso_Categoria1_idx` (`Categoria_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `percurso`
--

INSERT INTO `percurso` (`id`, `itinerario`, `distancia`, `Categoria_id`) VALUES
(14, 'aaaaa', 233, 2),
(15, 'dadad', 10, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `ranking`
--

DROP TABLE IF EXISTS `ranking`;
CREATE TABLE IF NOT EXISTS `ranking` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Corrida_id` int(11) NOT NULL,
  `Categoria_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Ranking_Categoria1_idx` (`Categoria_id`),
  KEY `fk_Ranking_Corrida1` (`Corrida_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `ranking`
--

INSERT INTO `ranking` (`id`, `Corrida_id`, `Categoria_id`) VALUES
(1, 1, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tapete`
--

DROP TABLE IF EXISTS `tapete`;
CREATE TABLE IF NOT EXISTS `tapete` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cep` varchar(8) DEFAULT NULL,
  `rua` varchar(80) DEFAULT NULL,
  `cidade` varchar(45) DEFAULT NULL,
  `uf` varchar(2) DEFAULT NULL,
  `referencia` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tapete`
--

INSERT INTO `tapete` (`id`, `cep`, `rua`, `cidade`, `uf`, `referencia`) VALUES
(1, '36000000', 'Jose', 'Joao', 'MG', NULL),
(2, '36000000', 'Jose', 'Joao', 'MG', 'awdawdaw'),
(3, '37816274', 'yuyui', 'tyuyu', 'SP', 'aaa');

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

DROP TABLE IF EXISTS `usuario`;
CREATE TABLE IF NOT EXISTS `usuario` (
  `cpf` varchar(11) NOT NULL,
  `nome` varchar(45) DEFAULT NULL,
  `dataNasc` varchar(10) DEFAULT NULL,
  `sexo` tinyint(4) DEFAULT NULL,
  `tel_cel` varchar(14) DEFAULT NULL,
  `tel_res` varchar(14) DEFAULT NULL,
  `cep` varchar(8) DEFAULT NULL,
  `rua` varchar(80) DEFAULT NULL,
  `uf` varchar(2) DEFAULT NULL,
  `cidade` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`cpf`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `administrador`
--
ALTER TABLE `administrador`
  ADD CONSTRAINT `fk_Administrador_Usuario1` FOREIGN KEY (`Usuario_cpf`) REFERENCES `usuario` (`cpf`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `atleta`
--
ALTER TABLE `atleta`
  ADD CONSTRAINT `fk_Atleta_Usuario1` FOREIGN KEY (`Usuario_cpf`) REFERENCES `usuario` (`cpf`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `boleto`
--
ALTER TABLE `boleto`
  ADD CONSTRAINT `fk_Boleto_Pagamento1` FOREIGN KEY (`Pagamento_id`) REFERENCES `pagamento` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `cartaocredito`
--
ALTER TABLE `cartaocredito`
  ADD CONSTRAINT `fk_CartaoCredito_Pagamento1` FOREIGN KEY (`Pagamento_id`) REFERENCES `pagamento` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `chip`
--
ALTER TABLE `chip`
  ADD CONSTRAINT `fk_Chip_Percurso1` FOREIGN KEY (`Percurso_id`) REFERENCES `percurso` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `ingresso`
--
ALTER TABLE `ingresso`
  ADD CONSTRAINT `fk_Ingresso_Atleta1` FOREIGN KEY (`Atleta_Usuario_cpf`) REFERENCES `atleta` (`Usuario_cpf`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Ingresso_Kit1` FOREIGN KEY (`Kit_id`) REFERENCES `kit` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Ingresso_Lote1` FOREIGN KEY (`Lote_id`) REFERENCES `lote` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `kit`
--
ALTER TABLE `kit`
  ADD CONSTRAINT `fk_Kit_Camisa1` FOREIGN KEY (`Camisa_id`) REFERENCES `camisa` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Kit_Chip1` FOREIGN KEY (`Chip_numero`) REFERENCES `chip` (`numero`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `list_percurso`
--
ALTER TABLE `list_percurso`
  ADD CONSTRAINT `fk_List_Percurso_Corrida1` FOREIGN KEY (`Corrida_id`) REFERENCES `corrida` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_List_Percurso_Percurso1` FOREIGN KEY (`Percurso_id`) REFERENCES `percurso` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `list_tapetes`
--
ALTER TABLE `list_tapetes`
  ADD CONSTRAINT `fk_List_Tapetes_Percurso1` FOREIGN KEY (`Percurso_id`) REFERENCES `percurso` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_List_Tapetes_Tapete1` FOREIGN KEY (`Tapete_id`) REFERENCES `tapete` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `lote`
--
ALTER TABLE `lote`
  ADD CONSTRAINT `fk_Lote_Corrida1` FOREIGN KEY (`Corrida_id`) REFERENCES `corrida` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `organizador`
--
ALTER TABLE `organizador`
  ADD CONSTRAINT `fk_Organizador_Usuario1` FOREIGN KEY (`Usuario_cpf`) REFERENCES `usuario` (`cpf`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `pagamento`
--
ALTER TABLE `pagamento`
  ADD CONSTRAINT `fk_Pagamento_Ingresso1` FOREIGN KEY (`Ingresso_num_inscricao`) REFERENCES `ingresso` (`num_inscricao`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `percurso`
--
ALTER TABLE `percurso`
  ADD CONSTRAINT `fk_Percurso_Categoria1` FOREIGN KEY (`Categoria_id`) REFERENCES `categoria` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `ranking`
--
ALTER TABLE `ranking`
  ADD CONSTRAINT `fk_Ranking_Categoria1` FOREIGN KEY (`Categoria_id`) REFERENCES `categoria` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Ranking_Corrida1` FOREIGN KEY (`Corrida_id`) REFERENCES `corrida` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
