

CREATE TABLE `alunos` (
  `Nome` varchar(30) NOT NULL,
  `Idade` int(11) NOT NULL,
  `Sexo` varchar(1) NOT NULL,
  `CPF` int(11) NOT NULL,
  `RG` int(11) NOT NULL,
  `Nascimento` date NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Senha` varchar(20) NOT NULL,
  `Celular` int(15) DEFAULT NULL,
  `Endereco` varchar(100) DEFAULT NULL,
  `Bairro` varchar(50) DEFAULT NULL,
  `Cidade` varchar(50) DEFAULT NULL,
  `Estado` varchar(2) DEFAULT NULL,
  `Pais` varchar(30) DEFAULT NULL,
  `Curso` varchar(30) NOT NULL,
  `Professor` int(11) NOT NULL,
  `Valor` int(11) NOT NULL DEFAULT 30
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `notas`
--

CREATE TABLE `notas` (
  `CPF` int(11) NOT NULL,
  `AP1` int(11) DEFAULT NULL,
  `AP2` int(11) DEFAULT NULL,
  `AP3` int(11) DEFAULT NULL,
  `Media` int(11) DEFAULT NULL,
  `Professor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pagamentos`
--

CREATE TABLE `pagamentos` (
  `CPF` int(11) NOT NULL,
  `Valor` int(11) NOT NULL,
  `Pago` tinyint(1) NOT NULL,
  `Dividas` tinyint(1) NOT NULL,
  `Contato` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `professores`
--

CREATE TABLE `professores` (
  `Nome` varchar(30) NOT NULL,
  `ID` int(11) NOT NULL,
  `Celular` int(11) NOT NULL,
  `Efetivacao` date NOT NULL,
  `Curso` varchar(30) NOT NULL,
  `Nivel` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



-- Índices para tabela `alunos`
--
ALTER TABLE `alunos`
  ADD PRIMARY KEY (`CPF`),
  ADD UNIQUE KEY `Celular` (`Celular`),
  ADD KEY `Alunos_fk0` (`Professor`);

--
-- Índices para tabela `notas`
--
ALTER TABLE `notas`
  ADD PRIMARY KEY (`CPF`),
  ADD KEY `Notas_fk1` (`Professor`);

--
-- Índices para tabela `pagamentos`
--
ALTER TABLE `pagamentos`
  ADD UNIQUE KEY `Pago` (`Pago`),
  ADD UNIQUE KEY `Dividas` (`Dividas`),
  ADD UNIQUE KEY `Contato` (`Contato`),
  ADD KEY `Pagamentos_fk0` (`CPF`);

--
-- Índices para tabela `professores`
--
ALTER TABLE `professores`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `professores`
--
ALTER TABLE `professores`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `alunos`
--
ALTER TABLE `alunos`
  ADD CONSTRAINT `Alunos_fk0` FOREIGN KEY (`Professor`) REFERENCES `professores` (`ID`);

--
-- Limitadores para a tabela `notas`
--
ALTER TABLE `notas`
  ADD CONSTRAINT `Notas_fk0` FOREIGN KEY (`CPF`) REFERENCES `alunos` (`CPF`),
  ADD CONSTRAINT `Notas_fk1` FOREIGN KEY (`Professor`) REFERENCES `professores` (`ID`);

--
-- Limitadores para a tabela `pagamentos`
--
ALTER TABLE `pagamentos`
  ADD CONSTRAINT `Pagamentos_fk0` FOREIGN KEY (`CPF`) REFERENCES `alunos` (`CPF`),
  ADD CONSTRAINT `Pagamentos_fk2` FOREIGN KEY (`Contato`) REFERENCES `alunos` (`Celular`);
COMMIT;
