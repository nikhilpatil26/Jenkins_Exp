*** Settings ***
Library                              SeleniumLibrary
Resource                            ../../../../Resources/Local_Keywords.robot

*** Keywords ***
    
Redirection to No Daily Limit Plan Page
    # Clicking on No Daily Limit Button
    Wait For And Click Element                  xpath=//button[@aria-label="button No Daily Limit"]
    #Sleep  500ms
    URL Validation                              https://www.jio.com/selfcare/plans/mobility/prepaid-plans-list/?category=No%20Daily%20Limit&categoryId=Tm8gRGFpbHkgTGltaXQ=
    Set Screenshot Directory                    /Results/Mobile/Prepaid_Screenshots/NoDailyLimit-Plans/
    # Taking Screenshot of No Daily Limit Plans Page Load
    Take Page Screenshot                        NoDailyLimit-PageLoaded


Validate UI and Content of No Daily Limit Plans Page
    # Verifing No Daily Limit  UI
    Plan Page UI Verification                   No Daily Limit


Verify and Validate Plan Cards and Recharge Redirection of All No Daily Limit Plans
   Reloading Page
    # Verifying All Plan card on No Daily Limit Plan Page
    ${elements}=    Get WebElements             xpath=//section[contains(@class,'desktop')]//div[contains(@class,"PlanName_planText")]
    ${length}=      Get Length                  ${elements}
    ${RURL}=        Get Location
    # Loop to verify and validate Plan cards of Data Add-on page
    FOR     ${j}    IN RANGE   1  ${length}+1

        #  Verifying Plan Card
        Plan Card Verification                  Mobile_Prepaid     xpath=(//section[contains(@class,'desktop')]//div[contains(@class,"PlanName_planText")])[${j}]       xpath=(//section[contains(@class,'desktop')]//div[@class="Details_planCont__1xVvf"]//div[@class="j-grid"])[${j}]        xpath=(//button//div[contains(text(),'Recharge')])[${j}]        xpath=(//button//div[contains(text(),'View details')])[${j}]        No Daily Limit
        
        #  Verifying Recharge Pop-up
        common.Recharge Popup Verification      xpath=(//button//div[contains(text(),'Recharge')])[${j}]     xpath=(//section[contains(@class,'desktop')]//div[contains(@class,"PlanName_planText")])[${j}]      xpath=(//button//div[contains(text(),'View details')])[${j}]        ${RURL}    ${Mobile_No2}
        
        #  Verifying View Details Pop-up
        View Details Popup Verification         Mobile_Prepaid      xpath=(//button//div[contains(text(),'View details')])[${j}]    xpath=(//div[contains(@class,' j-modal-visible')]//div[contains(@class,'PlanName_planText')])    xpath=//div[contains(@class,'j-modal-visible j-modal-closable')]//div[@class="customScroll_scroll__1lZUu"]      xpath=//div[contains(@class, 'visible')]//div[@class="Subscriptions_subscription__2l1MD"]     xpath=//div[contains(@class,'j-modal j-modal-visible j-modal-closable')]//i         No Daily Limit
        
        #  Open Pop-up
        Open Popup                              xpath=(//button//div[contains(text(),'View details')])[${j}]
        
        #  Verifying Recharge Pop-up
        common.Recharge Popup Verification      xpath=//div[contains(@class,'j-modal-visible')]//button[normalize-space()='Recharge']  xpath=//div[contains(@class,'j-modal-visible')]//div[contains(@class,'PlanName')]   xpath=(//section[contains(@class,'desktop')]//button[normalize-space()='View details'])[${j}]  ${RURL}    ${Mobile_No2}
    END

Verify Redirection of More Information section No Daily Limit Plans Page
    More Information Section Redirection        xpath=//section[contains(@class,'desktop')]//div[contains(@class,'MoreInformation')]//button[contains(@class,'j-button-size__medium secondary')]   https://jep-asset.akamaized.net/jio/plan/Mobility-Prepaid-Plan-Vouchers.pdf     NoDailyLimitPlans      