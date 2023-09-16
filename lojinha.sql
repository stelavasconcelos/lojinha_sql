-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 14-Set-2023 às 00:30
-- Versão do servidor: 10.4.27-MariaDB
-- versão do PHP: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `lojinha`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_clientes`
--

CREATE TABLE `tbl_clientes` (
  `ID_Cliente` int(11) NOT NULL,
  `Nome_Cliente` varchar(50) NOT NULL,
  `CPF_Cliente` varchar(14) NOT NULL,
  `Data_Nasc` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_produtos`
--

CREATE TABLE `tbl_produtos` (
  `ID_Produto` int(11) NOT NULL,
  `Nome_Prod` varchar(50) NOT NULL,
  `Categoria` varchar(20) NOT NULL,
  `Preço_Prod` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_telefones`
--

CREATE TABLE `tbl_telefones` (
  `ID_Fone` int(11) NOT NULL,
  `ID_Cliente` int(11) NOT NULL,
  `Telefone` varchar(19) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_vendas`
--

CREATE TABLE `tbl_vendas` (
  `ID_Vendas` int(11) NOT NULL,
  `ID_Cliente` int(11) NOT NULL,
  `ID_Produto` int(11) NOT NULL,
  `Quantidade` decimal(10,0) NOT NULL,
  `Data_Venda` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `tbl_clientes`
--
ALTER TABLE `tbl_clientes`
  ADD PRIMARY KEY (`ID_Cliente`);

--
-- Índices para tabela `tbl_produtos`
--
ALTER TABLE `tbl_produtos`
  ADD PRIMARY KEY (`ID_Produto`);

--
-- Índices para tabela `tbl_telefones`
--
ALTER TABLE `tbl_telefones`
  ADD PRIMARY KEY (`ID_Fone`),
  ADD KEY `ID_Cliente` (`ID_Cliente`);

--
-- Índices para tabela `tbl_vendas`
--
ALTER TABLE `tbl_vendas`
  ADD PRIMARY KEY (`ID_Vendas`),
  ADD KEY `ID_Cliente` (`ID_Cliente`),
  ADD KEY `ID_Produto` (`ID_Produto`);

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `tbl_produtos`
--
ALTER TABLE `tbl_produtos`
  ADD CONSTRAINT `tbl_produtos_ibfk_1` FOREIGN KEY (`ID_Produto`) REFERENCES `tbl_vendas` (`ID_Produto`);

--
-- Limitadores para a tabela `tbl_telefones`
--
ALTER TABLE `tbl_telefones`
  ADD CONSTRAINT `tbl_telefones_ibfk_1` FOREIGN KEY (`ID_Cliente`) REFERENCES `tbl_clientes` (`ID_Cliente`);

--
-- Limitadores para a tabela `tbl_vendas`
--
ALTER TABLE `tbl_vendas`
  ADD CONSTRAINT `tbl_vendas_ibfk_1` FOREIGN KEY (`ID_Cliente`) REFERENCES `tbl_clientes` (`ID_Cliente`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
