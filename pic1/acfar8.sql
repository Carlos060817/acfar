-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: 11-Dez-2020 às 21:45
-- Versão do servidor: 5.7.26
-- versão do PHP: 7.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `acfar8`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `cadastros`
--

DROP TABLE IF EXISTS `cadastros`;
CREATE TABLE IF NOT EXISTS `cadastros` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) DEFAULT NULL,
  `sobrenome` varchar(45) DEFAULT NULL,
  `endereco` varchar(70) DEFAULT NULL,
  `cidade` varchar(45) DEFAULT NULL,
  `bairro` varchar(45) DEFAULT NULL,
  `numero` int(11) DEFAULT NULL,
  `estado` varchar(45) DEFAULT NULL,
  `cep` varchar(9) DEFAULT NULL,
  `criado` datetime DEFAULT NULL,
  `modificado` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `cadastros`
--

INSERT INTO `cadastros` (`id`, `nome`, `sobrenome`, `endereco`, `cidade`, `bairro`, `numero`, `estado`, `cep`, `criado`, `modificado`) VALUES
(1, 'daniel ', 'Augusto ', 'dddd ', 'sdfghjklÃ§ ', 'areias ', NULL, 'Minas Gerais ', '37655000 ', '2020-12-11 15:45:00', '2020-12-11 15:45:00');

-- --------------------------------------------------------

--
-- Estrutura da tabela `pedidos`
--

DROP TABLE IF EXISTS `pedidos`;
CREATE TABLE IF NOT EXISTS `pedidos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_produto` int(11) NOT NULL,
  `quantidade` int(11) DEFAULT NULL,
  `transportadora` varchar(50) DEFAULT NULL,
  `prioridade` varchar(11) NOT NULL,
  `id_vendedor` int(11) NOT NULL,
  `id_cadastro` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_produto` (`id_produto`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `pedidos`
--

INSERT INTO `pedidos` (`id`, `id_produto`, `quantidade`, `transportadora`, `prioridade`, `id_vendedor`, `id_cadastro`) VALUES
(1, 1, 5, 'mgm', 'Mediana', 1, 1),
(4, 1, 5, 'mgm', 'Mediana', 1, 1),
(5, 1, 5, 'mgm', 'Mediana', 1, 1),
(6, 2, 10, 'mgm', 'Mediana', 1, 1),
(7, 1, 5, 'mgm', 'Mediana', 1, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `produtos`
--

DROP TABLE IF EXISTS `produtos`;
CREATE TABLE IF NOT EXISTS `produtos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(45) DEFAULT NULL,
  `nome` varchar(70) DEFAULT NULL,
  `quantidade` int(11) DEFAULT NULL,
  `descricao` varchar(70) DEFAULT NULL,
  `preco` double DEFAULT NULL,
  `marca` varchar(45) DEFAULT NULL,
  `criado` datetime DEFAULT NULL,
  `modificado` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `produtos`
--

INSERT INTO `produtos` (`id`, `email`, `nome`, `quantidade`, `descricao`, `preco`, `marca`, `criado`, `modificado`) VALUES
(1, NULL, 'parafuso', 10000, 'ghjk', 10, 'jomarca', '2020-12-11 15:45:14', '2020-12-11 17:37:21'),
(2, NULL, 'carlos dan', 90, 'ghjk', 10, 'jj1', '2020-12-11 17:09:54', '2020-12-11 17:09:54'),
(3, NULL, 'carlos dan', 100, 'ghjk', 10, 'jj1', '2020-12-11 17:09:54', '2020-12-11 17:09:54'),
(4, NULL, 'parafuso', 10, 'ghjk', 100, 'jomarca', '2020-12-11 17:10:22', '2020-12-11 17:10:22');

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(45) NOT NULL,
  `id_empresa` int(11) DEFAULT NULL,
  `nome` varchar(50) DEFAULT NULL,
  `login` varchar(45) NOT NULL,
  `senha` varchar(45) NOT NULL,
  `tipo` tinyint(4) DEFAULT NULL,
  `telefone` varchar(15) DEFAULT NULL,
  `endereco` varchar(70) DEFAULT NULL,
  `cidade` varchar(45) DEFAULT NULL,
  `bairro` varchar(45) DEFAULT NULL,
  `numero` int(11) DEFAULT NULL,
  `cnpj` double DEFAULT NULL,
  `cpf` double DEFAULT NULL,
  `cep` varchar(9) DEFAULT NULL,
  `criado` datetime DEFAULT NULL,
  `modificado` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`,`senha`,`login`,`cep`,`cnpj`),
  KEY `id_empresa` (`id_empresa`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `usuarios`
--

INSERT INTO `usuarios` (`id`, `email`, `id_empresa`, `nome`, `login`, `senha`, `tipo`, `telefone`, `endereco`, `cidade`, `bairro`, `numero`, `cnpj`, `cpf`, `cep`, `criado`, `modificado`) VALUES
(1, 'teste@teste', 1, 'carlos', 'carlos', '1234', 1, '84585698456', 'areias', 'itapeva', 'areias', 789, 1584528520, 5189569, '3766000', '2020-05-12 06:16:15', '2020-03-08 08:35:35');

-- --------------------------------------------------------

--
-- Estrutura da tabela `vendedor_tem_cliente`
--

DROP TABLE IF EXISTS `vendedor_tem_cliente`;
CREATE TABLE IF NOT EXISTS `vendedor_tem_cliente` (
  `id_vendedor` int(11) NOT NULL AUTO_INCREMENT,
  `id_cliente` int(11) NOT NULL,
  `vendedor_id` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_cliente`,`id_vendedor`),
  KEY `vendedor_id` (`vendedor_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
