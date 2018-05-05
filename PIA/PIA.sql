//Tercera Oportunidad  - Botello Alanis Armando Rodrigo 1722884 - //


-- MySQL Workbench Forward Engineering

/* SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0; */
/* SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0; */
/* SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES'; */

-- -----------------------------------------------------
-- Schema databasepia
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS databasepia ;

-- -----------------------------------------------------
-- Schema databasepia
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS databasepia ;
USE [databasepia] ;

-- -----------------------------------------------------
-- Table `databasepia`.`JOBS`
-- -----------------------------------------------------
DROP TABLE IF EXISTS [databasepia`.`JOBS] ;

CREATE TABLE databasepia.JOBS (
  [job_id] INT NOT NULL,
  [job_title] VARCHAR(45) NULL,
  [min_salary] DECIMAL(10,2) NULL,
  [max_salary] DECIMAL(10,2) NULL,
  PRIMARY KEY ([job_id]))
;


-- -----------------------------------------------------
-- Table `databasepia`.`EMPLOYEES`
-- -----------------------------------------------------
DROP TABLE IF EXISTS [databasepia`.`EMPLOYEES] ;

CREATE TABLE databasepia.EMPLOYEES (
  [employee_id] INT NOT NULL,
  [first_name] VARCHAR(45) NULL,
  [last_name] VARCHAR(45) NULL,
  [email] VARCHAR(45) NULL,
  [job_id] INT NULL,
  [phone_number] VARCHAR(45) NULL,
  [hire_date] DATETIME2(0) NULL,
  [salary] DECIMAL(10,2) NULL,
  [commision_pct] DECIMAL(10,2) NULL,
  [manager_id] INT NULL,
  [department_id] INT NULL,
  [EMPLOYEES_employee_id] INT NOT NULL,
  [JOBS_job_id] INT NOT NULL,
  PRIMARY KEY ([employee_id])
 ,
  CONSTRAINT [fk_EMPLOYEES_EMPLOYEES1]
    FOREIGN KEY ([EMPLOYEES_employee_id])
    REFERENCES databasepia.EMPLOYEES ([employee_id])
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT [fk_EMPLOYEES_JOBS1]
    FOREIGN KEY ([JOBS_job_id])
    REFERENCES databasepia.JOBS ([job_id])
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;

CREATE INDEX [fk_EMPLOYEES_EMPLOYEES1_idx] ON databasepia.EMPLOYEES ([EMPLOYEES_employee_id] ASC);
CREATE INDEX [fk_EMPLOYEES_JOBS1_idx] ON databasepia.EMPLOYEES ([JOBS_job_id] ASC);


-- -----------------------------------------------------
-- Table `databasepia`.`ORDERS`
-- -----------------------------------------------------
DROP TABLE IF EXISTS [databasepia`.`ORDERS] ;

CREATE TABLE databasepia.ORDERS (
  [order_id] INT NOT NULL,
  [order_date] DATETIME2(0) NULL,
  [order_mode] VARCHAR(45) NULL,
  [customer_id] INT NULL,
  [order_status] VARCHAR(45) NULL,
  [order_total] VARCHAR(45) NULL,
  [sales_rep_id] VARCHAR(45) NULL,
  [promotion_id] VARCHAR(45) NULL,
  [EMPLOYEES_employee_id] INT NOT NULL,
  PRIMARY KEY ([order_id])
 ,
  CONSTRAINT [fk_ORDERS_EMPLOYEES1]
    FOREIGN KEY ([EMPLOYEES_employee_id])
    REFERENCES databasepia.EMPLOYEES ([employee_id])
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;

CREATE INDEX [fk_ORDERS_EMPLOYEES1_idx] ON databasepia.ORDERS ([EMPLOYEES_employee_id] ASC);


-- -----------------------------------------------------
-- Table `databasepia`.`PRODUCT_INFORMATION`
-- -----------------------------------------------------
DROP TABLE IF EXISTS [databasepia`.`PRODUCT_INFORMATION] ;

CREATE TABLE databasepia.PRODUCT_INFORMATION (
  [product_id] INT NOT NULL,
  [product_name] VARCHAR(45) NULL,
  [product_description] VARCHAR(45) NULL,
  [category_id] INT NULL,
  [weight_class] VARCHAR(45) NULL,
  [warranty_period] DATETIME2(0) NULL,
  [supplier_id] INT NULL,
  [product_status] VARCHAR(45) NULL,
  [list_price] DECIMAL(10,2) NULL,
  [min_price] DECIMAL(10,2) NULL,
  [catalog_url] VARCHAR(45) NULL,
  PRIMARY KEY ([product_id]))
;


-- -----------------------------------------------------
-- Table `databasepia`.`ORDER_ITEMS`
-- -----------------------------------------------------
DROP TABLE IF EXISTS [databasepia`.`ORDER_ITEMS] ;

CREATE TABLE databasepia.ORDER_ITEMS (
  [order_id] INT NOT NULL,
  [product_id] INT NULL,
  [line_item_id] INT IDENTITY() VIRTUAL,
  [unit_price] INT NULL,
  [quantity] INT NULL,
  [ORDERS_order_id] INT NOT NULL,
  [PRODUCT_INFORMATION_product_id] INT NOT NULL,
  PRIMARY KEY ([order_id])
 ,
  CONSTRAINT [fk_ORDER_ITEMS_ORDERS1]
    FOREIGN KEY ([ORDERS_order_id])
    REFERENCES databasepia.ORDERS ([order_id])
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT [fk_ORDER_ITEMS_PRODUCT_INFORMATION1]
    FOREIGN KEY ([PRODUCT_INFORMATION_product_id])
    REFERENCES databasepia.PRODUCT_INFORMATION ([product_id])
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;

CREATE INDEX [fk_ORDER_ITEMS_ORDERS1_idx] ON databasepia.ORDER_ITEMS ([ORDERS_order_id] ASC);
CREATE INDEX [fk_ORDER_ITEMS_PRODUCT_INFORMATION1_idx] ON databasepia.ORDER_ITEMS ([PRODUCT_INFORMATION_product_id] ASC);


-- -----------------------------------------------------
-- Table `databasepia`.`CUSTOMERS`
-- -----------------------------------------------------
DROP TABLE IF EXISTS [databasepia`.`CUSTOMERS] ;

CREATE TABLE databasepia.CUSTOMERS (
  [cust_id] INT NOT NULL,
  [cust_first_name] VARCHAR(45) NULL,
  [cust_last_name] VARCHAR(45) NULL,
  [cust_gender] VARCHAR(45) NULL,
  [cust_year_of_birth] DATETIME2(0) NULL,
  [cust_marital_status] VARCHAR(45) NULL,
  [cust_street_address] VARCHAR(45) NULL,
  [cust_postal_code] INT NULL,
  [cust_city] VARCHAR(45) NULL,
  [cust_city_id] VARCHAR(45) NULL,
  [cust_state_providence] VARCHAR(45) NULL,
  [cust_state_providence_id] VARCHAR(45) NULL,
  [country_id] VARCHAR(45) NULL,
  [cust_main_phone_number] VARCHAR(45) NULL,
  [cust_income_level] VARCHAR(45) NULL,
  [cust_credit_limit] VARCHAR(45) NULL,
  [cust_email] VARCHAR(45) NULL,
  [cust_total] VARCHAR(45) NULL,
  [cust_total_id] INT NULL,
  [cust_src_id] INT NULL,
  [cust_eff_from] VARCHAR(45) NULL,
  [cust_eff_to] VARCHAR(45) NULL,
  [cust_valid] VARCHAR(45) NULL,
  [COUNTRIES_country_id] INT NOT NULL,
  PRIMARY KEY ([cust_id])
 ,
  CONSTRAINT [fk_CUSTOMERSS_COUNTRIES1]
    FOREIGN KEY ([COUNTRIES_country_id])
    REFERENCES databasepia.COUNTRIES ([country_id])
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;

CREATE INDEX [fk_CUSTOMERSS_COUNTRIES1_idx] ON databasepia.CUSTOMERS ([COUNTRIES_country_id] ASC);


-- -----------------------------------------------------
-- Table `databasepia`.`PRODUCT_DESCRIPTIONS`
-- -----------------------------------------------------
DROP TABLE IF EXISTS [databasepia`.`PRODUCT_DESCRIPTIONS] ;

CREATE TABLE databasepia.PRODUCT_DESCRIPTIONS (
  [product_id] INT NOT NULL,
  [language_id] INT NULL,
  [translated_name] VARCHAR(45) NULL,
  [translated_description] VARCHAR(45) NULL,
  [PRODUCT_INFORMATION_product_id] INT NOT NULL,
  PRIMARY KEY ([product_id])
 ,
  CONSTRAINT [fk_PRODUCT_DESCRIPTIONS_PRODUCT_INFORMATION1]
    FOREIGN KEY ([PRODUCT_INFORMATION_product_id])
    REFERENCES databasepia.PRODUCT_INFORMATION ([product_id])
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;

CREATE INDEX [fk_PRODUCT_DESCRIPTIONS_PRODUCT_INFORMATION1_idx] ON databasepia.PRODUCT_DESCRIPTIONS ([PRODUCT_INFORMATION_product_id] ASC);


-- -----------------------------------------------------
-- Table `databasepia`.`WAREHOUSES`
-- -----------------------------------------------------
DROP TABLE IF EXISTS [databasepia`.`WAREHOUSES] ;

CREATE TABLE databasepia.WAREHOUSES (
  [warehouse_id] INT NOT NULL,
  [warehouse_spec] VARCHAR(45) NULL,
  [warehouse_name] VARCHAR(45) NULL,
  [location_id] VARCHAR(45) NULL,
  [wh_geo_location] VARCHAR(45) NULL,
  PRIMARY KEY ([warehouse_id]))
;


-- -----------------------------------------------------
-- Table `databasepia`.`INVENTORIES`
-- -----------------------------------------------------
DROP TABLE IF EXISTS [databasepia`.`INVENTORIES] ;

CREATE TABLE databasepia.INVENTORIES (
  [product_id] INT NOT NULL,
  [warehouse_id] INT NULL,
  [quantity_on_hand] INT NULL,
  [WAREHOUSES_warehouse_id] INT NOT NULL,
  [PRODUCT_INFORMATION_product_id] INT NOT NULL,
  PRIMARY KEY ([product_id])
 ,
  CONSTRAINT [fk_INVENTORIES_WAREHOUSES1]
    FOREIGN KEY ([WAREHOUSES_warehouse_id])
    REFERENCES databasepia.WAREHOUSES ([warehouse_id])
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT [fk_INVENTORIES_PRODUCT_INFORMATION1]
    FOREIGN KEY ([PRODUCT_INFORMATION_product_id])
    REFERENCES databasepia.PRODUCT_INFORMATION ([product_id])
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;

CREATE INDEX [fk_INVENTORIES_WAREHOUSES1_idx] ON databasepia.INVENTORIES ([WAREHOUSES_warehouse_id] ASC);
CREATE INDEX [fk_INVENTORIES_PRODUCT_INFORMATION1_idx] ON databasepia.INVENTORIES ([PRODUCT_INFORMATION_product_id] ASC);


-- -----------------------------------------------------
-- Table `databasepia`.`REGIONS`
-- -----------------------------------------------------
DROP TABLE IF EXISTS [databasepia`.`REGIONS] ;

CREATE TABLE databasepia.REGIONS (
  [region_id] INT NOT NULL,
  [region_name] VARCHAR(45) NULL,
  PRIMARY KEY ([region_id]))
;


-- -----------------------------------------------------
-- Table `databasepia`.`COUNTRIES`
-- -----------------------------------------------------
DROP TABLE IF EXISTS [databasepia`.`COUNTRIES] ;

CREATE TABLE databasepia.COUNTRIES (
  [country_id] INT NOT NULL,
  [country_iso_code] VARCHAR(45) NULL,
  [country_name] VARCHAR(45) NULL,
  [country_subregion] VARCHAR(45) NULL,
  [country_subregion_id] INT NULL,
  [country_region] VARCHAR(45) NULL,
  [country_region_id] INT NULL,
  [country_total] VARCHAR(45) NULL,
  [country_total_id] INT NULL,
  [country_name_hist] VARCHAR(45) NULL,
  PRIMARY KEY ([country_id]))
;


-- -----------------------------------------------------
-- Table `databasepia`.`LOCATIONS`
-- -----------------------------------------------------
DROP TABLE IF EXISTS [databasepia`.`LOCATIONS] ;

CREATE TABLE databasepia.LOCATIONS (
  [location_id] INT NOT NULL,
  [street_address] VARCHAR(45) NULL,
  [postal_code] VARCHAR(45) NULL,
  [city] VARCHAR(45) NULL,
  [state_province] VARCHAR(45) NULL,
  [locationscol] VARCHAR(45) NULL,
  [country_id] INT NULL,
  [COUNTRIES_country_id] INT NOT NULL,
  [WAREHOUSES_warehouse_id] INT NOT NULL,
  PRIMARY KEY ([location_id])
 ,
  CONSTRAINT [fk_LOCATIONS_COUNTRIES1]
    FOREIGN KEY ([COUNTRIES_country_id])
    REFERENCES databasepia.COUNTRIES ([country_id])
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT [fk_LOCATIONS_WAREHOUSES1]
    FOREIGN KEY ([WAREHOUSES_warehouse_id])
    REFERENCES databasepia.WAREHOUSES ([warehouse_id])
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;

CREATE INDEX [fk_LOCATIONS_COUNTRIES1_idx] ON databasepia.LOCATIONS ([COUNTRIES_country_id] ASC);
CREATE INDEX [fk_LOCATIONS_WAREHOUSES1_idx] ON databasepia.LOCATIONS ([WAREHOUSES_warehouse_id] ASC);


-- -----------------------------------------------------
-- Table `databasepia`.`DEPARTMENTS`
-- -----------------------------------------------------
DROP TABLE IF EXISTS [databasepia`.`DEPARTMENTS] ;

CREATE TABLE databasepia.DEPARTMENTS (
  [department_id] INT NOT NULL,
  [department_name] VARCHAR(45) NULL,
  [manager_id] INT NULL,
  [location_id] INT NULL,
  [LOCATIONS_location_id] INT NOT NULL,
  PRIMARY KEY ([department_id])
 ,
  CONSTRAINT [fk_DEPARTMENTS_LOCATIONS1]
    FOREIGN KEY ([LOCATIONS_location_id])
    REFERENCES databasepia.LOCATIONS ([location_id])
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;

CREATE INDEX [fk_DEPARTMENTS_LOCATIONS1_idx] ON databasepia.DEPARTMENTS ([LOCATIONS_location_id] ASC);


-- -----------------------------------------------------
-- Table `databasepia`.`JOB_HISTORY`
-- -----------------------------------------------------
DROP TABLE IF EXISTS [databasepia`.`JOB_HISTORY] ;

CREATE TABLE databasepia.JOB_HISTORY (
  [employee_id] INT NOT NULL,
  [start_date] DATETIME2(0) NULL,
  [end_date] DATETIME2(0) NULL,
  [job_id] INT NULL,
  [department_id] INT NULL,
  [EMPLOYEES_employee_id] INT NOT NULL,
  [JOBS_job_id] INT NOT NULL,
  [DEPARTMENTS_department_id] INT NOT NULL,
  PRIMARY KEY ([employee_id])
 ,
  CONSTRAINT [fk_JOB_HISTORY_EMPLOYEES1]
    FOREIGN KEY ([EMPLOYEES_employee_id])
    REFERENCES databasepia.EMPLOYEES ([employee_id])
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT [fk_JOB_HISTORY_JOBS1]
    FOREIGN KEY ([JOBS_job_id])
    REFERENCES databasepia.JOBS ([job_id])
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT [fk_JOB_HISTORY_DEPARTMENTS1]
    FOREIGN KEY ([DEPARTMENTS_department_id])
    REFERENCES databasepia.DEPARTMENTS ([department_id])
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;

CREATE INDEX [fk_JOB_HISTORY_EMPLOYEES1_idx] ON databasepia.JOB_HISTORY ([EMPLOYEES_employee_id] ASC);
CREATE INDEX [fk_JOB_HISTORY_JOBS1_idx] ON databasepia.JOB_HISTORY ([JOBS_job_id] ASC);
CREATE INDEX [fk_JOB_HISTORY_DEPARTMENTS1_idx] ON databasepia.JOB_HISTORY ([DEPARTMENTS_department_id] ASC);


-- -----------------------------------------------------
-- Table `databasepia`.`TIMES`
-- -----------------------------------------------------
DROP TABLE IF EXISTS [databasepia`.`TIMES] ;

CREATE TABLE databasepia.TIMES (
  [time_id] INT NOT NULL,
  [day_name] VARCHAR(45) NULL,
  [day_number_in_week] INT NULL,
  [day_number_in_month] INT NULL,
  [calendar_week_number] INT NULL,
  [calendar_year] INT NULL,
  [fiscal_week_number] INT NULL,
  [week_ending_day] VARCHAR(45) NULL,
  [week_ending_day_id] INT NULL,
  [calendar_ month_number] VARCHAR(45) NULL,
  [calendar_month_desc] VARCHAR(45) NULL,
  [calendar_month_id] VARCHAR(45) NULL,
  [fiscal_month_desc] VARCHAR(45) NULL,
  [fiscal_month_id] INT NULL,
  [days_in_cal_month] INT NULL,
  [days_in_fis_month] INT NULL,
  [end_of_cal_month] VARCHAR(45) NULL,
  [end_of_fis_month] VARCHAR(45) NULL,
  [calendar_month_name] VARCHAR(45) NULL,
  [fiscal_month_name] VARCHAR(45) NULL,
  [calendar_quarter_desc] VARCHAR(45) NULL,
  [calendar_quarter_id] INT NULL,
  [days_in_cal_quarter] INT NULL,
  [days_in_fis_quarter] INT NULL,
  [end_of_cal_quarter] VARCHAR(45) NULL,
  [end_of_fis_quarter] VARCHAR(45) NULL,
  [calendar_quarter_number] INT NULL,
  [fiscal_quarter_number] INT NULL,
  [calendar_year_id] INT NULL,
  [fiscal_year] INT NULL,
  [fiscal_year_id] INT NULL,
  [days_in_cal_year] INT NULL,
  [days_in_fis_year] INT NULL,
  [end_of_cal_year] VARCHAR(45) NULL,
  [end_of_fis_year] VARCHAR(45) NULL,
  PRIMARY KEY ([time_id]))
;


-- -----------------------------------------------------
-- Table `databasepia`.`PRODUCTS`
-- -----------------------------------------------------
DROP TABLE IF EXISTS [databasepia`.`PRODUCTS] ;

CREATE TABLE databasepia.PRODUCTS (
  [prod_id] INT NOT NULL,
  [prod_name] VARCHAR(45) NULL,
  [prod_desc] VARCHAR(45) NULL,
  [prod_subcategory] VARCHAR(45) NULL,
  [prod_subcategory_id] INT NULL,
  [prod_list_price] DECIMAL(10,2) NULL,
  [prod_subcategory_desc] VARCHAR(45) NULL,
  [prod_category] VARCHAR(45) NULL,
  [prod_category_id] INT NULL,
  [prod_category_desc] VARCHAR(45) NULL,
  [prod_weight_class] VARCHAR(45) NULL,
  [prod_unit_of_measure] INT NULL,
  [prod_pack_size] VARCHAR(45) NULL,
  [supplier_id] INT NULL,
  [prod_status] VARCHAR(45) NULL,
  [prod_min_price] DECIMAL(10,2) NULL,
  [prod_total] DECIMAL(10,2) NULL,
  [prod_total_id] INT NULL,
  [prod_src_id] INT NULL,
  [prod_eff_from] VARCHAR(45) NULL,
  [prod_eff_to] VARCHAR(45) NULL,
  PRIMARY KEY ([prod_id]))
;


-- -----------------------------------------------------
-- Table `databasepia`.`COSTS`
-- -----------------------------------------------------
DROP TABLE IF EXISTS [databasepia`.`COSTS] ;

CREATE TABLE databasepia.COSTS (
  [prod_id] INT NOT NULL,
  [time_id] INT NULL,
  [promo_id] INT NULL,
  [channel_id] INT NULL,
  [unit_cost] DECIMAL(10,2) NULL,
  [unit_price] DECIMAL(10,2) NULL,
  [TIMES_time_id] INT NOT NULL,
  [PRODUCTS_prod_id] INT NOT NULL,
  PRIMARY KEY ([prod_id])
 ,
  CONSTRAINT [fk_COSTS_TIMES]
    FOREIGN KEY ([TIMES_time_id])
    REFERENCES databasepia.TIMES ([time_id])
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT [fk_COSTS_PRODUCTS1]
    FOREIGN KEY ([PRODUCTS_prod_id])
    REFERENCES databasepia.PRODUCTS ([prod_id])
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;

CREATE INDEX [fk_COSTS_TIMES_idx] ON databasepia.COSTS ([TIMES_time_id] ASC);
CREATE INDEX [fk_COSTS_PRODUCTS1_idx] ON databasepia.COSTS ([PRODUCTS_prod_id] ASC);


-- -----------------------------------------------------
-- Table `databasepia`.`CHANNELS`
-- -----------------------------------------------------
DROP TABLE IF EXISTS [databasepia`.`CHANNELS] ;

CREATE TABLE databasepia.CHANNELS (
  [channel_id] INT NOT NULL,
  [channel_desc] VARCHAR(75) NULL,
  [channel_class] VARCHAR(45) NULL,
  [channel_class_id] INT NULL,
  [channel_total] VARCHAR(45) NULL,
  [channel_total_id] INT NULL,
  PRIMARY KEY ([channel_id]))
;


-- -----------------------------------------------------
-- Table `databasepia`.`PROMOTIONS`
-- -----------------------------------------------------
DROP TABLE IF EXISTS [databasepia`.`PROMOTIONS] ;

CREATE TABLE databasepia.PROMOTIONS (
  [promo_id] INT NOT NULL,
  [promo_name] VARCHAR(45) NULL,
  [promo_subcategory] VARCHAR(45) NULL,
  [prome_subcategory_id] INT NULL,
  [promo_category] VARCHAR(45) NULL,
  [romo_category_id] INT NULL,
  [promo_cost] DECIMAL(10,2) NULL,
  [promo_begin_date] DATETIME2(0) NULL,
  [promo_end_date] DATETIME2(0) NULL,
  [promo_total] VARCHAR(45) NULL,
  [promo_total_id] INT NULL,
  PRIMARY KEY ([promo_id]))
;


-- -----------------------------------------------------
-- Table `databasepia`.`COUNTRIES`
-- -----------------------------------------------------
DROP TABLE IF EXISTS [databasepia`.`COUNTRIES] ;

CREATE TABLE databasepia.COUNTRIES (
  [country_id] INT NOT NULL,
  [country_iso_code] VARCHAR(45) NULL,
  [country_name] VARCHAR(45) NULL,
  [country_subregion] VARCHAR(45) NULL,
  [country_subregion_id] INT NULL,
  [country_region] VARCHAR(45) NULL,
  [country_region_id] INT NULL,
  [country_total] VARCHAR(45) NULL,
  [country_total_id] INT NULL,
  [country_name_hist] VARCHAR(45) NULL,
  PRIMARY KEY ([country_id]))
;


-- -----------------------------------------------------
-- Table `databasepia`.`CUSTOMERS`
-- -----------------------------------------------------
DROP TABLE IF EXISTS [databasepia`.`CUSTOMERS] ;

CREATE TABLE databasepia.CUSTOMERS (
  [cust_id] INT NOT NULL,
  [cust_first_name] VARCHAR(45) NULL,
  [cust_last_name] VARCHAR(45) NULL,
  [cust_gender] VARCHAR(45) NULL,
  [cust_year_of_birth] DATETIME2(0) NULL,
  [cust_marital_status] VARCHAR(45) NULL,
  [cust_street_address] VARCHAR(45) NULL,
  [cust_postal_code] INT NULL,
  [cust_city] VARCHAR(45) NULL,
  [cust_city_id] VARCHAR(45) NULL,
  [cust_state_providence] VARCHAR(45) NULL,
  [cust_state_providence_id] VARCHAR(45) NULL,
  [country_id] VARCHAR(45) NULL,
  [cust_main_phone_number] VARCHAR(45) NULL,
  [cust_income_level] VARCHAR(45) NULL,
  [cust_credit_limit] VARCHAR(45) NULL,
  [cust_email] VARCHAR(45) NULL,
  [cust_total] VARCHAR(45) NULL,
  [cust_total_id] INT NULL,
  [cust_src_id] INT NULL,
  [cust_eff_from] VARCHAR(45) NULL,
  [cust_eff_to] VARCHAR(45) NULL,
  [cust_valid] VARCHAR(45) NULL,
  [COUNTRIES_country_id] INT NOT NULL,
  PRIMARY KEY ([cust_id])
 ,
  CONSTRAINT [fk_CUSTOMERSS_COUNTRIES1]
    FOREIGN KEY ([COUNTRIES_country_id])
    REFERENCES databasepia.COUNTRIES ([country_id])
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;

CREATE INDEX [fk_CUSTOMERSS_COUNTRIES1_idx] ON databasepia.CUSTOMERS ([COUNTRIES_country_id] ASC);


-- -----------------------------------------------------
-- Table `databasepia`.`SALES`
-- -----------------------------------------------------
DROP TABLE IF EXISTS [databasepia`.`SALES] ;

CREATE TABLE databasepia.SALES (
  [prod_id] INT NOT NULL,
  [cust_id] INT NULL,
  [time_id] INT NULL,
  [channel_id] INT NULL,
  [promo_id] INT NULL,
  [quantity_sold] VARCHAR(45) NULL,
  [amount_sold] VARCHAR(45) NULL,
  [CHANNELS_channel_id] INT NOT NULL,
  [PROMOTIONS_promo_id] INT NOT NULL,
  [CUSTOMERSS_cust_id] INT NOT NULL,
  [TIMES_time_id] INT NOT NULL,
  [PRODUCTS_prod_id] INT NOT NULL,
  PRIMARY KEY ([prod_id])
 ,
  CONSTRAINT [fk_SALES_CHANNELS1]
    FOREIGN KEY ([CHANNELS_channel_id])
    REFERENCES databasepia.CHANNELS ([channel_id])
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT [fk_SALES_PROMOTIONS1]
    FOREIGN KEY ([PROMOTIONS_promo_id])
    REFERENCES databasepia.PROMOTIONS ([promo_id])
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT [fk_SALES_CUSTOMERSS1]
    FOREIGN KEY ([CUSTOMERSS_cust_id])
    REFERENCES databasepia.CUSTOMERS ([cust_id])
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT [fk_SALES_TIMES1]
    FOREIGN KEY ([TIMES_time_id])
    REFERENCES databasepia.TIMES ([time_id])
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT [fk_SALES_PRODUCTS1]
    FOREIGN KEY ([PRODUCTS_prod_id])
    REFERENCES databasepia.PRODUCTS ([prod_id])
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;

CREATE INDEX [fk_SALES_CHANNELS1_idx] ON databasepia.SALES ([CHANNELS_channel_id] ASC);
CREATE INDEX [fk_SALES_PROMOTIONS1_idx] ON databasepia.SALES ([PROMOTIONS_promo_id] ASC);
CREATE INDEX [fk_SALES_CUSTOMERSS1_idx] ON databasepia.SALES ([CUSTOMERSS_cust_id] ASC);
CREATE INDEX [fk_SALES_TIMES1_idx] ON databasepia.SALES ([TIMES_time_id] ASC);
CREATE INDEX [fk_SALES_PRODUCTS1_idx] ON databasepia.SALES ([PRODUCTS_prod_id] ASC);

USE [databasepia] ;

-- -----------------------------------------------------
-- Placeholder table for view `databasepia`.`view1`
-- -----------------------------------------------------
CREATE TABLE databasepia.view1 ([id] INT);

-- -----------------------------------------------------
-- View `databasepia`.`view1`
-- -----------------------------------------------------
DROP VIEW IF EXISTS [databasepia`.`view1] ;
DROP TABLE IF EXISTS [databasepia`.`view1];
USE [databasepia];


/* SET SQL_MODE=@OLD_SQL_MODE; */
/* SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS; */
/* SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS; */