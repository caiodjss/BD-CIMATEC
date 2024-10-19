-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`CategoriaProduto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`CategoriaProduto` (
  `CategoriaID` INT NOT NULL AUTO_INCREMENT,
  `Nome` VARCHAR(45) NOT NULL,
  `Descricao` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`CategoriaID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Produtos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Produtos` (
  `ProdutoID` INT NOT NULL AUTO_INCREMENT,
  `Nome` VARCHAR(45) NOT NULL,
  `Descricao` VARCHAR(45) NOT NULL,
  `Preco` DECIMAL NOT NULL,
  `QuantidadeEstoque` INT NOT NULL,
  `CategoriaID_FK` INT NOT NULL,
  PRIMARY KEY (`ProdutoID`),
  INDEX `Produtos - CategoriaProduto_idx` (`CategoriaID_FK` ASC) VISIBLE,
  CONSTRAINT `Produtos - CategoriaProduto`
    FOREIGN KEY (`CategoriaID_FK`)
    REFERENCES `mydb`.`CategoriaProduto` (`CategoriaID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Clientes` (
  `ClienteID` INT NOT NULL AUTO_INCREMENT,
  `Nome` VARCHAR(45) NOT NULL,
  `CPF` INT NOT NULL,
  `Email` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ClienteID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ContatoCliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`ContatoCliente` (
  `ContatoClienteID` INT NOT NULL AUTO_INCREMENT,
  `Telefone` INT NOT NULL,
  `Endereco` VARCHAR(45) NOT NULL,
  `Cidade` VARCHAR(15) NOT NULL,
  `Estado` VARCHAR(2) NOT NULL,
  `CEP` VARCHAR(10) NOT NULL,
  `ClienteID_FK` INT NOT NULL,
  PRIMARY KEY (`ContatoClienteID`),
  INDEX `Contato - Cliente_idx` (`ClienteID_FK` ASC) VISIBLE,
  CONSTRAINT `Contato - Cliente`
    FOREIGN KEY (`ClienteID_FK`)
    REFERENCES `mydb`.`Clientes` (`ClienteID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Pedidos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Pedidos` (
  `PedidosID` INT NOT NULL AUTO_INCREMENT,
  `DataPedido` DATE NOT NULL,
  `ValorTotal` DECIMAL NOT NULL,
  `ClienteID_FK` INT NOT NULL,
  PRIMARY KEY (`PedidosID`),
  INDEX `Pedidos - Clientes_idx` (`ClienteID_FK` ASC) VISIBLE,
  CONSTRAINT `Pedidos - Clientes`
    FOREIGN KEY (`ClienteID_FK`)
    REFERENCES `mydb`.`Clientes` (`ClienteID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = '	';


-- -----------------------------------------------------
-- Table `mydb`.`DetalhesPedidos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`DetalhesPedidos` (
  `DetalhesID` INT NOT NULL AUTO_INCREMENT,
  `Quantidade` INT NOT NULL,
  `PrecoUnitario` DECIMAL NOT NULL,
  `PedidoID_FK` INT NOT NULL,
  `ProdutoID_FK` INT NOT NULL,
  PRIMARY KEY (`DetalhesID`),
  INDEX `Detalhes - Pedido_idx` (`PedidoID_FK` ASC) VISIBLE,
  INDEX `Detalhe - Produto_idx` (`ProdutoID_FK` ASC) VISIBLE,
  CONSTRAINT `Detalhes - Pedido`
    FOREIGN KEY (`PedidoID_FK`)
    REFERENCES `mydb`.`Pedidos` (`PedidosID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Detalhe - Produto`
    FOREIGN KEY (`ProdutoID_FK`)
    REFERENCES `mydb`.`Produtos` (`ProdutoID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`EstornoPedido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`EstornoPedido` (
  `EstornoPedidoID` INT NOT NULL AUTO_INCREMENT,
  `DataEstorno` DATE NOT NULL,
  `ValorEstornado` DECIMAL NOT NULL,
  `Motivo` VARCHAR(100) NOT NULL,
  `PedidoID_FK` INT NOT NULL,
  PRIMARY KEY (`EstornoPedidoID`),
  INDEX `Estorno - Pedido_idx` (`PedidoID_FK` ASC) VISIBLE,
  CONSTRAINT `Estorno - Pedido`
    FOREIGN KEY (`PedidoID_FK`)
    REFERENCES `mydb`.`Pedidos` (`PedidosID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`HistoricoPrecos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`HistoricoPrecos` (
  `HistoricoID` INT NOT NULL AUTO_INCREMENT,
  `PrecoAntigo` DECIMAL NOT NULL,
  `PrecoNovo` DECIMAL NOT NULL,
  `DataAlteracao` DATE NOT NULL,
  `ProdutoID_FK` INT NOT NULL,
  PRIMARY KEY (`HistoricoID`),
  INDEX `Historico - Produto_idx` (`ProdutoID_FK` ASC) VISIBLE,
  CONSTRAINT `Historico - Produto`
    FOREIGN KEY (`ProdutoID_FK`)
    REFERENCES `mydb`.`Produtos` (`ProdutoID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`MovimentacaoEstoque`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`MovimentacaoEstoque` (
  `MovimentacaoID` INT NOT NULL AUTO_INCREMENT,
  `TipoMovimentacao` VARCHAR(1) NOT NULL,
  `Quantidade` INT NOT NULL,
  `DataMovimentacao` DATE NOT NULL,
  `ProdutoID_FK` INT NOT NULL,
  PRIMARY KEY (`MovimentacaoID`),
  INDEX `Movimentação - Produto_idx` (`ProdutoID_FK` ASC) VISIBLE,
  CONSTRAINT `Movimentação - Produto`
    FOREIGN KEY (`ProdutoID_FK`)
    REFERENCES `mydb`.`Produtos` (`ProdutoID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
