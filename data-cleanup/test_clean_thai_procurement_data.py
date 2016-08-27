from datetime import datetime
import clean_thai_procurement_data
import pytest

@pytest.mark.skip
def test_clean_col_0():
    """
    Test the cleaning for column: "project_number"
    """
    assert clean_thai_procurement_data.clean_col_0('NA') == 'NA'
    assert False


@pytest.mark.skip
def test_clean_col_1():
    """
    Test the cleaning for column: "project_name"
    """
    assert clean_thai_procurement_data.clean_col_1('NA') == 'NA'
    assert False


@pytest.mark.skip
def test_clean_col_2():
    """
    Test the cleaning for column: "procuring_department"
    """
    assert clean_thai_procurement_data.clean_col_2('NA') == 'NA'
    assert False


def test_clean_col_3():
    """
    Test the cleaning for column: "tender_posted_date"
    """
    assert clean_thai_procurement_data.clean_col_3('(null)') == ''
    assert clean_thai_procurement_data.clean_col_3('2015-01-01') == '2015-01-01'


@pytest.mark.skip
def test_clean_col_4():
    """
    Test the cleaning for column: "budget"
    """
    assert clean_thai_procurement_data.clean_col_4('NA') == 'NA'
    assert False


@pytest.mark.skip
def test_clean_col_5():
    """
    Test the cleaning for column: "reference_price"
    """
    assert clean_thai_procurement_data.clean_col_5('NA') == 'NA'
    assert False


@pytest.mark.skip
def test_clean_col_6():
    """
    Test the cleaning for column: "procurement_process"
    """
    assert clean_thai_procurement_data.clean_col_6('NA') == 'NA'
    assert False


@pytest.mark.skip
def test_clean_col_7():
    """
    Test the cleaning for column: "tax_id_number"
    """
    assert clean_thai_procurement_data.clean_col_7('NA') == 'NA'
    assert False


@pytest.mark.skip
def test_clean_col_8():
    """
    Test the cleaning for column: "bid_winner"
    """
    assert clean_thai_procurement_data.clean_col_8('NA') == 'NA'
    assert False


@pytest.mark.skip
def test_clean_col_9():
    """
    Test the cleaning for column: "agreed_price_or_wages"
    """
    assert clean_thai_procurement_data.clean_col_9('NA') == 'NA'
    assert False


@pytest.mark.skip
def test_clean_col_10():
    """
    Test the cleaning for column: "conditions_for_determination"
    """
    assert clean_thai_procurement_data.clean_col_10('NA') == 'NA'
    assert False


@pytest.mark.skip
def test_clean_col_11():
    """
    Test the cleaning for column: "contract_number"
    """
    assert clean_thai_procurement_data.clean_col_11('NA') == 'NA'
    assert False


@pytest.mark.skip
def test_clean_col_12():
    """
    Test the cleaning for column: "contract_sign_date"
    """
    assert clean_thai_procurement_data.clean_col_12('NA') == 'NA'
    assert False


@pytest.mark.skip
def test_clean_col_13():
    """
    Test the cleaning for column: "contract_status"
    """
    assert clean_thai_procurement_data.clean_col_13('NA') == 'NA'
    assert False