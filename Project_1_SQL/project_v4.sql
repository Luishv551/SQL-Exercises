-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema cs_lhs73326
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema cs_lhs73326
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `cs_lhs73326` ;
USE `cs_lhs73326` ;

-- -----------------------------------------------------
-- Table `cs_lhs73326`.`Product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cs_lhs73326`.`Product` (
  `idProduct` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `category` VARCHAR(45) NULL,
  `price` DECIMAL(2) NULL,
  PRIMARY KEY (`idProduct`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cs_lhs73326`.`Customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cs_lhs73326`.`Customer` (
  `idCustomer` INT NOT NULL,
  `firstName` VARCHAR(45) NOT NULL,
  `lastName` VARCHAR(45) NULL,
  `DOB` DATE NULL,
  `City` VARCHAR(45) NULL,
  `State` VARCHAR(45) NULL,
  PRIMARY KEY (`idCustomer`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cs_lhs73326`.`Orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cs_lhs73326`.`Orders` (
  `idOrders` INT NOT NULL,
  `Customer_idCustomer` INT NOT NULL,
  `Orders_idOrders` INT NOT NULL,
  PRIMARY KEY (`idOrders`),
  INDEX `fk_Orders_Customer1_idx` (`Customer_idCustomer` ASC),
  INDEX `fk_Orders_Orders1_idx` (`Orders_idOrders` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cs_lhs73326`.`OrderItems`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cs_lhs73326`.`OrderItems` (
  `idOrderItems` INT NOT NULL,
  `Quantity_in_Stock` INT NOT NULL,
  `Product_idProduct` INT NOT NULL,
  `Orders_idOrders` INT NOT NULL,
  PRIMARY KEY (`idOrderItems`),
  INDEX `fk_OrderItems_Product1_idx` (`Product_idProduct` ASC),
  INDEX `fk_OrderItems_Orders1_idx` (`Orders_idOrders` ASC),
  CONSTRAINT `fk_OrderItems_Product1`
    FOREIGN KEY (`Product_idProduct`)
    REFERENCES `cs_lhs73326`.`Product` (`idProduct`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_OrderItems_Orders1`
    FOREIGN KEY (`Orders_idOrders`)
    REFERENCES `cs_lhs73326`.`Orders` (`idOrders`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cs_lhs73326`.`List`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cs_lhs73326`.`List` (
  `IdList` INT NOT NULL,
  `Customer_idCustomer` INT NOT NULL,
  PRIMARY KEY (`IdList`, `Customer_idCustomer`),
  INDEX `fk_ShoppingSession_Customer1_idx` (`Customer_idCustomer` ASC),
  CONSTRAINT `fk_ShoppingSession_Customer1`
    FOREIGN KEY (`Customer_idCustomer`)
    REFERENCES `cs_lhs73326`.`Customer` (`idCustomer`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cs_lhs73326`.`Items_In_List`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cs_lhs73326`.`Items_In_List` (
  `idCartItem` INT NOT NULL,
  `Product_idProduct` INT NOT NULL,
  `Quantity` INT NULL,
  `List_IdList` INT NOT NULL,
  `List_Customer_idCustomer` INT NOT NULL,
  PRIMARY KEY (`idCartItem`),
  INDEX `fk_CartItem_Product1_idx` (`Product_idProduct` ASC),
  INDEX `fk_Items_In_List_List1_idx` (`List_IdList` ASC, `List_Customer_idCustomer` ASC),
  CONSTRAINT `fk_CartItem_Product1`
    FOREIGN KEY (`Product_idProduct`)
    REFERENCES `cs_lhs73326`.`Product` (`idProduct`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Items_In_List_List1`
    FOREIGN KEY (`List_IdList` , `List_Customer_idCustomer`)
    REFERENCES `cs_lhs73326`.`List` (`IdList` , `Customer_idCustomer`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `cs_lhs73326`.`Store`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cs_lhs73326`.`Store` (
  `Store_ID` INT NOT NULL,
  `Store_Name` VARCHAR(45) NULL,
  `Store_City` VARCHAR(45) NULL,
  `Store_State` VARCHAR(45) NULL,
  PRIMARY KEY (`Store_ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cs_lhs73326`.`Membership`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cs_lhs73326`.`Membership` (
  `idMembership` INT NOT NULL,
  `Level` VARCHAR(45) NULL,
  `Store_Store_ID` INT NOT NULL,
  PRIMARY KEY (`idMembership`, `Store_Store_ID`),
  INDEX `fk_Membership_Store1_idx` (`Store_Store_ID` ASC),
  CONSTRAINT `fk_Membership_Store1`
    FOREIGN KEY (`Store_Store_ID`)
    REFERENCES `cs_lhs73326`.`Store` (`Store_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cs_lhs73326`.`MembershipStatus`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cs_lhs73326`.`MembershipStatus` (
  `Customer_idCustomer` INT NOT NULL,
  `StartDate` DATE NULL,
  `EndDate` DATE NULL,
  `Membership_idMembership` INT NOT NULL,
  PRIMARY KEY (`Customer_idCustomer`, `Membership_idMembership`),
  INDEX `fk_Customer_has_Membership_Customer1_idx` (`Customer_idCustomer` ASC),
  INDEX `fk_Membership Status_Membership1_idx` (`Membership_idMembership` ASC),
  CONSTRAINT `fk_Customer_has_Membership_Customer1`
    FOREIGN KEY (`Customer_idCustomer`)
    REFERENCES `cs_lhs73326`.`Customer` (`idCustomer`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Membership Status_Membership1`
    FOREIGN KEY (`Membership_idMembership`)
    REFERENCES `cs_lhs73326`.`Membership` (`idMembership`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cs_lhs73326`.`OrderStatus`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cs_lhs73326`.`OrderStatus` (
  `idOrderStatus` INT NOT NULL,
  `Status_Order` VARCHAR(45) NULL,
  `DeliveryDate` INT NOT NULL,
  `Orders_idOrders` INT NOT NULL,
  `Payment_Status` INT NOT NULL,
  PRIMARY KEY (`idOrderStatus`),
  INDEX `fk_OrderStatus_Orders1_idx` (`Orders_idOrders` ASC),
  CONSTRAINT `fk_OrderStatus_Orders1`
    FOREIGN KEY (`Orders_idOrders`)
    REFERENCES `cs_lhs73326`.`Orders` (`idOrders`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cs_lhs73326`.`Product_In_Store`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cs_lhs73326`.`Product_In_Store` (
  `Store_Store_ID` INT NOT NULL,
  `Product_idProduct` INT NOT NULL,
  `Quantity_In_Store` VARCHAR(45) NULL,
  PRIMARY KEY (`Store_Store_ID`, `Product_idProduct`),
  INDEX `fk_Product_In_Store_Product1_idx` (`Product_idProduct` ASC),
  CONSTRAINT `fk_Product_In_Store_Store1`
    FOREIGN KEY (`Store_Store_ID`)
    REFERENCES `cs_lhs73326`.`Store` (`Store_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Product_In_Store_Product1`
    FOREIGN KEY (`Product_idProduct`)
    REFERENCES `cs_lhs73326`.`Product` (`idProduct`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
SET FOREIGN_KEY_CHECKS=1;









 












