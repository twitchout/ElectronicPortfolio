-- userauthsystem database
-- Import this file into a database named: userauthsystem

CREATE TABLE IF NOT EXISTS `users` (
  `id`            INT(11)      NOT NULL AUTO_INCREMENT,
  `username`      VARCHAR(50)  NOT NULL,
  `email`         VARCHAR(100) NOT NULL,
  `password_hash` VARCHAR(255) NOT NULL,
  `remember_token` VARCHAR(255) DEFAULT NULL,
  `created_at`    TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
