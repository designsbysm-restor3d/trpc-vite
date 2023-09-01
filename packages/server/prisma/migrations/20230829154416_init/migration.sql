-- CreateTable
CREATE TABLE "categories" (
    "category_id" SERIAL NOT NULL,
    "category_name" VARCHAR(15) NOT NULL,
    "description" TEXT,

    CONSTRAINT "categories_pkey" PRIMARY KEY ("category_id")
);

-- CreateTable
CREATE TABLE "customers" (
    "customer_id" CHAR NOT NULL,
    "company_name" VARCHAR(40) NOT NULL,
    "contact_name" VARCHAR(30),
    "contact_title" VARCHAR(30),
    "address" VARCHAR(60),
    "city" VARCHAR(15),
    "region" VARCHAR(15),
    "postal_code" VARCHAR(10),
    "country" VARCHAR(15),
    "phone" VARCHAR(24),
    "fax" VARCHAR(24),

    CONSTRAINT "customers_pkey" PRIMARY KEY ("customer_id")
);

-- CreateTable
CREATE TABLE "employee_territories" (
    "employee_id" INTEGER NOT NULL,
    "territory_id" VARCHAR(20) NOT NULL,

    CONSTRAINT "employee_territories_pkey" PRIMARY KEY ("employee_id","territory_id")
);

-- CreateTable
CREATE TABLE "employees" (
    "employee_id" SERIAL NOT NULL,
    "last_name" VARCHAR(20) NOT NULL,
    "first_name" VARCHAR(10) NOT NULL,
    "title" VARCHAR(30),
    "title_of_courtesy" VARCHAR(25),
    "birth_date" DATE,
    "hire_date" DATE,
    "address" VARCHAR(60),
    "city" VARCHAR(15),
    "region" VARCHAR(15),
    "postal_code" VARCHAR(10),
    "country" VARCHAR(15),
    "home_phone" VARCHAR(24),
    "email" TEXT,
    "extension" VARCHAR(4),
    "notes" TEXT,
    "reports_to" INTEGER,
    "photo_path" VARCHAR(255),

    CONSTRAINT "employees_pkey" PRIMARY KEY ("employee_id")
);

-- CreateTable
CREATE TABLE "order_details" (
    "order_id" INTEGER NOT NULL,
    "product_id" INTEGER NOT NULL,
    "unit_price" REAL NOT NULL,
    "quantity" INTEGER NOT NULL,
    "discount" REAL NOT NULL,

    CONSTRAINT "pk_order_details" PRIMARY KEY ("order_id","product_id")
);

-- CreateTable
CREATE TABLE "orders" (
    "order_id" SERIAL NOT NULL,
    "customer_id" CHAR,
    "employee_id" INTEGER,
    "order_date" DATE,
    "required_date" DATE,
    "shipped_date" DATE,
    "ship_via" INTEGER,
    "freight" REAL,
    "ship_name" VARCHAR(40),
    "ship_address" VARCHAR(60),
    "ship_city" VARCHAR(15),
    "ship_region" VARCHAR(15),
    "ship_postal_code" VARCHAR(10),
    "ship_country" VARCHAR(15),

    CONSTRAINT "orders_pkey" PRIMARY KEY ("order_id")
);

-- CreateTable
CREATE TABLE "products" (
    "product_id" SERIAL NOT NULL,
    "product_name" VARCHAR(40) NOT NULL,
    "supplier_id" INTEGER,
    "category_id" INTEGER,
    "quantity_per_unit" VARCHAR(20),
    "unit_price" REAL,
    "units_in_stock" INTEGER,
    "units_on_order" INTEGER,
    "reorder_level" INTEGER,
    "discontinued" INTEGER NOT NULL,

    CONSTRAINT "products_pkey" PRIMARY KEY ("product_id")
);

-- CreateTable
CREATE TABLE "region" (
    "region_id" SERIAL NOT NULL,
    "region_description" CHAR NOT NULL,

    CONSTRAINT "region_pkey" PRIMARY KEY ("region_id")
);

-- CreateTable
CREATE TABLE "shippers" (
    "id" SERIAL NOT NULL,
    "company_name" VARCHAR(40) NOT NULL,
    "phone" VARCHAR(24),

    CONSTRAINT "shippers_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "suppliers" (
    "supplier_id" SERIAL NOT NULL,
    "company_name" VARCHAR(40) NOT NULL,
    "contact_name" VARCHAR(30),
    "contact_title" VARCHAR(30),
    "address" VARCHAR(60),
    "city" VARCHAR(15),
    "region" VARCHAR(15),
    "postal_code" VARCHAR(10),
    "country" VARCHAR(15),
    "phone" VARCHAR(24),
    "fax" VARCHAR(24),
    "homepage" TEXT,

    CONSTRAINT "suppliers_pkey" PRIMARY KEY ("supplier_id")
);

-- CreateTable
CREATE TABLE "territories" (
    "territory_id" VARCHAR(20) NOT NULL,
    "territory_description" CHAR NOT NULL,
    "region_id" INTEGER NOT NULL,

    CONSTRAINT "territories_pkey" PRIMARY KEY ("territory_id")
);

-- CreateTable
CREATE TABLE "us_states" (
    "state_id" SERIAL NOT NULL,
    "state_name" VARCHAR(100),
    "state_abbr" VARCHAR(2),
    "state_region" VARCHAR(50),

    CONSTRAINT "us_states_pkey" PRIMARY KEY ("state_id")
);

-- CreateIndex
CREATE UNIQUE INDEX "employees_email_key" ON "employees"("email");

-- CreateIndex
CREATE UNIQUE INDEX "shippers_company_name_key" ON "shippers"("company_name");

-- AddForeignKey
ALTER TABLE "employee_territories" ADD CONSTRAINT "employee_territories_employee_id_fkey" FOREIGN KEY ("employee_id") REFERENCES "employees"("employee_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "employee_territories" ADD CONSTRAINT "employee_territories_territory_id_fkey" FOREIGN KEY ("territory_id") REFERENCES "territories"("territory_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "employees" ADD CONSTRAINT "employees_reports_to_fkey" FOREIGN KEY ("reports_to") REFERENCES "employees"("employee_id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "order_details" ADD CONSTRAINT "order_details_order_id_fkey" FOREIGN KEY ("order_id") REFERENCES "orders"("order_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "order_details" ADD CONSTRAINT "order_details_product_id_fkey" FOREIGN KEY ("product_id") REFERENCES "products"("product_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "orders" ADD CONSTRAINT "orders_customer_id_fkey" FOREIGN KEY ("customer_id") REFERENCES "customers"("customer_id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "orders" ADD CONSTRAINT "orders_employee_id_fkey" FOREIGN KEY ("employee_id") REFERENCES "employees"("employee_id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "orders" ADD CONSTRAINT "orders_ship_via_fkey" FOREIGN KEY ("ship_via") REFERENCES "shippers"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "products" ADD CONSTRAINT "products_category_id_fkey" FOREIGN KEY ("category_id") REFERENCES "categories"("category_id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "products" ADD CONSTRAINT "products_supplier_id_fkey" FOREIGN KEY ("supplier_id") REFERENCES "suppliers"("supplier_id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "territories" ADD CONSTRAINT "territories_region_id_fkey" FOREIGN KEY ("region_id") REFERENCES "region"("region_id") ON DELETE RESTRICT ON UPDATE CASCADE;
