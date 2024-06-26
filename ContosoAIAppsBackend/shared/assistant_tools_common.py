from shared.assistant_tools import serialize_assistant_response, \
    check_if_customer_account_exists, get_customer_account_details


def v_check_if_customer_account_exists(customer_email_address: str) -> str:
    """
    Check if customer accounts exists. It returns True on success and False otherwise
    """
    return serialize_assistant_response(check_if_customer_account_exists(customer_email_address))


def v_get_customer_account_details(customer_email_address: str) -> str:
    """
    Returns a JSON object representing the profile of the customer
    :param customer_email_address: the email address of the customer account used for the lookup
    :return:
    """
    return serialize_assistant_response(get_customer_account_details(customer_email_address))



