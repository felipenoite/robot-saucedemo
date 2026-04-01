*** Variables ***
# Login Page
${INPUT_USERNAME}       id=user-name
${INPUT_PASSWORD}       id=password
${BTN_LOGIN}            id=login-button
${LBL_ERROR}            css=[data-test="error"]

# Inventory Page
${TITLE_PRODUCTS}       css=.title
${ITEM_CONTAINER}       css=.inventory_item
${BTN_ADD_BACKPACK}     id=add-to-cart-sauce-labs-backpack
${BTN_ADD_BIKE_LIGHT}   id=add-to-cart-sauce-labs-bike-light
${BTN_ADD_SHIRT}        id=add-to-cart-sauce-labs-bolt-t-shirt
${CART_BADGE}           css=.shopping_cart_badge
${CART_LINK}            css=.shopping_cart_link
${SORT_DROPDOWN}        css=[data-test="product-sort-container"]

# Cart Page
${CART_ITEMS}           css=.cart_item
${BTN_CHECKOUT}         id=checkout
${BTN_CONTINUE_SHOPPING}  id=continue-shopping

# Checkout Page - Step 1
${INPUT_FIRST_NAME}     id=first-name
${INPUT_LAST_NAME}      id=last-name
${INPUT_POSTAL_CODE}    id=postal-code
${BTN_CONTINUE}         id=continue
${LBL_CHECKOUT_ERROR}   css=[data-test="error"]

# Checkout Page - Step 2
${SUMMARY_SUBTOTAL}     css=.summary_subtotal_label
${SUMMARY_TAX}          css=.summary_tax_label
${SUMMARY_TOTAL}        css=.summary_total_label
${BTN_FINISH}           id=finish

# Confirmation Page
${TITLE_COMPLETE}       css=.complete-header
${ICON_COMPLETE}        css=.pony_express

# Menu
${BTN_MENU}             id=react-burger-menu-btn
${LINK_LOGOUT}          id=logout_sidebar_link
${LINK_RESET}           id=reset_sidebar_link
