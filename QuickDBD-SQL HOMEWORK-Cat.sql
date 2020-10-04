-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/hVYtYS
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "department" (
    "dept_no" int   NOT NULL,
    "dept_name" VARCHAR()   NOT NULL,
    CONSTRAINT "pk_department" PRIMARY KEY (
        "dept_no"
     )
);

CREATE TABLE "department_employees" (
    "emp_no" int   NOT NULL,
    "dept_no" int   NOT NULL
);

CREATE TABLE "department_managers" (
    "dept_no" int   NOT NULL,
    "emp_no" int   NOT NULL
);

CREATE TABLE "employees" (
    "emp_no" int   NOT NULL,
    "emp_title_id" int   NOT NULL,
    "birth_date" date   NOT NULL,
    "first_name" VARCHAR()   NOT NULL,
    "last_name" VARCHAR()   NOT NULL,
    "sex" VARCHAR()   NOT NULL,
    "hire_date" date   NOT NULL,
    CONSTRAINT "pk_employees" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "salaries" (
    "emp_no" int   NOT NULL,
    "salary" int   NOT NULL
);

CREATE TABLE "titles" (
    "title_id" int   NOT NULL,
    "title" VARCHAR()   NOT NULL
);

ALTER TABLE "department" ADD CONSTRAINT "fk_department_dept_no" FOREIGN KEY("dept_no")
REFERENCES "department_employees" ("dept_no");

ALTER TABLE "department_employees" ADD CONSTRAINT "fk_department_employees_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "department_managers" ADD CONSTRAINT "fk_department_managers_emp_no" FOREIGN KEY("emp_no")
REFERENCES "salaries" ("emp_no");

ALTER TABLE "employees" ADD CONSTRAINT "fk_employees_emp_no" FOREIGN KEY("emp_no")
REFERENCES "department_managers" ("emp_no");

ALTER TABLE "titles" ADD CONSTRAINT "fk_titles_title_id" FOREIGN KEY("title_id")
REFERENCES "employees" ("emp_title_id");

