# Tip: Everything that starts with # is a guidance for you and will not get executed.

*** Settings ***

Documentation           Test suite for CRT starter.
Library                 QWeb
Suite Setup             Open Browser    about:blank    chrome
Suite Teardown          Close All Browsers


*** Test Cases ***
Shop for products
    [Documentation]     Select a product, verify details on the page,
    ...                 add the product to the cart and continue shopping.
    GoTo                https://qentinelqi.github.io/shop/
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
