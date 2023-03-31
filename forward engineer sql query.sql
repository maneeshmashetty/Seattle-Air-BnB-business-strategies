-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Airbnb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Airbnb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Airbnb` DEFAULT CHARACTER SET utf8 ;
USE `Airbnb` ;

-- -----------------------------------------------------
-- Table `Airbnb`.`Host_URL`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Airbnb`.`Host_URL` (
  `Host_URL_ID` INT NOT NULL,
  `host_url` VARCHAR(500) NULL,
  `host_thumbnail_url` VARCHAR(500) NULL,
  `host_picture_url` VARCHAR(500) NULL,
  PRIMARY KEY (`Host_URL_ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Airbnb`.`Host`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Airbnb`.`Host` (
  `Host_ID` INT NOT NULL,
  `host_name` VARCHAR(45) NULL,
  `host_since` DATE NULL,
  `host_city` VARCHAR(100) NULL,
  `host_state` VARCHAR(45) NULL,
  `host_country` VARCHAR(45) NULL,
  `host_about` LONGTEXT NULL,
  `host_response_time` VARCHAR(45) NULL,
  `host_response_rate` DECIMAL(3,2) NULL,
  `host_acceptance_rate` DECIMAL(3,2) NULL,
  `host_is_superhost` ENUM('t', 'f') NULL,
  `host_neighbourhood` VARCHAR(45) NULL,
  `host_listings_count` INT NULL,
  `host_total_listings_count` INT NULL,
  `calculated_host_listings_count` INT NULL,
  `host_has_profile_pic` ENUM('t', 'f') NULL,
  `host_identity_verified` ENUM('t', 'f') NULL,
  `Host_URL_ID` INT NOT NULL,
  PRIMARY KEY (`Host_ID`),
  INDEX `fk_Host_Host_URL1_idx` (`Host_URL_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Host_Host_URL1`
    FOREIGN KEY (`Host_URL_ID`)
    REFERENCES `Airbnb`.`Host_URL` (`Host_URL_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Airbnb`.`Listing`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Airbnb`.`Listing` (
  `Listing_ID` INT NOT NULL,
  `Name` VARCHAR(90) NULL,
  `Summary` LONGTEXT NULL,
  `Space` LONGTEXT NULL,
  `Description` LONGTEXT NULL,
  `Experiences_Offered` VARCHAR(25) NULL,
  `Neighbourhood_Overview` LONGTEXT NULL,
  `Notes` LONGTEXT NULL,
  `Transit` LONGTEXT NULL,
  `Requires_License` ENUM('t', 'f') NULL,
  `License` VARCHAR(45) NULL,
  `Jurisdiction_Names` VARCHAR(45) NULL,
  `Instant_Bookable` ENUM('t', 'f') NULL,
  `Cancellation_Policy` VARCHAR(45) NULL,
  `Require_Guest_Profile_Picture` ENUM('t', 'f') NULL,
  `Require_Guest_Phone_Verification` ENUM('t', 'f') NULL,
  `guests_included` INT NULL,
  `minimum_nights` INT NULL,
  `maximum_nights` INT NULL,
  `calendar_updated` VARCHAR(45) NULL,
  `has_availability` ENUM('t', 'f') NULL,
  `availability_30` INT NULL,
  `availability_60` INT NULL,
  `availability_90` INT NULL,
  `availability_365` INT NULL,
  `calendar_last_scraped` DATE NULL,
  `Host_ID` INT NOT NULL,
  PRIMARY KEY (`Listing_ID`, `Host_ID`),
  INDEX `fk_Listing_Host_idx` (`Host_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Listing_Host`
    FOREIGN KEY (`Host_ID`)
    REFERENCES `Airbnb`.`Host` (`Host_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Airbnb`.`Reviewers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Airbnb`.`Reviewers` (
  `Reviewers_ID` INT NOT NULL,
  `Reviewer_Name` VARCHAR(45) NULL,
  PRIMARY KEY (`Reviewers_ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Airbnb`.`Reviews`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Airbnb`.`Reviews` (
  `Listing_ID` INT NOT NULL,
  `Reviews_ID` INT NOT NULL,
  `Reviewers_ID` INT NOT NULL,
  `Comments` MEDIUMTEXT NULL,
  `Review_Dates` DATE NULL,
  PRIMARY KEY (`Reviews_ID`, `Reviewers_ID`),
  INDEX `fk_Reviews_Listing1_idx` (`Listing_ID` ASC) VISIBLE,
  INDEX `fk_Reviews_Reviewers1_idx` (`Reviewers_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Reviews_Listing1`
    FOREIGN KEY (`Listing_ID`)
    REFERENCES `Airbnb`.`Listing` (`Listing_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Reviews_Reviewers1`
    FOREIGN KEY (`Reviewers_ID`)
    REFERENCES `Airbnb`.`Reviewers` (`Reviewers_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Airbnb`.`Review_Scores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Airbnb`.`Review_Scores` (
  `Listing_ID` INT NOT NULL,
  `Review_Scores_ID` INT NOT NULL,
  `number_of_reviews` INT NULL,
  `review_scores_rating` INT NULL,
  `review_scores_accuracy` INT NULL,
  `review_scores_cleanliness` INT NULL,
  `review_scores_checkin` INT NULL,
  `review_scores_communication` INT NULL,
  `review_scores_location` INT NULL,
  `review_scores_value` INT NULL,
  `reviews_per_month` FLOAT NULL,
  `first_review` DATE NULL,
  `last_review` DATE NULL,
  PRIMARY KEY (`Review_Scores_ID`),
  INDEX `fk_Review_Scores_Listing1_idx` (`Listing_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Review_Scores_Listing1`
    FOREIGN KEY (`Listing_ID`)
    REFERENCES `Airbnb`.`Listing` (`Listing_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Airbnb`.`Listing_URL`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Airbnb`.`Listing_URL` (
  `Listing_ID` INT NOT NULL,
  `Listing_Url_ID` INT NOT NULL,
  `listing_url` VARCHAR(500) NULL,
  `thumbnail_url` VARCHAR(500) NULL,
  `medium_url` VARCHAR(500) NULL,
  `picture_url` VARCHAR(500) NULL,
  `xl_picture_url` VARCHAR(500) NULL,
  PRIMARY KEY (`Listing_ID`, `Listing_Url_ID`),
  INDEX `fk_Listing_URL_Listing1_idx` (`Listing_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Listing_URL_Listing1`
    FOREIGN KEY (`Listing_ID`)
    REFERENCES `Airbnb`.`Listing` (`Listing_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Airbnb`.`Price`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Airbnb`.`Price` (
  `Listing_ID` INT NOT NULL,
  `PriceID` INT NOT NULL,
  `price` DECIMAL(6,2) NULL,
  `weekly_price` DECIMAL(6,2) NULL,
  `monthly_price` DECIMAL(7,2) NULL,
  `security_deposit` DECIMAL(6,2) NULL,
  `cleaning_fee` DECIMAL(5,2) NULL,
  `extra_people` DECIMAL(5,2) NULL,
  PRIMARY KEY (`Listing_ID`, `PriceID`),
  INDEX `fk_Price_Listing1_idx` (`Listing_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Price_Listing1`
    FOREIGN KEY (`Listing_ID`)
    REFERENCES `Airbnb`.`Listing` (`Listing_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Airbnb`.`Property_Details`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Airbnb`.`Property_Details` (
  `Listing_ID` INT NOT NULL,
  `Property_Details_ID` INT NOT NULL,
  `property_type` VARCHAR(45) NULL,
  `room_type` VARCHAR(45) NULL,
  `accommodates` INT NULL,
  `bathrooms` DECIMAL(2,1) NULL,
  `bedrooms` INT NULL,
  `beds` INT NULL,
  `bed_type` VARCHAR(45) NULL,
  `square_feet` INT NULL,
  PRIMARY KEY (`Listing_ID`, `Property_Details_ID`),
  INDEX `fk_Property_Details_Listing1_idx` (`Listing_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Property_Details_Listing1`
    FOREIGN KEY (`Listing_ID`)
    REFERENCES `Airbnb`.`Listing` (`Listing_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Airbnb`.`Listing_Addresses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Airbnb`.`Listing_Addresses` (
  `Listing_ID` INT NOT NULL,
  `Listing_Addresses_ID` INT NOT NULL,
  `street` VARCHAR(250) NULL,
  `neighbourhood` VARCHAR(45) NULL,
  `neighbourhood_cleansed` VARCHAR(45) NULL,
  `neighbourhood_group_cleansed` VARCHAR(45) NULL,
  `city` VARCHAR(45) NULL,
  `state` VARCHAR(45) NULL,
  `zipcode` VARCHAR(45) NULL,
  `market` VARCHAR(45) NULL,
  `country` VARCHAR(45) NULL,
  `latitude` DECIMAL(10,8) NULL,
  `longitude` DECIMAL(11,8) NULL,
  `is_location_exact` ENUM('t', 'f') NULL,
  PRIMARY KEY (`Listing_ID`, `Listing_Addresses_ID`),
  INDEX `fk_Listing_Addresses_Listing1_idx` (`Listing_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Listing_Addresses_Listing1`
    FOREIGN KEY (`Listing_ID`)
    REFERENCES `Airbnb`.`Listing` (`Listing_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Airbnb`.`Amenities`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Airbnb`.`Amenities` (
  `Listing_ID` INT NOT NULL,
  `AmenitiesID` INT NOT NULL,
  `TV` ENUM('1', '0') NULL,
  `Internet` ENUM('1', '0') NULL,
  `Wireless_Internet` ENUM('1', '0') NULL,
  `Cable_TV` ENUM('1', '0') NULL,
  `Air_Conditioning` ENUM('1', '0') NULL,
  `Kitchen` ENUM('1', '0') NULL,
  `Elevator_In_Building` ENUM('1', '0') NULL,
  `Wheelchair_Accessible` ENUM('1', '0') NULL,
  `Smoke_Detector` ENUM('1', '0') NULL,
  `Free_Parking_on_Premises` ENUM('1', '0') NULL,
  `Pool` ENUM('1', '0') NULL,
  `Pets_live_on_this_property` ENUM('1', '0') NULL,
  `Breakfast` ENUM('1', '0') NULL,
  `Gym` ENUM('1', '0') NULL,
  `Heating` ENUM('1', '0') NULL,
  `Washer` ENUM('1', '0') NULL,
  `Buzzer/Wireless_Intercom` ENUM('1', '0') NULL,
  `Smoking_Allowed` ENUM('1', '0') NULL,
  `Carbon_Monoxide_Detector` ENUM('1', '0') NULL,
  `Pets_Allowed` ENUM('1', '0') NULL,
  `Indoor_Fireplace` ENUM('1', '0') NULL,
  `Dryer` ENUM('1', '0') NULL,
  `Dog(s)` ENUM('1', '0') NULL,
  `Family/Kid_Friendly` ENUM('1', '0') NULL,
  `Hot_Tub` ENUM('1', '0') NULL,
  `Cat(s)` ENUM('1', '0') NULL,
  `Essentials` ENUM('1', '0') NULL,
  `Shampoo` ENUM('1', '0') NULL,
  `First_Aid_Kit` ENUM('1', '0') NULL,
  `Doorman` ENUM('1', '0') NULL,
  `Fire_Extinguisher` ENUM('1', '0') NULL,
  `Safety_Card` ENUM('1', '0') NULL,
  `Washer/Dryer` ENUM('1', '0') NULL,
  `Suitable_for_Events` ENUM('1', '0') NULL,
  `Other_pet(s)` ENUM('1', '0') NULL,
  `Hangers` ENUM('1', '0') NULL,
  `24-Hours_Checkin` ENUM('1', '0') NULL,
  `Laptop_Friendly_Workspace` ENUM('1', '0') NULL,
  `Lock_On_Bedroom_Door` ENUM('1', '0') NULL,
  `Hair_Dryer` ENUM('1', '0') NULL,
  `Iron` ENUM('1', '0') NULL,
  PRIMARY KEY (`Listing_ID`, `AmenitiesID`),
  INDEX `fk_Amenities_Listing1_idx` (`Listing_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Amenities_Listing1`
    FOREIGN KEY (`Listing_ID`)
    REFERENCES `Airbnb`.`Listing` (`Listing_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Airbnb`.`Calender`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Airbnb`.`Calender` (
  `Listing_ID` INT NOT NULL,
  `Date` DATE NULL,
  `Available` ENUM('t', 'f') NULL,
  `Price` DECIMAL(10,2) NULL,
  PRIMARY KEY (`Listing_ID`),
  CONSTRAINT `fk_Calender_Listing1`
    FOREIGN KEY (`Listing_ID`)
    REFERENCES `Airbnb`.`Listing` (`Listing_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Airbnb`.`Host_Verification`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Airbnb`.`Host_Verification` (
  `Host_ID` INT NOT NULL,
  `host_verification_id` INT NOT NULL,
  `email` ENUM('t', 'f') NULL,
  `phone` ENUM('t', 'f') NULL,
  `google` ENUM('t', 'f') NULL,
  `reviews` ENUM('t', 'f') NULL,
  `facebook` ENUM('t', 'f') NULL,
  `linkedin` ENUM('t', 'f') NULL,
  `jumio` ENUM('t', 'f') NULL,
  `kba` ENUM('t', 'f') NULL,
  `manual_online` ENUM('t', 'f') NULL,
  `manual_offline` ENUM('t', 'f') NULL,
  `amex` ENUM('t', 'f') NULL,
  `sent_id` ENUM('t', 'f') NULL,
  `weibo` ENUM('t', 'f') NULL,
  `photographer` ENUM('t', 'f') NULL,
  PRIMARY KEY (`Host_ID`, `host_verification_id`),
  INDEX `fk_Host_Verification_Host1_idx` (`Host_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Host_Verification_Host1`
    FOREIGN KEY (`Host_ID`)
    REFERENCES `Airbnb`.`Host` (`Host_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
