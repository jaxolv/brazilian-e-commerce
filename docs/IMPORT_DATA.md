This tutorial has a portuguese version: [Leia em Português :brazil:](/docs/IMPORT_DATA_PT-BR.md)

## Importing the Dataset to Your Local Machine
Below is a guide on how you can use this same dataset on your machine to:
- Test the queries updated here;
- Solve the challenges described in this project yourself.

I’ll use my machine (Windows 11) and PostgreSQL (PgAdmin) as the OS and RDBMS references.

**Note:** this tutorial was made for the project [Brazilian E-Commerce](https://www.github.com/jaxolv/brazilian-e-commerce) but it applies to other [repositories that I made](https://github.com/jaxolv?tab=repositories), but pay attention to the changes.

### Requirements
- Git installed;
- A GitHub account linked to your Git;
- An RDBMS installed for relational databases. As mentioned above, I’ll be using PostgreSQL, but you can use any of your preference (MySQL, Oracle, SQL Server, etc);
- Create a specific database for importing and handling this data (to simplify access, use the default port and password of your chosen RDBMS);
- Create tables and write queries within this same database.
    - If you prefer, you can do the same using `VS Code` and centralize everything in a single IDE.

With all these requirements fulfilled, you can follow the tutorial below:

### Step-by-step
#### Clone the repository to your machine

After creating/finding the directory you want to use for this repository, open a command terminal and download the project to your local machine:

Clone this repository:
```
git clone https://github.com/jaxolv/brazilian-e-commerce
```
Enter the created folder:
```
cd brazilian-e-commerce
```

If the repository is different, just replace the links and folder name accordingly.

#### Find the .rar file to extract the data

In the directory `/docs` you will find, besides the files `.md`, the compacted files in the `.zip`and `.rar` formats. One of them will be named `archive.zip`, that's the original file downloaded from Kaggle and this is the default tittle for all the datasets from this site. My recommendation is to neve extracted the data from there, except if you choose to treat the data and create other tables based on them.

The compacted file will have a specific tittle for the project. With the format `.rar`, you'll have the data treated by me and all the *polution* were removed before the creation of the tables to prevent conflicts of type, data insertion and duplicity. This is the file that you will extract the data to import.

After the extraction, you have to find something that looks like this *screenshot*:

![Image 1](/images/094210.png)

#### Create all the tables

Open the `_tables.sql` file and execute all the queries inside, one at a time (avoid running everything simultaneously).

In the case of this specific project, the creation order has to respected in this sequence:
- First, create the tables `customers`, `sellers`, and `products`;
- Then, you must create the data type `order_status_enum` before creating the `order` table;
- Similarly, you must create the data type `payment_type_enum` before creating `order_payments`;
- After that, you can create the remaining tables: `order_items` and `order_reviews`.

In the other repository, you can create the tables in any order you want.

#### Populate the tables

Once the tables are created, you’ll import data into each of them. Each table corresponds directly to a `.csv` file of the same name.

If using PostgreSQL, go to the created database and locate the tables you just created.

Right-click each one and look for the import option. It might be labeled `Import/Export Data...`, as shown in the image below, or simply `Import...`, depending on your RDBMS.

![Image 2](/images/100627.png)

Ensure the import option is configured with the following settings in your RDBMS:
- Delimiter: `;`
- Quote: `"`
- Escape: `'`
- Null: ` `

In the image below, you can see the PgAdmin example for PostgreSQL:

![Image 3](/images/161603.png)

If everything is correct, go back to the main screen and select the `.csv` file corresponding to the table name.

![Image 4](/images/161655.png)

Repeat this process for all other tables. Conflicts will be unlikely, but if any error persists, restart your RDBMS and try again.

#### Optional: Fill out the dotenv file

This step is essential to enable creating `.csv` files from Python scripts and building dashboards.

First, install the packages listed in the `requirements.txt` file.

Open the terminal, ensure you’re in the project’s root directory and that Python is installed on your machine. When everything is ready, run the following command:

```
pip install -r requirements.txt
```

Then, fill in the `.env` file located in the project’s root directory with the following data:
- The name of the database;
- The user;
- The password;
- The host:
    - Usually, `localhost` is used as default, but if it’s different, specify it here;
- The port.

Use the `.env.example` file as a reference. Do not use double quotes ("), single quotes ('), or any other text formatting after the equal sign. Just type the data directly after the equal sign, as shown in the example below:

![Image 5](/images/094922.png)

If you decide to upload this project to your GitHub, make sure the `.env` file is listed in `.gitignore` so this sensitive data doesn’t get uploaded with the repository.