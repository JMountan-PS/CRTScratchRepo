# Tip: Everything that starts with # is a guidance for you and will not get executed.

*** Settings ***

Documentation           Test suite for CRT starter.
Library                 QWeb
Library                 ExcelLibrary
Suite Setup             Open Browser    about:blank    chrome
Suite Teardown          Close All Browsers


*** Test Cases ***
Shop for products
    [Documentation]     Select a product, verify details on the page,
    ...                 add the product to the cart and continue shopping.
    GoTo                https://qentinelqi.github.io/shop/

    Open Excel Document    ../data/productsWebshop.xlsx    products
    ${product_name}=       Read Excel Cell                 3    1
    ${description}=        Read Excel Cell                 3    2
    ${price}=              Read Excel Cell                 3    3


    ClickText           ${product_name}
    VerifyText          Slim Fit, 5oz 100% Cotton T-Shirt.
    VerifyText          ${description}
    VerifyText          ${price}
    ClickText           Add to cart
    VerifyText          Cart summary
    VerifyText          ${product_name}
    ClickText           Continue shopping



*** Keywords ***

Home
    [Documentation]     Set the application state to the shop home page.
    GoTo                https://qentinelqi.github.io/shop/
