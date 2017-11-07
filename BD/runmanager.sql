-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: 07-Nov-2017 às 12:33
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

--
-- Extraindo dados da tabela `administrador`
--

INSERT INTO `administrador` (`email`, `senha`, `Usuario_cpf`) VALUES
('aas@ada.co', 'huahdaud', '22222222222'),
('hehe@hehe.com', 'xauhue', '11111111111');

-- --------------------------------------------------------

--
-- Estrutura da tabela `atleta`
--

DROP TABLE IF EXISTS `atleta`;
CREATE TABLE IF NOT EXISTS `atleta` (
  `Usuario_cpf` varchar(11) NOT NULL,
  `pace` int(11) DEFAULT NULL,
  `apelido` varchar(45) DEFAULT NULL,
  `email` varchar(60) DEFAULT NULL,
  `senha` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Usuario_cpf`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `atleta`
--

INSERT INTO `atleta` (`Usuario_cpf`, `pace`, `apelido`, `email`, `senha`) VALUES
('11111111111', NULL, 'Jaumzim', 'jaum@email.com', 'huehue'),
('22222222222', NULL, 'HUERO', 'HUERO@EMEIU.COM', 'RISOS');

-- --------------------------------------------------------

--
-- Estrutura da tabela `boleto`
--

DROP TABLE IF EXISTS `boleto`;
CREATE TABLE IF NOT EXISTS `boleto` (
  `id` varchar(45) NOT NULL,
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
  `id` varchar(45) NOT NULL,
  `tamanho` varchar(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `camisa`
--

INSERT INTO `camisa` (`id`, `tamanho`) VALUES
('1', 'M'),
('2', 'G');

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
  `id` int(11) NOT NULL,
  `sexo` varchar(1) NOT NULL,
  `idadeIni` varchar(2) DEFAULT NULL,
  `idadeFim` varchar(2) DEFAULT NULL,
  `descricao` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `categoria`
--

INSERT INTO `categoria` (`id`, `sexo`, `idadeIni`, `idadeFim`, `descricao`) VALUES
(1, '1', '15', '25', 'Masculino 15-25'),
(2, '2', '15', '25', 'Feminino 15-25');

-- --------------------------------------------------------

--
-- Estrutura da tabela `chip`
--

DROP TABLE IF EXISTS `chip`;
CREATE TABLE IF NOT EXISTS `chip` (
  `numero` int(11) NOT NULL,
  `tempoCorrida` time DEFAULT NULL,
  `Percurso_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`numero`),
  KEY `fk_Chip_Percurso1_idx` (`Percurso_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `chip`
--

INSERT INTO `chip` (`numero`, `tempoCorrida`, `Percurso_id`) VALUES
(1, NULL, NULL),
(2, NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `corrida`
--

DROP TABLE IF EXISTS `corrida`;
CREATE TABLE IF NOT EXISTS `corrida` (
  `id` int(11) NOT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `corrida`
--

INSERT INTO `corrida` (`id`, `nome`, `localLargada`, `localChegada`, `horaLargada`, `duracaoLim`, `dataCorrida`, `dataRetiradaKit`, `localRetiradaKit`, `numMaxInscritos`) VALUES
(1, 'Maratona IFSEMG', 'IFSEMG', 'IFSEMG', '14:00:00', 120, '10/12/2017', '02/12/2017', 'IFSEMG Bloco O', 100),
(2, 'Maratona UFJF', 'Direito', 'Engenharia', '14:00:00', 120, '10/11/2017', '02/11/2017', 'UFJF Reitoria', 200),
(3, 'Corridao JF', 'Carrefour', 'Manoel Honório', '15:00:00', 180, '15/12/2017', '05/12/2017', 'Ativa', 300);

-- --------------------------------------------------------

--
-- Estrutura da tabela `ingresso`
--

DROP TABLE IF EXISTS `ingresso`;
CREATE TABLE IF NOT EXISTS `ingresso` (
  `num_ingresso` int(11) NOT NULL,
  `Lote_id` int(11) NOT NULL,
  `Atleta_Usuario_cpf` varchar(11) DEFAULT NULL,
  `Kit_numPeito` int(11) DEFAULT NULL,
  `Pagamento_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`num_ingresso`),
  KEY `fk_Ingresso_Lote1_idx` (`Lote_id`),
  KEY `fk_Ingresso_Atleta1_idx` (`Atleta_Usuario_cpf`),
  KEY `fk_Ingresso_Kit1_idx` (`Kit_numPeito`),
  KEY `fk_Ingresso_Pagamento1_idx` (`Pagamento_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `kit`
--

DROP TABLE IF EXISTS `kit`;
CREATE TABLE IF NOT EXISTS `kit` (
  `numPeito` int(11) NOT NULL,
  `Camisa_id` varchar(45) NOT NULL,
  `Chip_numero` int(11) NOT NULL,
  PRIMARY KEY (`numPeito`),
  KEY `fk_Kit_Camisa1_idx` (`Camisa_id`),
  KEY `fk_Kit_Chip1_idx` (`Chip_numero`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `kit`
--

INSERT INTO `kit` (`numPeito`, `Camisa_id`, `Chip_numero`) VALUES
(123, '1', 1),
(297, '2', 2);

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

--
-- Extraindo dados da tabela `lote`
--

INSERT INTO `lote` (`id`, `preco`, `dataLimite`, `Corrida_id`) VALUES
(1, 50, '10/10/2020', 3),
(2, 60, '10/11/2020', 3);

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

--
-- Extraindo dados da tabela `organizador`
--

INSERT INTO `organizador` (`Usuario_cpf`, `email`, `senha`) VALUES
('11111111111', 'ue@ue.com', 'queiss'),
('22222222222', 'loko@mia.com', 'lokomia');

-- --------------------------------------------------------

--
-- Estrutura da tabela `pagamento`
--

DROP TABLE IF EXISTS `pagamento`;
CREATE TABLE IF NOT EXISTS `pagamento` (
  `id` int(11) NOT NULL,
  `preco` int(11) NOT NULL,
  `metodoPag` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `percurso`
--

DROP TABLE IF EXISTS `percurso`;
CREATE TABLE IF NOT EXISTS `percurso` (
  `id` int(11) NOT NULL,
  `itinerario` varchar(300) DEFAULT NULL,
  `distancia` int(11) DEFAULT NULL,
  `Categoria_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Percurso_Categoria1_idx` (`Categoria_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `percurso`
--

INSERT INTO `percurso` (`id`, `itinerario`, `distancia`, `Categoria_id`) VALUES
(1, 'Rio Branco', 15, 1),
(2, 'Rio Branco', 15, 2),
(3, 'sss', 10, 1),
(5, '', 10, 1),
(8, 'ddd', 10, 1),
(9, '6', 66, 1),
(10, 'awd', 10, 1),
(15, 'sss', 10, 1),
(98, 'hue', 98, 2),
(5678, 'hue', 56789, 1),
(9999, 'sad', 9999, 1),
(56545, '12', 10, 2),
(76577, 'wdwad', 75, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `ranking`
--

DROP TABLE IF EXISTS `ranking`;
CREATE TABLE IF NOT EXISTS `ranking` (
  `id` int(11) NOT NULL,
  `Corrida_id` int(11) NOT NULL,
  `Categoria_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Ranking_Categoria1_idx` (`Categoria_id`),
  KEY `fk_Ranking_Corrida1` (`Corrida_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `ranking`
--

INSERT INTO `ranking` (`id`, `Corrida_id`, `Categoria_id`) VALUES
(1, 3, 1),
(2, 1, 1),
(3, 3, 2),
(4, 1, 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tapete`
--

DROP TABLE IF EXISTS `tapete`;
CREATE TABLE IF NOT EXISTS `tapete` (
  `id` int(11) NOT NULL,
  `cep` varchar(8) DEFAULT NULL,
  `rua` varchar(80) DEFAULT NULL,
  `cidade` varchar(45) DEFAULT NULL,
  `uf` varchar(2) DEFAULT NULL,
  `referencia` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tapete`
--

INSERT INTO `tapete` (`id`, `cep`, `rua`, `cidade`, `uf`, `referencia`) VALUES
(1, '36062220', 'Jose Gonçalves Alvim', 'Juiz de Fora', 'MG', 'Rua do Mirante'),
(2, '36222222', 'Avenida Rio Branco', 'Juiz de Fora', 'MG', NULL);

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
-- Extraindo dados da tabela `usuario`
--

INSERT INTO `usuario` (`cpf`, `nome`, `dataNasc`, `sexo`, `tel_cel`, `tel_res`, `cep`, `rua`, `uf`, `cidade`) VALUES
('11111111111', 'Jaum', '10/10/1010', 1, '(xx)xxxxxxxxx', NULL, '36000000', NULL, NULL, NULL),
('22222222222', 'Gzuis', '11/11/1111', 1, '(32)332323232', NULL, NULL, NULL, NULL, NULL);

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
  ADD CONSTRAINT `fk_Ingresso_Kit1` FOREIGN KEY (`Kit_numPeito`) REFERENCES `kit` (`numPeito`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Ingresso_Lote1` FOREIGN KEY (`Lote_id`) REFERENCES `lote` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Ingresso_Pagamento1` FOREIGN KEY (`Pagamento_id`) REFERENCES `pagamento` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

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
