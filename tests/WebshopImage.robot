*** Settings ***
Library           QWeb
Library           QImage
Suite Setup       OpenBrowser                 about:blank    chrome


*** Test Cases *** 
Test Sacha the Deer image
    GoTo          https://qentinelqi.github.io/shop/
    VerifyText    Find your spirit animal
    ${BASe_IMAGE_PATH}    Set Variable   ${CURDIR}/../images

    ${ActualImgPath}=    CaptureIcon    //*[@id\="products"]/section/div/ul/li[1]/div[1]/div[1]/a/img
    CompareImages        ${ActualImgPath}    SachaTheDeer.jpeg    tolerance=0.8