import csv
import pandas as pd
import requests
from bs4 import BeautifulSoup
import time
from translate import Translator

def clean_columns(input_file, output_file):
    with open(input_file) as csvfile, open(output_file, 'wt') as writer:
        reader = csv.DictReader(csvfile)
        column_names = reader.fieldnames
        writer.write(','.join(column_names) + '\n')

        n_cols = len(column_names)
        column_methods = [globals()['clean_col_' + str(i)] for i in range(n_cols)]

        for row in reader:
            cleaned_row = list()
            for i in range(n_cols):
                cleaned_row.append(column_methods[i](row[column_names[i]]))
            writer.write(','.join(cleaned_row) + '\n')

def thai_english(sentence):
    """
    Translate a sentece to English.
    """
    translator= Translator(from_lang="th", to_lang="en")
    translation = translator.translate(sentence)
    print(translation)
    return translation

def create_dictionary(input_file, output_file, column_name):
    """
    Create dictionary of unique values in a column.
    """
    acd = pd.read_csv(input_file)
    procurement_process_unique_values = acd[column_name].unique()
    procurement_process_unique_dictionary={}
    for i in procurement_process_unique_values:
        procurement_process_unique_dictionary[i]=thai_english(i)
    with open(output_file, 'wt') as writer:
        w = csv.DictWriter(writer, procurement_process_unique_dictionary.keys())
        w.writeheader()
        w.writerow(procurement_process_unique_dictionary)

def clean_col_0(input_data):
    """
    Clean values in column: "project_number"
    Trello card: https://trello.com/c/1LEUytyV/1-column-project-number
    """
    return input_data


def clean_col_1(input_data):
    """
    Clean values in column: "project_name"
    Trello card: https://trello.com/c/Cfq1kCk9/2-column-project-name
    """
    return input_data


def clean_col_2(input_data):
    """
    Clean values in column: "procuring_department"
    Trello card: https://trello.com/c/zRtV7SU9/3-column-procuring-department
    """
    return input_data


def clean_col_3(input_data):
    """
    Clean values in column: "tender_posted_date"
    Trello card: https://trello.com/c/C6b2Lw8i/4-column-tender-posted-date
    """
    return input_data


def clean_col_4(input_data):
    """
    Clean values in column: "budget"
    Trello card: https://trello.com/c/mKBCmVAg/5-column-budget
    """
    return input_data


def clean_col_5(input_data):
    """
    Clean values in column: "reference_price"
    Trello card: https://trello.com/c/nkY3YByn/6-column-reference-price
    """
    return input_data


def clean_col_6(input_data):
    """
    Clean values in column: "procurement_process"
    Trello card: https://trello.com/c/eD7tBBsE/7-column-procurement-process
    """

    return input_data


def clean_col_7(input_data):
    """
    Clean values in column: "tax_id_number"
    Trello card: https://trello.com/c/DR6jS6vf/8-column-tax-id-number
    """
    return input_data


def clean_col_8(input_data):
    """
    Clean values in column: "bid_winner"
    Trello card: https://trello.com/c/16OwIPWJ/9-column-bid-winner
    """
    return input_data


def clean_col_9(input_data):
    """
    Clean values in column: "agreed_price_or_wages"
    Trello card: https://trello.com/c/WzTsgmB6/10-column-agreed-price-or-wages
    """
    return input_data


def clean_col_10(input_data):
    """
    Clean values in column: "conditions_for_determination"
    Trello card: https://trello.com/c/ftDsG0ji/11-column-conditions-for-determination
    """
    return input_data


def clean_col_11(input_data):
    """
    Clean values in column: "contract_number"
    Trello card: https://trello.com/c/UBhEQZrQ/12-column-contract-number
    """
    return input_data


def clean_col_12(input_data):
    """
    Clean values in column: "contract_sign_date"
    Trello card: https://trello.com/c/UBxrfzr8/13-column-contract-sign-date
    """
    return input_data


def clean_col_13(input_data):
    """
    Clean values in column: "contract_status"
    Trello card: https://trello.com/c/jbpH6aup/14-column-contract-status
    """
    return input_data


if __name__ == '__main__':
    #clean_columns('thai_procurement_data.csv', 'cleaned_thai_procurement_data.csv')
    create_dictionary('thai_procurement_data.csv', 'dictionary_data.csv', 'procurement_process')
