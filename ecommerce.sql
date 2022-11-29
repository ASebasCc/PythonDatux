--
-- Base de datos: `ecommerce`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `document_types`
--

CREATE TABLE `document_types` (
  `id_document_type` int(11) NOT NULL,
  `description` varchar(50) DEFAULT NULL,
  `status_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `document_types`
--

INSERT INTO `document_types` (`id_document_type`, `description`, `status_id`) VALUES
(1, 'dni', 1),
(2, 'ruc', 1),
(3, 'rut', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id_roles` int(11) NOT NULL,
  `description` varchar(50) DEFAULT NULL,
  `status_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id_roles`, `description`, `status_id`) VALUES
(1, 'admin', 1),
(2, 'user', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `status`
--

CREATE TABLE `status` (
  `id_status` int(11) NOT NULL,
  `description` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `status`
--

INSERT INTO `status` (`id_status`, `description`) VALUES
(1, 'active'),
(2, 'inactive');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id_user` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `lastname` varchar(50) DEFAULT NULL,
  `document` varchar(20) DEFAULT NULL,
  `create_at` datetime DEFAULT NULL,
  `modify_at` datetime DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `status_id` int(11) NOT NULL,
  `roles_id` int(11) NOT NULL,
  `document_type_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id_user`, `name`, `lastname`, `document`, `create_at`, `modify_at`, `username`, `password`, `email`, `status_id`, `roles_id`, `document_type_id`) VALUES
(2, 'Dany', 'Carrillo', '42568978', '2022-11-26 05:00:00', '2022-11-26 05:00:00', 'dcarrillo', '$123qws', 'dcarrillo@gmail.com', 1, 1, 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `document_types`
--
ALTER TABLE `document_types`
  ADD PRIMARY KEY (`id_document_type`),
  ADD KEY `fk_document_types_status1` (`status_id`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id_roles`),
  ADD KEY `fk_roles_status1` (`status_id`);

--
-- Indices de la tabla `status`
--
ALTER TABLE `status`
  ADD PRIMARY KEY (`id_status`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`),
  ADD KEY `fk_users_status` (`status_id`),
  ADD KEY `fk_users_document_types1` (`document_type_id`),
  ADD KEY `users_FK` (`roles_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `document_types`
--
ALTER TABLE `document_types`
  MODIFY `id_document_type` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id_roles` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `status`
--
ALTER TABLE `status`
  MODIFY `id_status` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `document_types`
--
ALTER TABLE `document_types`
  ADD CONSTRAINT `fk_document_types_status1` FOREIGN KEY (`status_id`) REFERENCES `status` (`id_status`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `roles`
--
ALTER TABLE `roles`
  ADD CONSTRAINT `fk_roles_status1` FOREIGN KEY (`status_id`) REFERENCES `status` (`id_status`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `fk_users_document_types1` FOREIGN KEY (`document_type_id`) REFERENCES `document_types` (`id_document_type`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_users_status` FOREIGN KEY (`status_id`) REFERENCES `status` (`id_status`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `users_FK` FOREIGN KEY (`roles_id`) REFERENCES `roles` (`id_roles`);
COMMIT;
