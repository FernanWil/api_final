CREATE TABLE `acceso` (
  `idAcceso` int(11) NOT NULL,
  `documento` bigint(20) NOT NULL,
  `password` varchar(255) NOT NULL,
  `idUsuarioAprendiz` int(11) NOT NULL,
  `tablaAcceso` int(11) NOT NULL,
  `forgotPassword` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE `aprendices` (
  `idAprendiz` int(11) NOT NULL,
  `documento` bigint(20) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `apellidos` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `telefono` bigint(20) NOT NULL,
  `estadoAprendiz` int(11) NOT NULL DEFAULT 1,
  `idTipoDocumento` int(11) NOT NULL,
  `idRol` int(11) NOT NULL,
  `idFicha` int(11) DEFAULT NULL,
  `idGrupoProyecto` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE `comite` (
  `idComite` int(11) NOT NULL,
  `fechaHoraInicio` datetime NOT NULL,
  `fechaHoraFin` datetime NOT NULL,
  `codigoComite` bigint(20) NOT NULL,
  `estadoComite` int(11) NOT NULL DEFAULT 0,
  `link` varchar(255) DEFAULT NULL,
  `acta` varchar(255) DEFAULT NULL,
  `resolucion` varchar(255) DEFAULT NULL,
  `idProgramaCoordinacion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE `competencias` (
  `idCompetencia` int(11) NOT NULL,
  `nombreCompetencia` varchar(255) NOT NULL,
  `nombreNSCL` varchar(255) NOT NULL,
  `codigoCompetencia` bigint(20) NOT NULL,
  `idProgramaFormativo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE `decision_comite` (
  `idDecision` int(11) NOT NULL,
  `nombreDecision` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE `entrega_ficha` (
  `idEntregaFicha` int(11) NOT NULL,
  `observacionFicha` varchar(255) NOT NULL,
  `trimestre` int(11) NOT NULL,
  `fechaHora` datetime NOT NULL DEFAULT current_timestamp(),
  `idUsuario` int(11) NOT NULL,
  `idFicha` int(11) NOT NULL,
  `idCompetencia` int(11) NOT NULL,
  `idResultadoAprendizaje` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE `estado_decision` (
  `idEstadoDecision` int(11) NOT NULL,
  `nombreEstadoDecision` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE `estado_quejas` (
  `idEstadoQuejas` int(11) NOT NULL,
  `nombreEstadoQuejas` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE `fichas` (
  `idFicha` int(11) NOT NULL,
  `codigoFicha` bigint(20) NOT NULL,
  `voceroFicha` varchar(255) DEFAULT NULL,
  `idProgramaFormativo` int(11) NOT NULL,
  `idUsuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE `ficha_usuarios` (
  `idFichaUsuario` int(11) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `idFicha` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE `motivos_comite` (
  `idMotivoComite` int(11) NOT NULL,
  `nombreMotivo` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE `observaciones_aprendiz` (
  `idObservacionAprendiz` int(11) NOT NULL,
  `trimestre` int(11) NOT NULL,
  `fechaHora` datetime NOT NULL DEFAULT current_timestamp(),
  `ObservacionAprendiz` varchar(255) NOT NULL,
  `idAprendiz` int(11) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `idEstadoDecision` int(11) NOT NULL,
  `idCompetencia` int(11) NOT NULL,
  `idResultadoAprendizaje` int(11) NOT NULL,
  `idEntregaFicha` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE `permisos` (
  `idPermiso` int(11) NOT NULL,
  `modulo` varchar(255) NOT NULL,
  `subModulo` varchar(255) NOT NULL,
  `nombrePermiso` varchar(255) NOT NULL,
  `link` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE `plan_mejoramiento` (
  `idPlanMejoramiento` int(11) NOT NULL,
  `trimestre` int(11) NOT NULL,
  `archivoPlanMejoramiento` varchar(255) DEFAULT NULL,
  `activo` tinyint(4) NOT NULL DEFAULT 1,
  `descripcionMotivo` varchar(255) DEFAULT NULL,
  `IdQueja` int(11) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `idAprendiz` int(11) NOT NULL,
  `idEstadoDecision` int(11) DEFAULT NULL,
  `idMotivoComite` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE `programas_formativos` (
  `idProgramaFormativo` int(11) NOT NULL,
  `nombrePF` varchar(255) NOT NULL,
  `abreviaturaPF` varchar(255) NOT NULL,
  `codigoPF` bigint(20) NOT NULL,
  `trimestres` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE `programa_coordinacion` (
  `idPCA` int(11) NOT NULL,
  `idProgramaFormativo` int(11) NOT NULL,
  `idUsuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE `quejas_comite` (
  `idQueja` int(11) NOT NULL,
  `archivoQueja` blob DEFAULT NULL,
  `trimestre` int(11) NOT NULL,
  `descripcionMotivo` varchar(255) NOT NULL,
  `otraDecision` varchar(255) DEFAULT NULL,
  `asisteComite` tinyint(4) DEFAULT 0,
  `otrosInstructores` varchar(255) DEFAULT NULL,
  `idAprendiz` int(11) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `idMotivoComite` int(11) NOT NULL,
  `idEstadoQueja` int(11) NOT NULL,
  `idComite` int(11) DEFAULT NULL,
  `idDecisionComite` int(11) DEFAULT NULL,
  `idCompetencia` int(11) NOT NULL,
  `idResultadoAprendizaje` int(11) NOT NULL,
  `idObservacionAprendiz` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE `resultado_aprendizaje` (
  `idResultadoAprendizaje` int(11) NOT NULL,
  `nombreRA` varchar(255) NOT NULL,
  `codigoRA` bigint(20) NOT NULL,
  `IdCompetencia` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE `roles` (
  `idRol` int(11) NOT NULL,
  `nombreRol` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE `roles_permisos` (
  `idRolPermiso` int(11) NOT NULL,
  `access` tinyint(4) NOT NULL DEFAULT 0,
  `idRol` int(11) NOT NULL,
  `idPermiso` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE `spf_archivos_proyecto` (
  `idArchivosProyecto` int(11) NOT NULL,
  `archivoProyecto` varchar(255) NOT NULL,
  `nombreArchivo` varchar(255) NOT NULL,
  `observacionArchivoProyecto` varchar(255) NOT NULL,
  `fechaHora` datetime NOT NULL DEFAULT current_timestamp(),
  `idUsuario` int(11) NOT NULL,
  `idCompetencia` int(11) NOT NULL,
  `idResultadoAprendizaje` int(11) NOT NULL,
  `idGrupoProyecto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE `spf_grupos_proyecto` (
  `idGrupoProyecto` int(11) NOT NULL,
  `nombreProyecto` varchar(255) NOT NULL,
  `idFicha` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE `tipo_documento` (
  `idTipoDocumento` int(11) NOT NULL,
  `nombreTipoDocumento` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE `usuarios` (
  `idUsuario` int(11) NOT NULL,
  `documento` bigint(20) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `apellidos` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `telefono` bigint(20) NOT NULL,
  `idTipoDocumento` int(11) NOT NULL,
  `idRol` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


ALTER TABLE `acceso`
  ADD PRIMARY KEY (`idAcceso`);

ALTER TABLE `aprendices`
  ADD PRIMARY KEY (`idAprendiz`),
  ADD UNIQUE KEY `IDX_228cb36a82d3141dc0b0b4c33b` (`documento`),
  ADD UNIQUE KEY `IDX_c2b7df10c1a277e33f811b48d5` (`email`),
  ADD KEY `FK_acd14d6e0171f3f50800aafdd4c` (`idTipoDocumento`),
  ADD KEY `FK_1bc55212fb69a8be8419455d8b8` (`idRol`),
  ADD KEY `FK_7fc86daba74a06bdc5f26cf63e3` (`idFicha`),
  ADD KEY `FK_aff3ca6fd5c5ab99c75dc14b1ec` (`idGrupoProyecto`);

ALTER TABLE `comite`
  ADD PRIMARY KEY (`idComite`),
  ADD KEY `FK_cbac08f1b7e1f8ba3d5e7f49ba8` (`idProgramaCoordinacion`);

ALTER TABLE `competencias`
  ADD PRIMARY KEY (`idCompetencia`),
  ADD KEY `FK_a386368a3c3945ea6ed823ed55c` (`idProgramaFormativo`);

ALTER TABLE `decision_comite`
  ADD PRIMARY KEY (`idDecision`);

ALTER TABLE `entrega_ficha`
  ADD PRIMARY KEY (`idEntregaFicha`),
  ADD KEY `FK_aa4f27bc5f38f5a3db9ee521d6b` (`idUsuario`),
  ADD KEY `FK_a6391b0ed37c6a6ad0c2385e1b0` (`idFicha`),
  ADD KEY `FK_c09d3718053faa4c2f53427d81f` (`idCompetencia`),
  ADD KEY `FK_f9305758cd73ea82b80f54dc18a` (`idResultadoAprendizaje`);

ALTER TABLE `estado_decision`
  ADD PRIMARY KEY (`idEstadoDecision`);

ALTER TABLE `estado_quejas`
  ADD PRIMARY KEY (`idEstadoQuejas`);

ALTER TABLE `fichas`
  ADD PRIMARY KEY (`idFicha`),
  ADD KEY `FK_7d72ed522664f044d0181dd6501` (`idProgramaFormativo`),
  ADD KEY `FK_b1ea2b751183074fd9f7339c8b4` (`idUsuario`);

ALTER TABLE `ficha_usuarios`
  ADD PRIMARY KEY (`idFichaUsuario`),
  ADD KEY `FK_dcc35b53a76a57c51593df4b652` (`idUsuario`),
  ADD KEY `FK_5956f445790dfcf25b2ab2ae3b3` (`idFicha`);

ALTER TABLE `motivos_comite`
  ADD PRIMARY KEY (`idMotivoComite`);

ALTER TABLE `observaciones_aprendiz`
  ADD PRIMARY KEY (`idObservacionAprendiz`),
  ADD KEY `FK_cf2c2fd851119704859ca35d370` (`idAprendiz`),
  ADD KEY `FK_c20db6b5f92c9d4cf0091c74fe2` (`idUsuario`),
  ADD KEY `FK_f2f1c97175be98478e292f72b33` (`idEstadoDecision`),
  ADD KEY `FK_b0769e8273d16f822788d0c0c40` (`idCompetencia`),
  ADD KEY `FK_6fa9e8effc53d42b3750e24a684` (`idResultadoAprendizaje`),
  ADD KEY `FK_75a69a702de3b68e1b828a4382d` (`idEntregaFicha`);

ALTER TABLE `permisos`
  ADD PRIMARY KEY (`idPermiso`);

ALTER TABLE `plan_mejoramiento`
  ADD PRIMARY KEY (`idPlanMejoramiento`),
  ADD KEY `FK_d180f7f57f834198ff5e84cad10` (`IdQueja`),
  ADD KEY `FK_5b768ce2dada11dab96e2fc7ee6` (`idUsuario`),
  ADD KEY `FK_6be813facd601eb0217ff054e4b` (`idAprendiz`),
  ADD KEY `FK_47359ae928c0f0c37e3ca8d8848` (`idEstadoDecision`),
  ADD KEY `FK_73630a2fb200e87e307b6ec8e7e` (`idMotivoComite`);

ALTER TABLE `programas_formativos`
  ADD PRIMARY KEY (`idProgramaFormativo`);

ALTER TABLE `programa_coordinacion`
  ADD PRIMARY KEY (`idPCA`),
  ADD KEY `FK_e4bfedaf692dd784723108ca072` (`idProgramaFormativo`),
  ADD KEY `FK_526fd05199324e4007bc92d7cb4` (`idUsuario`);

ALTER TABLE `quejas_comite`
  ADD PRIMARY KEY (`idQueja`),
  ADD KEY `FK_20035e996089f892e9cf65b7b9f` (`idAprendiz`),
  ADD KEY `FK_dd325006f37ca8b424ca211f6c1` (`idUsuario`),
  ADD KEY `FK_ce6142f6ad09111d469db272693` (`idMotivoComite`),
  ADD KEY `FK_a0d91cf619ae50f7c5a294e6a29` (`idEstadoQueja`),
  ADD KEY `FK_a7533f040fe917ad7149242c3ab` (`idComite`),
  ADD KEY `FK_90a90a1055f8f5ce17d5ddd30ca` (`idDecisionComite`),
  ADD KEY `FK_f866a07939c693164f0ea4b993f` (`idCompetencia`),
  ADD KEY `FK_421d71926a4d2bb73f321bf6343` (`idResultadoAprendizaje`),
  ADD KEY `FK_f08643cd06dd752a2430a06be95` (`idObservacionAprendiz`);

ALTER TABLE `resultado_aprendizaje`
  ADD PRIMARY KEY (`idResultadoAprendizaje`),
  ADD KEY `FK_9bf2b637da016d9c799b6b0dfd6` (`IdCompetencia`);

ALTER TABLE `roles`
  ADD PRIMARY KEY (`idRol`);

ALTER TABLE `roles_permisos`
  ADD PRIMARY KEY (`idRolPermiso`),
  ADD KEY `FK_1d34a4fffb5474d1513d3018f0c` (`idRol`),
  ADD KEY `FK_ac8fc5c3587bcad4edae7ae1bd9` (`idPermiso`);

ALTER TABLE `spf_archivos_proyecto`
  ADD PRIMARY KEY (`idArchivosProyecto`),
  ADD KEY `FK_874d5924a3cf35c358ca2014377` (`idUsuario`),
  ADD KEY `FK_2db3d009aaf79037a6fa75ea470` (`idCompetencia`),
  ADD KEY `FK_6740bef91e41501b8be76b8f37f` (`idResultadoAprendizaje`),
  ADD KEY `FK_9549eebdf05eef6892b805f9c82` (`idGrupoProyecto`);

ALTER TABLE `spf_grupos_proyecto`
  ADD PRIMARY KEY (`idGrupoProyecto`),
  ADD KEY `FK_32b8f0b4361098c261e5bd7d448` (`idFicha`);

ALTER TABLE `tipo_documento`
  ADD PRIMARY KEY (`idTipoDocumento`);

ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`idUsuario`),
  ADD UNIQUE KEY `IDX_604e2077971f192d85cffb5c43` (`documento`),
  ADD UNIQUE KEY `IDX_446adfc18b35418aac32ae0b7b` (`email`),
  ADD KEY `FK_52bb2c1c0e9c6ba0f0c1e8250ff` (`idTipoDocumento`),
  ADD KEY `FK_1cd486e9216c66d450ef9b70740` (`idRol`);


ALTER TABLE `acceso`
  MODIFY `idAcceso` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=127;

ALTER TABLE `aprendices`
  MODIFY `idAprendiz` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

ALTER TABLE `comite`
  MODIFY `idComite` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

ALTER TABLE `competencias`
  MODIFY `idCompetencia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

ALTER TABLE `decision_comite`
  MODIFY `idDecision` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

ALTER TABLE `entrega_ficha`
  MODIFY `idEntregaFicha` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

ALTER TABLE `estado_decision`
  MODIFY `idEstadoDecision` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

ALTER TABLE `estado_quejas`
  MODIFY `idEstadoQuejas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

ALTER TABLE `fichas`
  MODIFY `idFicha` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

ALTER TABLE `ficha_usuarios`
  MODIFY `idFichaUsuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

ALTER TABLE `motivos_comite`
  MODIFY `idMotivoComite` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

ALTER TABLE `observaciones_aprendiz`
  MODIFY `idObservacionAprendiz` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

ALTER TABLE `permisos`
  MODIFY `idPermiso` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

ALTER TABLE `plan_mejoramiento`
  MODIFY `idPlanMejoramiento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

ALTER TABLE `programas_formativos`
  MODIFY `idProgramaFormativo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

ALTER TABLE `programa_coordinacion`
  MODIFY `idPCA` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

ALTER TABLE `quejas_comite`
  MODIFY `idQueja` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

ALTER TABLE `resultado_aprendizaje`
  MODIFY `idResultadoAprendizaje` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

ALTER TABLE `roles`
  MODIFY `idRol` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

ALTER TABLE `roles_permisos`
  MODIFY `idRolPermiso` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=199;

ALTER TABLE `spf_archivos_proyecto`
  MODIFY `idArchivosProyecto` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `spf_grupos_proyecto`
  MODIFY `idGrupoProyecto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

ALTER TABLE `tipo_documento`
  MODIFY `idTipoDocumento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

ALTER TABLE `usuarios`
  MODIFY `idUsuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;


ALTER TABLE `aprendices`
  ADD CONSTRAINT `FK_1bc55212fb69a8be8419455d8b8` FOREIGN KEY (`idRol`) REFERENCES `roles` (`idRol`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_7fc86daba74a06bdc5f26cf63e3` FOREIGN KEY (`idFicha`) REFERENCES `fichas` (`idFicha`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_acd14d6e0171f3f50800aafdd4c` FOREIGN KEY (`idTipoDocumento`) REFERENCES `tipo_documento` (`idTipoDocumento`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_aff3ca6fd5c5ab99c75dc14b1ec` FOREIGN KEY (`idGrupoProyecto`) REFERENCES `spf_grupos_proyecto` (`idGrupoProyecto`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `comite`
  ADD CONSTRAINT `FK_cbac08f1b7e1f8ba3d5e7f49ba8` FOREIGN KEY (`idProgramaCoordinacion`) REFERENCES `programa_coordinacion` (`idPCA`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `competencias`
  ADD CONSTRAINT `FK_a386368a3c3945ea6ed823ed55c` FOREIGN KEY (`idProgramaFormativo`) REFERENCES `programas_formativos` (`idProgramaFormativo`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `entrega_ficha`
  ADD CONSTRAINT `FK_a6391b0ed37c6a6ad0c2385e1b0` FOREIGN KEY (`idFicha`) REFERENCES `fichas` (`idFicha`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_aa4f27bc5f38f5a3db9ee521d6b` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`idUsuario`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_c09d3718053faa4c2f53427d81f` FOREIGN KEY (`idCompetencia`) REFERENCES `competencias` (`idCompetencia`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_f9305758cd73ea82b80f54dc18a` FOREIGN KEY (`idResultadoAprendizaje`) REFERENCES `resultado_aprendizaje` (`idResultadoAprendizaje`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `fichas`
  ADD CONSTRAINT `FK_7d72ed522664f044d0181dd6501` FOREIGN KEY (`idProgramaFormativo`) REFERENCES `programas_formativos` (`idProgramaFormativo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_b1ea2b751183074fd9f7339c8b4` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`idUsuario`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `ficha_usuarios`
  ADD CONSTRAINT `FK_5956f445790dfcf25b2ab2ae3b3` FOREIGN KEY (`idFicha`) REFERENCES `fichas` (`idFicha`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_dcc35b53a76a57c51593df4b652` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`idUsuario`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `observaciones_aprendiz`
  ADD CONSTRAINT `FK_6fa9e8effc53d42b3750e24a684` FOREIGN KEY (`idResultadoAprendizaje`) REFERENCES `resultado_aprendizaje` (`idResultadoAprendizaje`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_75a69a702de3b68e1b828a4382d` FOREIGN KEY (`idEntregaFicha`) REFERENCES `entrega_ficha` (`idEntregaFicha`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_b0769e8273d16f822788d0c0c40` FOREIGN KEY (`idCompetencia`) REFERENCES `competencias` (`idCompetencia`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_c20db6b5f92c9d4cf0091c74fe2` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`idUsuario`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_cf2c2fd851119704859ca35d370` FOREIGN KEY (`idAprendiz`) REFERENCES `aprendices` (`idAprendiz`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_f2f1c97175be98478e292f72b33` FOREIGN KEY (`idEstadoDecision`) REFERENCES `estado_decision` (`idEstadoDecision`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `plan_mejoramiento`
  ADD CONSTRAINT `FK_47359ae928c0f0c37e3ca8d8848` FOREIGN KEY (`idEstadoDecision`) REFERENCES `estado_decision` (`idEstadoDecision`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_5b768ce2dada11dab96e2fc7ee6` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`idUsuario`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_6be813facd601eb0217ff054e4b` FOREIGN KEY (`idAprendiz`) REFERENCES `aprendices` (`idAprendiz`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_73630a2fb200e87e307b6ec8e7e` FOREIGN KEY (`idMotivoComite`) REFERENCES `motivos_comite` (`idMotivoComite`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_d180f7f57f834198ff5e84cad10` FOREIGN KEY (`IdQueja`) REFERENCES `quejas_comite` (`idQueja`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `programa_coordinacion`
  ADD CONSTRAINT `FK_526fd05199324e4007bc92d7cb4` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`idUsuario`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_e4bfedaf692dd784723108ca072` FOREIGN KEY (`idProgramaFormativo`) REFERENCES `programas_formativos` (`idProgramaFormativo`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `quejas_comite`
  ADD CONSTRAINT `FK_20035e996089f892e9cf65b7b9f` FOREIGN KEY (`idAprendiz`) REFERENCES `aprendices` (`idAprendiz`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_421d71926a4d2bb73f321bf6343` FOREIGN KEY (`idResultadoAprendizaje`) REFERENCES `resultado_aprendizaje` (`idResultadoAprendizaje`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_90a90a1055f8f5ce17d5ddd30ca` FOREIGN KEY (`idDecisionComite`) REFERENCES `decision_comite` (`idDecision`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_a0d91cf619ae50f7c5a294e6a29` FOREIGN KEY (`idEstadoQueja`) REFERENCES `estado_quejas` (`idEstadoQuejas`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_a7533f040fe917ad7149242c3ab` FOREIGN KEY (`idComite`) REFERENCES `comite` (`idComite`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_ce6142f6ad09111d469db272693` FOREIGN KEY (`idMotivoComite`) REFERENCES `motivos_comite` (`idMotivoComite`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_dd325006f37ca8b424ca211f6c1` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`idUsuario`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_f08643cd06dd752a2430a06be95` FOREIGN KEY (`idObservacionAprendiz`) REFERENCES `observaciones_aprendiz` (`idObservacionAprendiz`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_f866a07939c693164f0ea4b993f` FOREIGN KEY (`idCompetencia`) REFERENCES `competencias` (`idCompetencia`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `resultado_aprendizaje`
  ADD CONSTRAINT `FK_9bf2b637da016d9c799b6b0dfd6` FOREIGN KEY (`IdCompetencia`) REFERENCES `competencias` (`idCompetencia`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `roles_permisos`
  ADD CONSTRAINT `FK_1d34a4fffb5474d1513d3018f0c` FOREIGN KEY (`idRol`) REFERENCES `roles` (`idRol`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_ac8fc5c3587bcad4edae7ae1bd9` FOREIGN KEY (`idPermiso`) REFERENCES `permisos` (`idPermiso`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `spf_archivos_proyecto`
  ADD CONSTRAINT `FK_2db3d009aaf79037a6fa75ea470` FOREIGN KEY (`idCompetencia`) REFERENCES `competencias` (`idCompetencia`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_6740bef91e41501b8be76b8f37f` FOREIGN KEY (`idResultadoAprendizaje`) REFERENCES `resultado_aprendizaje` (`idResultadoAprendizaje`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_874d5924a3cf35c358ca2014377` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`idUsuario`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_9549eebdf05eef6892b805f9c82` FOREIGN KEY (`idGrupoProyecto`) REFERENCES `spf_grupos_proyecto` (`idGrupoProyecto`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `spf_grupos_proyecto`
  ADD CONSTRAINT `FK_32b8f0b4361098c261e5bd7d448` FOREIGN KEY (`idFicha`) REFERENCES `fichas` (`idFicha`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `usuarios`
  ADD CONSTRAINT `FK_1cd486e9216c66d450ef9b70740` FOREIGN KEY (`idRol`) REFERENCES `roles` (`idRol`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_52bb2c1c0e9c6ba0f0c1e8250ff` FOREIGN KEY (`idTipoDocumento`) REFERENCES `tipo_documento` (`idTipoDocumento`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;
