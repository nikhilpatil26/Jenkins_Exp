***Settings*** 
Library                                 SeleniumLibrary

Resource    ../../Common.robot

***Keywords***
Business Banner Validation
    # Scroll to Make your business grow faster than ever section
    
    Scroll To   //h3[@class="j-contentBlock__title j-heading j-text-heading-l"]   
    
    # Heading Content Verification
    
    Text Verification                            xpath=//h3[@class="j-contentBlock__title j-heading j-text-heading-l"]     Make your business grow faster than ever
    CSS Verification                             xpath=//h3[@class="j-contentBlock__title j-heading j-text-heading-l"]        font-weight    900

    # Sub-Heading Content Verification
    Text Verification                            xpath=//div[@class="j-color-primary-grey-80 j-contentBlock__description j-text-body-l"]    Transform your business operations with our customised digital solutions.
    
    # Background Image Verification
    Image Verification                           xpath=//div[@class='j-card j-fullwidth-banner p-0']//div[@class="l-breakpoint--desktop"]//img   
    
    # Button Verification
    Wait For And Verify Element                  xpath=//button[normalize-space()='Learn more about JioBusiness']
    Text Verification                            xpath=//button[normalize-space()='Learn more about JioBusiness']     Learn more about JioBusiness
                                
    Log To Console                               JioBusiness_Section Verified
         
    # Button Redirection
    Redirection On Clicking                      xpath=//button[normalize-space()='Learn more about JioBusiness']      https://www.jio.com/business/   JioBusiness_Page