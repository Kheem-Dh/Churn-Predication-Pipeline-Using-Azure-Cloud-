import streamlit as st
import pandas as pd
import numpy as np
import pyodbc as pyodbc


def create_local_db_connection(server, database, driver) -> pyodbc.Connection.cursor:
    """
    input: local server, database, driver to use.
    output: cursor made on pyodbc connection.
    """
    connection = pyodbc.connect(
        'DRIVER='+driver+';SERVER='+server+';DATABASE='+database+';Trusted_Connection=yes')
    cursor = connection.cursor()
    return cursor


def return_azure_connection(server, database, driver, username, password):
    connection = pyodbc.connect('DRIVER='+driver+';SERVER='+server +
                                ';DATABASE='+database+';UID='+username+';PWD=' + password)
    return connection


def return_sql_connection(server, database, driver) -> pyodbc.Connection:
    """
    input: local server, database, driver to use.
    output: cursor made on pyodbc connection.
    """
    connection = pyodbc.connect(
        'DRIVER='+driver+';SERVER='+server+';DATABASE='+database+';Trusted_Connection=yes')
    return connection


def set_page(data: tuple):
    st.set_option("deprecation.showfileUploaderEncoding", False)
    st.set_page_config(layout='wide')
    st.title("Customer Churn Prediction Web Application")
    (df_main, df_train, df_test, df_predictions) = data
    datasets = {
        "Main": df_main,
        "Train": df_train,
        "Test": df_test,
        "Predictions": df_predictions
    }
    selection = st.selectbox('Choose dataset', [i for i in datasets.keys()])
    loadbtn = st.button(label='Load data?', key='loadbtn')
    if loadbtn:
        st.dataframe(datasets[selection])


def generate_new_dataframe() -> pd.DataFrame:
    df = pd.DataFrame()
    return df


def main():

    server = 'localhost'
    database = 'customerdb'
    driver = '{ODBC Driver 17 for SQL Server}'

    azure_server = 'kheemsqlserver.database.windows.net'
    azure_database = 'customerdb'
    azure_username = 'sqlserveradmin'
    azure_password = ''
    azure_driver = '{ODBC Driver 17 for SQL Server}'

    rows: int = 10
    table_names: list() = ['dbo.data', 'dbo.training_data',
                           'dbo.test_data', 'dbo.predictions']
    query_main_data = query = f"SELECT  * FROM {table_names[0]}"
    query_training_data = query = f"SELECT  * FROM {table_names[1]}"
    query_test_data = query = f"SELECT  * FROM {table_names[2]}"
    query_predictions_data = query = f"SELECT  * FROM {table_names[3]}"

    df_main, df_train, df_test, df_predictions = (pd.DataFrame,)*4

    # with return_sql_connection(server, database, driver) as connection:
    #     df_main = pd.read_sql(query_main_data, connection)
    #     df_train = pd.read_sql(query_training_data, connection)
    #     df_test = pd.read_sql(query_test_data, connection)
    #     df_predictions = pd.read_sql(query_predictions_data, connection)

    with return_azure_connection(azure_server, azure_database, azure_driver, azure_username, azure_password) as connection:
        df_main = pd.read_sql(query_main_data, connection)
        df_train = pd.read_sql(query_training_data, connection)
        df_test = pd.read_sql(query_test_data, connection)
        df_predictions = pd.read_sql(query_predictions_data, connection)

    data = (df_main, df_train, df_test, df_predictions)
    set_page(data)


if __name__ == '__main__':
    main()
