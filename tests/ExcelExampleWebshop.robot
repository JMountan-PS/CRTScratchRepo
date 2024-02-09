# Tip: Everything that starts with # is a guidance for you and will not get executed.

*** Settings ***

Documentation           Test suite for CRT starter.
Library                 QWeb
Library                 ExcelLibrary
Suite Setup             Setup Browser and data
Suite Teardown          Close All Browsers
Test Template           Shop for products

*** Variables ***
@{product_list}
@{description_list}
@{price_list}

*** Test Cases ***
Verify product SachaTheDeer    ${product_list}[1]    ${description_list}[1]   ${price_list}[1]
Verify product BumbleTheElphant   ${product_list}[2]    ${description_list}[2]   ${price_list}[2]

*** Keywords ***

Home
    [Documentation]     Set the application state to the shop home page.
    GoTo                https://qentinelqi.github.io/shop/

Shop for products
    [Documentation]     Select a product, verify details on the page,
    ...                 add the product to the cart and continue shopping.
    [Arguments]         ${product_name}    ${description}    ${price}
    GoTo                https://qentinelqi.github.io/shop/
    ClickText           ${product_name}
    VerifyText          Slim Fit, 5oz 100% Cotton T-Shirt.
    VerifyText          ${description}
    VerifyText          ${price}
    ClickText           Add to cart
    VerifyText          Cart summary
    VerifyText          ${product_name}
    ClickText           Continue shopping

Setup Browser and data
    Open Browser    about:blank    chrome
    Open Excel Document            ../data/productsWebshop.xlsx    product
    ${product_list}=               Read Excel Column    1
    ${product_list}=               Read Excel Column    2
    ${product_list}=               Read Excel Column    3
