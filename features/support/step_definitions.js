const assert = require('assert')
const pageLookups = require('./pageLookups')

const BASE_URL = require("codeceptjs").config.get().helpers.WebDriver.url;

const I = actor()
const currentbrowsername = require("codeceptjs").config.get().helpers.WebDriver.browser;
console.log(`Tests will be run against ${BASE_URL}...`);
console.log(`Browser: ${currentbrowsername} `);

const LOOK_IN_THE_DOM = 'LOOK_IN_DOM'
const LOOK_ON_THE_PAGE = 'LOOK_ON_PAGE'
const SPIN_WHILE_NOT_PRESENT = 'SPIN_WHILE_NOT_PRESENT'
const SPIN_WHILE_PRESENT = 'SPIN_WHILE_PRESENT'
const Login_Flag = 'no'

const camelCase = (id) => {
  let words = id.split(' ')

  words = words.map((word, index) => {
    return (
      index === 0
        ? word.toLowerCase()
        : word[0].toUpperCase() + word.slice(1).toLowerCase()
    )
  })

  return words.join('')
}

const generateReportFilesIndexHTML = (lighthouseReports, pa11yReports) => {
  let html = ''

  const listReportFile = file => {
    const title = file.split('-')[0]

    html += `
        <li>
            <a href="${file}" target="_blank">
                ${title}
            </a>
        </li>`
  }

  html = `
<!doctype html>
<html class="no-js" lang="">
  <head>
    <meta charset="utf-8">
    <title>Audit Reports</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <style>
      * {
        font-family: "Vodafone", "Open Sans", sans-serif;
      }

      body {
        display: flex;
        flex-direction: column;
        padding: 24px;
      }

      section {
        width: 100%;
      }

      ul {
        list-style: none;
        margin-bottom: 64px;
        padding: 0 16px;
      }

      a {
        color: #e60000;
        display: inline-block;
        padding: 8px;
        text-decoration: none;
        width: 100%;
      }

      a:hover {
        background-color: #e60000;
        color: white;
      }

      a:visited {
        background-color: #e6aaaa;
        color: darkred;
      }

      @media(min-width: 960px) {
        body {
          flex-direction: row;
        }

        section {
          width: 50%;
        }

        ul {
          padding: 0 40px;
        }
      }
    </style>
  </head>
`
  html += `
  <body>
    <section>
      <h1>
          The following Lighthouse reports were generated:
      </h1>
      <ul>`

  lighthouseReports.forEach(listReportFile)

  html += `
      </ul>
    </section>

    <section>
      <h1>
          The following Pa11y reports were generated:
      </h1>
      <ul>`

  pa11yReports.forEach(listReportFile)

  html += `
      </ul>
    </section>
  </body>
</html>
`

  return html
}

const getRecordedItem = function (recordedItem) {
  const recordedItemId = camelCase(recordedItem)

  if (scope.recordedItems[recordedItemId] === undefined) {
    throw new Error(`The is no recorded item named '${recordedItem}'!`)
  }

  return scope.recordedItems[recordedItemId]
}

const getSelector = function (id, elementType) {
  id = camelCase(id)
  switch (elementType) {
    case 'button':
      return `#${id} button, button[data-selector="${id}"]`
    case 'checkbox':
      return `#${id} input, [data-selector="${id}"] input`
    case 'radio button':
      return `#${id} input, input[data-selector="${id}"]`
    case 'dropdown list':
      return `#${id} select, select[data-selector="${id}"]`
    case 'table':
      return `#${id}`
    case 'autoComplete':
      return `#${id} input, [data-selector="${id}"] input`
    case 'span':
      return `#${id} span, [data-selector="${id}"] span`
    case 'xpath':
      return id
    case 'icon':
      
      if (id === 'vodafone'){
        return "/html//span[contains(@class,'SVGInline')]"
      }else {
        return id
      }
    default:
      return `#${id}, *[data-selector="${id}"]`
  }
}

const iClickTheElement = async function (id, elementType) {
  const selector = getSelector(id, elementType)
    try {
      if(elementType==='element'){
        await I.click(id);
        return;
      }
      if(id=== 'I only need Outbound calls'){
        I.click("//span[contains(text(),'No, I only need outbound calls')]")
      }else if (id.includes('html')){
            I.click({ xpath: id })
        }else {
            await I.click(selector)
            await iWaitForSeconds(0.5)
        }
  } catch (error) {
    await spin(id, LOOK_IN_THE_DOM, SPIN_WHILE_NOT_PRESENT, elementType)
    await iWaitForSeconds(0.5)
    await I.click(selector)
  }
}

const iClickTheElementWithSelector = async function (selector) {
  selector = JSON.parse(selector)

  try {
    await I.click(selector)
  } catch (error) {
    await spin(selector, LOOK_IN_THE_DOM, SPIN_WHILE_NOT_PRESENT, 'element')
    await iWaitForSeconds(0.5)
    await I.click(selector)
  }
}
/*
const escapeXpathString = (str) => {
  const splitQuotes = str.replace(/'/g, `', "'", '`)
  return `concat('${splitQuotes}', '')`
}
*/

const iClickTheLinkInTheSection = function (linkText, sectionId) {
  if (sectionId !== '') {
    // const selector = `#${camelCase(sectionId)}`
    // I.click(linkText, selector)
    // console.log('sectionId:' + sectionId)
    var res = sectionId.replace(" ", "-");
    I.click("//a[@href='/sipOrder/new/"+ res +"/edit']")
  } else {
    I.click(linkText)
  }
}
const iClickTheLink = function (linkText) {
    I.click(linkText)
}

const iClickTheLinkInSummaryPage = function (linkText, sectionId) {
    if (sectionId) {
        // console.log("a[href='/sipOrder/new/" + sectionId + "/" + linkText + "']")
        I.click("a[href='/sipOrder/new/" + sectionId + "/" + linkText + "']")
    } else {
        I.click(linkText)
    }
}
const iClickTheLinkInTheSegment = async function (sectionId) {
    I.click(sectionId)
}
const iClickTheTableColumnHeader = async function (id, column) {
//   const selector = getSelector(id, 'table')
//   // const headers = await scope.context.currentPage.$$(`${selector} th > span`)
//   const browser = await I.getCurrentPage
//   const headers = await browser.$$(`${selector} th > span`)

//   let headerFound = false
//   let headerCounter = 0

//   while (!headerFound && headerCounter < headers.length) {
//     const header = headers[headerCounter]
//     const headerText = await header.$eval('div', (el) => { return el.innerText })

//     if (headerText.includes(column)) {
//       headerFound = true
//       header.click()
//     }

//     headerCounter++
//   }

//   if (!headerFound) {
//     throw new Error(`Could not find the "${column}" column in the "${id}" table`)
//   }
}

const iCompleteTheNewOrderBusinessDetailsPage = async function () {
  await iShouldBeOnThePage('', '', 'new order business details')
  await iWaitForSeconds(0.5)
  await iFillInTheInputWithTheText('business name', 'Some Company Ltd')
  await iFillInTheInputWithTheText('postcode', 'RG14 2FN')
  await iClickTheElement('find', 'button')
  // await iSelectTheOptionInTheDropdownList('Vodafone Group Plc, Vodafone House, The Connection, NEWBURY', 'address')
  // await iClickTheLinkInTheSection('Can\'t find the address?', '')
  await I.waitForElement('select',10)
  // await iShouldSeeTheElement('','','select','dropdown list')
  await iSelectTheOptionInTheDropdownList('0','address')
  await iClickTheElement('yes', 'button')
  await iSelectTheOptionInTheDropdownList('Avaya', 'make')
  await iSelectTheOptionInTheDropdownList('Call Manager', 'model')
  await iSelectTheOptionInTheDropdownList('6.3', 'version')
  await iClickTheElement('save and continue', 'button')
  await iWaitForSeconds(1)
  await I.waitForText('Service details',5);
}

const iCompleteTheNewOrderServiceDetailsPage = async function (clickNewNumbersCheckbox) {
  await iShouldBeOnThePage('', '', 'new order service details')
  await iSelectTheOptionInTheDropdownList('12 months', 'commitment period')
  await iFillInTheInputWithTheText('number of channels', '60')
  if (clickNewNumbersCheckbox) {
    await iClickTheElement('new numbers', 'checkbox')
  }
  await iFillInTheInputWithTheText('amount of new numbers', '22')
  await iClickTheElement('reserve', 'button')
  await I.waitForText('We have successfully reserved 22 new numbers for you.',30)
  await iClickTheElement('save and continue', 'button')
  await iWaitForSeconds(0.5)
  await I.waitForText('Service features',5)
}

const iCompleteTheNewOrderServiceFeaturesPage = async function () {
  await iShouldBeOnThePage('', '', 'new order service features')
  await iClickTheElement('save and continue', 'button')
  await I.waitForText('Review your order',5)
}

const iCompleteTheNewOrderSummaryPage = async function () {
  await iShouldBeOnThePage('', '', 'new order summary')
  await iClickTheElement('confirm order', 'button')
  await I.waitForText('Thank You',30)
}

const iEnsureIAmLoggedOut = async function () {
  iGoToThePage('dashboard', '')

  const pageText = await I.grabTextFrom('main')

  if (pageText.includes('Dashboard')) {
    iClickTheElement('logout', 'button')
  }
}

const iCreateAnIndexFileForAnyAuditResults = function () {
  const currDate = new Date()
  const currYear = currDate.toLocaleDateString('en-GB', { year: 'numeric' })
  const currMonth = currDate.toLocaleDateString('en-GB', { month: 'short' })
  const currDay = currDate.toLocaleDateString('en-GB', { day: '2-digit' })

  const reportFolder = path.join(__dirname, '..', '..', 'firefly', 'output', currYear, currMonth, currDay)

  const reportFilesList = fs.readdirSync(reportFolder).filter(file => file.endsWith('.html'))
  const lighthouseReports = reportFilesList.filter(file => !file.includes('-accessibility.html'))
  const pa11yReports = reportFilesList.filter(file => file.includes('-accessibility.html'))

  const html = generateReportFilesIndexHTML(lighthouseReports, pa11yReports)

  fs.writeFileSync(path.join(reportFolder, 'index.html'), html)
}

const iFillInTheInputWithTheRecorded = async function (id, recordedItem) {
  const text = getRecordedItem(recordedItem)
  await iFillInTheInputWithTheText(id, text)
}

const iFillInTheElementWithTheSelectorWithTheText = function (selector, text) {
  selector = JSON.parse(selector)
  I.fillField(selector, text)
}

const iFillInTheInputWithTheText = function (id, text) {
  const selector = getSelector(id, 'input')
    if ((id == 'password') && (text=='******')){
        text ="Password123!"
    }
    if (id.includes('html')){
        I.fillField({ xpath: id }, text)
    }else {
        I.clearField(selector)
        I.fillField(selector, text)
    }
}

const iFillInTheAutoCompleteWithTheText = async function (id, text) {
  const selector = getSelector(id, 'autoComplete')
  I.fillField(selector, text)
  const spanSelector = getSelector(id, 'span')
  I.click(spanSelector)
}

const iGoToThePage = function (page) {
  const url = lookupPage(page)
  iGoToTheUrl(url)
}

const iGoToTheUrl = function (url, shouldMockTilCalls) {
//   if (shouldMockTilCalls === ' (mocking TIL calls)') {
//     url += '/mock_til=true'
//   }

  I.amOnPage(url)
}

const iLogInAsAPartner = async function () {
  // console.log('Login_Flag:::'+Login_Flag);
  // If already logged in then you won't see the login form
  try {
    await iGoToThePage('login');
    let mycurrentpage = await I.grabCurrentUrl()
    let dashboardurl = BASE_URL + '/'
    let recoveryurl = BASE_URL+'/cognito'
    // console.log("mycurrentpage::" + mycurrentpage)
    // console.log("Base URL     ::" + BASE_URL + '/')
    if(mycurrentpage === dashboardurl){
      I.setCookie({name: 'TilMock', value: 'true'});
      return;
    } else if(mycurrentpage === recoveryurl){
      I.click("//span[@class='vfuk-Button__content']")
      I.setCookie({name: 'TilMock', value: 'true'});
      return;
    }
    if (currentbrowsername ==='chrome'){
      // chrome browser seperate Xpath. Known Chrome bug in latest Version.
    }else{
    iWaitForSeconds(3)
    await I.fillField({ xpath: '/html/body/div[1]/div/div[2]/div[2]/div[2]/div[2]/div/div/form/div[1]/input' }, 'test@vodafone.com');
    await I.fillField({ xpath: '/html/body/div[1]/div/div[2]/div[2]/div[2]/div[2]/div/div/form/div[2]/input' }, 'Password123!');
    await I.click({ xpath: '/html/body/div[1]/div/div[2]/div[2]/div[2]/div[2]/div/div/form/input[3]' });
    I.waitForText('Welcome',10);
    I.setCookie({name: 'TilMock', value: 'true'});
  }
 } catch (error) {
    await iGoToThePage('dashboard')
  }
    // await iWaitForSeconds(4)
//   await iShouldSeeTheTextInTheSection('', 'Welcome', '')
}

const iNavigateFromTheDashboardToThePage = async function (page) {
  page = page.toLowerCase()
  let mycurrentpage = await I.grabCurrentUrl()
  let dashboardurl = BASE_URL + '/'
  // console.log("mycurrentpage::" + mycurrentpage)
  // console.log("Base URL     ::" + BASE_URL + '/')
  if(mycurrentpage !== dashboardurl){
    await iGoToThePage('dashboard')
    await I.waitForText('Welcome',5)
  }
  const clickNewNumbersCheckbox = true
  if (page === 'my orders') {
    // await iClickTheLinkInTheSection('See all orders', undefined, 'Orders')
    I.waitForElement('Orders',5);
    I.click('Orders');
    I.click('My orders');
    I.waitForText('Search Orders',30);
    await iShouldBeOnThePage('', '', 'my orders')
  } else if (page === 'my services') {
    // await iClickTheLinkInTheSection('See all services', undefined, 'services dashboard')
    I.click('Services');
    I.click('Manage SIP services');
    I.waitForText('Search services',30);

    await iShouldBeOnThePage('', '', 'my services')
    } else if (page === 'sip trunk page') {
        I.click('//a[contains(text(),"Product information")]')
        I.click('SIP')
    } else if (page === 'help page') {
        I.click('//span[contains(text(),"Help")]')
        // I.waitForText('Get Instant Answers:',10)
        I.waitForElement("//div[@id='nanoRepEmbedContainer']",10)
    } else if (page === 'privacy and cookie page'){
        I.click('//a[contains(text(),\'Privacy & Cookie Policy\')]')
    } else if (page === 'terms of service page'){
        I.click('//a[contains(text(),\'Terms of Service\')]')
  } else if (page.substr(0, 9) === 'new order') {
    // I.wait(1)
    I.click('Orders');
    I.click('Create new order');
    I.waitForText('Order SIP',10);
    I.waitForText('Business and PBX details',2);
    // I.wait(1)
    // await iClickTheLinkInTheSection('Orders', undefined, 'create new order')
    // await iClickTheLinkInTheSection('Create new order', undefined, 'create new order')

    if (page === 'new order business details') return
    await iCompleteTheNewOrderBusinessDetailsPage()

    if (page === 'new order service details') return
    await iCompleteTheNewOrderServiceDetailsPage(clickNewNumbersCheckbox)

    if (page === 'new order service features') return
    await iCompleteTheNewOrderServiceFeaturesPage()

    if (page === 'new order summary') return
    await iCompleteTheNewOrderSummaryPage()

    await iShouldBeOnThePage('', '', 'new order confirmation')
  } else {
    throw new Error(`Unrecognised page '${page}' given`)
  }
}

const iRecordTheAsThe = async function (id, recordedItem) {
//   const selector = getSelector(id, 'section')
//   // const text = await scope.context.currentPage.$eval(selector, el => el.textContent)
//   const browser = await I.getCurrentPage
//   const text = await browser.$eval(selector, (el) => { return el.textContent })
//   iRecordTheTextAsThe(text, recordedItem)
}

const iRecordTheInputAsThe = async function (id, recordedItem) {
  const selector = getSelector(id, 'input')
  const text = await I.grabTextFrom(selector)
  iRecordTheTextAsThe(text, recordedItem)
}

const iRecordTheTextAsThe = function (text, recordedItem) {
  const recordedItemId = camelCase(recordedItem)
  scope.recordedItems[recordedItemId] = text
}

const iSelectTheOptionInTheDropdownList = async function (option, id) {
  const selector = getSelector(id, 'dropdown list')
  I.selectOption(selector, option)

  /*

  const parentSelector = `*[@id='${camelCase(id)}']`
  // const matchingOptions = await scope.context.currentPage.$x(`//${parentSelector}//option[contains(text(), ${escapeXpathString(option)})]`)
  const browser = await I.getCurrentPage
  const matchingOptions = await browser.$x(`//${parentSelector}//option[contains(text(), ${escapeXpathString(option)})]`)

  if (matchingOptions.length === 0) {
    throw new Error(`Could not find a(n) "${option}" option in the "${camelCase(id)}" dropdown list`)
  }

  const optionValue = await (await matchingOptions[0].getProperty('value')).jsonValue()

  // await scope.context.currentPage.select(selector, optionValue)
  await browser.select(selector, optionValue)


   */
}

const iSelectTheRecordedOptionInTheDropdownList = async function (recordedItem, id) {
  const option = getRecordedItem(recordedItem)
  await iSelectTheOptionInTheDropdownList(option, id)
}

const iSetTheRangeTo = async function (id, targetValue) {
//   targetValue = parseFloat(targetValue)

//   const selector = getSelector(id, 'range')
//   const browser = await I.getCurrentPage
//   // const range = await scope.context.currentPage.$(selector)
//   const range = await browser.$(selector)

//   // const min = await scope.context.currentPage.$eval(selector, el => el.min)
//   const min = await browser.$eval(selector, (el) => { return el.min })
//   // const max = await scope.context.currentPage.$eval(selector, el => el.max)
//   const max = await browser.$eval(selector, (el) => { return el.max })

//   if (targetValue < parseFloat(min) || targetValue > parseFloat(max)) {
//     throw new Error(`The targetValue ${targetValue} is outside of the available range (${min} to ${max} inclusive)`)
//   }

//   // let currentValue = await scope.context.currentPage.$eval(selector, el => el.value)
//   let currentValue = await browser.$eval(selector, (el) => { return el.value })

//   if (parseFloat(currentValue) < targetValue) {
//     while (parseFloat(currentValue) < targetValue) {
//       await range.press('ArrowRight')
//       // currentValue = await scope.context.currentPage.$eval(selector, el => el.value)
//       currentValue = await browser.$eval(selector, (el) => { return el.value })
//     }
//   } else {
//     while (parseFloat(currentValue) > targetValue) {
//       await range.press('ArrowLeft')
//       // currentValue = await scope.context.currentPage.$eval(selector, el => el.value)
//       currentValue = await browser.$eval(selector, (el) => { return el.value })
//     }
//   }
}

const iShouldBeOnThePage = async function (stillOrNot, beOrNot, page) {
  const url = lookupPage(page)
  await iShouldBeOnTheUrl(stillOrNot, beOrNot, url)
// await iSaveTheLocalStorageVariables()
}

const iShouldBeOnTheUrl = async function (stillOrNot, beOrNot, url) {
  // const actualUrl = await scope.context.currentPage.evaluate('location.href')
  const actualUrl = await I.grabCurrentUrl()

  if (beOrNot === '') {
    assert.strictEqual(actualUrl, `${BASE_URL}${url}`)
  } else {
    assert.notStrictEqual(actualUrl, `${BASE_URL}${url}`)
  }
}

const iShouldSeeTheElement = async function (stillOrNot, seeOrNot, id, elementType) {
  const selector = getSelector(id, elementType)
  let element

  try {
    // element = await scope.context.currentPage.$(selector)
    // const browser = await I.getCurrentPage
    // element = await browser.$(selector);
    if (seeOrNot === '' ){
      element = await I.seeElement(selector)
    } else {
      element = await I.dontseeElement(selector)
    }
    // ******* ------- need to add code here -----  ******
  } catch (error) {
    if (seeOrNot === '' && element === null) {
      throw new Error(`Could not find the ${elementType} with identifier "${camelCase(id)}"`)
    }
  }
  // if (seeOrNot !== '' && element !== null) {
  //   console.log('place2')
  //   throw new Error(`Found the ${elementType} with identifier "${camelCase(id)}"`)
  // }
}

const iShouldSeeTheRecordedInTheSection = async function (seeOrNot, recordedItem, optionalText, sectionId) {
  const text = getRecordedItem(recordedItem)
  await iShouldSeeTheTextInTheSection(seeOrNot, text, optionalText, sectionId)
}

const iShouldSeeTheTextInTheSection = async function (seeOrNot, text, optionalText, sectionId) {
//   const selector = !sectionId ? 'body' : `#${camelCase(sectionId)}`
// //   // const visibleText = await scope.context.currentPage.$eval(selector, el => el.textContent)
//   const browser = await I.getCurrentPage
//   const visibleText = await browser.$eval(selector, (el) => { return el.textContent })

  if (seeOrNot === '') {
    // assert(visibleText.includes(text), visibleText)
    I.see(text)
  } else {
    I.dontSee(text)
    // assert(!visibleText.includes(text), visibleText)
  }
}

const iShouldSeeTheTextInTheField = async function (seeOrNot, text, optionalText, sectionId) {

    if (seeOrNot === '') {
        I.see(text,"//div[contains(text(),'" + sectionId + "')]/following-sibling::div[1]")
    } else {
        I.dontSee(text,"//div[contains(text(),'" + sectionId + "')]/following-sibling::div[1]")
    }
}
const iShouldSeeTheTextInTheSegment = async function (text, sectionId) {
    I.see(text,sectionId)
}
const iTakeAScreenshot = function (filename) {
  I.saveScreenshot(filename)
}

const iTakeScreenshotAs = function (filepath,filename) {
    const mkdirp = require('mkdirp')
    //const pathScreenshot = '/XXX'
    mkdirp(`./firefly/output${filepath}`, (err) => {
        if (err) console.error(err)
    })
    var filenamewithfullpath = filepath.concat("/",filename)
    I.saveScreenshot(filenamewithfullpath,true)
}
const iWaitForMinutes = async function (minutes) {
  await iWaitForSeconds(minutes * 60)
}

const iWaitForSeconds = /* async */ function (seconds) {
  // await scope.context.currentPage.waitFor(seconds * 1000)
  I.wait(seconds)
}
const iWaitForPagetoNavigation=async function(){
    I.waitForNavigation()
}
const iWaitForElement=async function(id){
    I.waitForElement(id,30)
}
const iWaitForText= async function(text){
  I.waitForText(text,30);
}
const iWaitForPagetoLoad = async function(){
  I.waitForNavigation()
}

const lookupPage = function (page) {
  page = camelCase(page)

  if (!pageLookups[page]) {
    throw new Error(`The page '${page}' is not in the lookups!`)
  }

  return pageLookups[page]
}

const spin = async function (whatToSpinFor, whereToLook, spinWhile, elementType = '', sectionId = '') {
  if (whereToLook !== LOOK_IN_THE_DOM && whereToLook !== LOOK_ON_THE_PAGE) {
    throw new Error('whereToLook MUST be either LOOK_IN_THE_DOM or LOOK_ON_THE_PAGE')
  }
  const locationForError = whereToLook === LOOK_IN_THE_DOM ? 'in the DOM' : 'on the page'

  if (spinWhile !== SPIN_WHILE_NOT_PRESENT && spinWhile !== SPIN_WHILE_PRESENT) {
    throw new Error('spinWhile MUST be either SPIN_WHILE_NOT_PRESENT or SPIN_WHILE_PRESENT')
  }
  const seeOrNot = spinWhile === SPIN_WHILE_NOT_PRESENT ? '' : ' not'

  const timeoutInSeconds = 10
  const timeoutTimestamp = Date.now() + (timeoutInSeconds * 1000)
  let needToSpin = true

  while (needToSpin && Date.now() < timeoutTimestamp) {
    try {
      if (whereToLook === LOOK_IN_THE_DOM) {
        await iShouldSeeTheElement(seeOrNot, whatToSpinFor, elementType)
      } else {
        await iShouldSeeTheTextInTheSection(seeOrNot, whatToSpinFor, sectionId)
      }

      needToSpin = false
    } catch (error) {
      // await iWaitForSeconds(0.5)
    }
  }

  await iWaitForSeconds(0.5)

  if (needToSpin) {
    // const foundOrNot = spinWhile === SPIN_WHILE_PRESENT ? '' : ' not'
    throw new Error(`"${whatToSpinFor}" was${seeOrNot} found ${locationForError} after ${timeoutInSeconds} seconds`)
  }
}

// const theCheckboxOrRadioButtonShouldBeChecked = async function (id, elementType, checkedOrNot) {
//   const selector = getSelector(id, elementType)
//   if (id === 'request new numbers'){
//     if (checkedOrNot === ''){
//       I.seeCheckboxIsChecked("//div[contains(@class,'')]//input[contains(@name,'requestNewNumbers') and @xpath='1']")
//     } else if (checkedOrNot !== '') {
//       I.dontSeeCheckboxIsChecked("//div[contains(@class,'')]//input[contains(@name,'requestNewNumbers') and @xpath='1']")
//     }
//   } else if(id === 'I only need outbound calls'){
//     if (checkedOrNot === ''){
//       I.seeCheckboxIsChecked("//div[contains(@class,'')]//input[contains(@name,'requestNewNumbers') and @xpath='2']")
//     } else if (checkedOrNot !== '') {
//       I.dontSeeCheckboxIsChecked("//div[contains(@class,'')]//input[contains(@name,'requestNewNumbers') and @xpath='2']")
//       ******* update here for next action ******
//       //span[contains(text(),'Yes, I would like to request:')]//preceding-sibling::*
//     }
//   }else {
//     if (checkedOrNot === '') {
//       I.seeCheckboxIsChecked(selector)
//     } else {
//       I.dontSeeCheckboxIsChecked(selector)
//    }
//   }
// }

const theCheckboxOrRadioButtonShouldBeChecked = async function (id, elementType, checkedOrNot) {
  // pause();
  if (checkedOrNot === '') {
    I.seeCheckboxIsChecked("//span[contains(text(),'" + id + "')]//preceding-sibling::*")
  } else {
    I.dontSeeCheckboxIsChecked("//span[contains(text(),'" + id + "')]//preceding-sibling::*")
  }
  //span[contains(text(),'Yes, I would like to request:')]//preceding-sibling::*
}


const theDropdownListShouldHaveTheRecordedValue = async function (id, haveOrNot, recordedItem) {
  const text = getRecordedItem(recordedItem)
  await theDropdownListShouldHaveTheValue(id, haveOrNot, text)
}

const theDropdownListShouldHaveTheValue = async function (id, haveOrNot, text) {
  const selector = getSelector(id, 'dropdown list')
  // const actual = await scope.context.currentPage.$eval(selector, el => el.value)
  const browser = await I.getCurrentPage
  const actual = await browser.$eval(selector, (el) => { return el.value })

  if (haveOrNot === '') {
    assert.strictEqual(actual, text)
  } else {
    assert.notStrictEqual(actual, text)
  }
}

const theFileShouldExist = function (filename, existOrNot) {
  const expected = existOrNot === ''

  const fileWithPath = path.join(__dirname, 'temp', filename)
  const actual = fs.existsSync(fileWithPath)
  assert.strictEqual(actual, expected)
}

const theInputShouldContainTheRecorded = async function (id, containOrNot, recordedItem) {
  const text = getRecordedItem(recordedItem)
  await theInputShouldContainTheText(id, containOrNot, text)
}

const theInputShouldContainTheText = async function (id, containOrNot, text) {
  const selector = getSelector(id, 'input')
  // const actual = await scope.context.currentPage.$eval(selector, el => el.value)
  const browser = await I.getCurrentPage
  const actual = await browser.$eval(selector, (el) => { return el.value })

  if (containOrNot === '') {
    assert.strictEqual(actual, text)
  } else {
    assert.notStrictEqual(actual, text)
  }
}

const theTableShouldBeOrderedByTheColumn = async function (id, orderedOrNot, column, direction) {
  const selector = getSelector(id, 'table')
  // const headers = await scope.context.currentPage.$$(`${selector} th`)
  const browser = await I.getCurrentPage
  const headers = await browser.$$(`${selector} th`)

  let headerFound = false
  let headerCounter = 0

  while (!headerFound && headerCounter < headers.length) {
    const header = headers[headerCounter]
    const headerText = await header.$eval('span', (el) => { return el.innerText })
    if (headerText.includes(column)) {
      headerFound = true

      // const sortDirection = await scope.context.currentPage.evaluate(
      const sortDirection = await browser.evaluate(
        (el) => { return el.getAttribute('aria-sort') },
        header,
      )

      if (sortDirection !== direction) {
        throw new Error(`The "${id}" table is not sorted by the "${column}" column ${direction}`)
      }
    }

    headerCounter++
  }

  if (!headerFound) {
    throw new Error(`Could not find the "${column}" column in the "${id}" table`)
  }
}

const theTableShouldContainTheRecorded = async function (id, containOrNot, recordedItem) {
  await iShouldSeeTheRecordedInTheSection(containOrNot, recordedItem, id)
}

const theTableShouldContainTheText = async function (id, containOrNot, text) {
  await iShouldSeeTheTextInTheSection(containOrNot, text, id)
}

const theTableShouldHaveATotalOfRows = async function (id, shouldOrNot, noOfRows) {
  noOfRows = parseInt(noOfRows.toString(), 10)

  const selector = getSelector(id, 'table')
  // const rowsInfoText = await scope.context.currentPage.$eval(`${selector} tfoot span:nth-of-type(2)`, el => el.textContent)
  const browser = await I.getCurrentPage
  const rowsInfoText = await browser.$eval(`${selector} tfoot span:nth-of-type(2)`, (el) => { return el.textContent })

  const rowsInfo = rowsInfoText.split(' of ')
  const actualTotalRows = parseInt(rowsInfo[1], 10)

  if (shouldOrNot === '') {
    assert.strictEqual(actualTotalRows, noOfRows)
  } else {
    assert.notStrictEqual(actualTotalRows, noOfRows)
  }
}

const theTableShouldHaveRows = async function (id, shouldOrNot, noOfRows) {
  noOfRows = parseInt(noOfRows.toString(), 10)

  const selector = getSelector(id, 'table')
  // const actualRows = await scope.context.currentPage.$$(`${selector} tbody tr`)
  const browser = await I.getCurrentPage
  const actualRows = await browser.$$(`${selector} tbody tr`)

  if (shouldOrNot === '') {
    assert.strictEqual(actualRows.length, noOfRows)
  } else {
    assert.notStrictEqual(actualRows.length, noOfRows)
  }
}

const ivalidateiframecontent= async function (text,id) {
    if (id == 'faq') {
        within({frame: "[id^=nanoRep_frame_embed]"}, () => {
                I.see(text);
        });
    }
}

const iFillFrameInTheInputWithTheText= async function (id,text,frameid) {
    if (frameid == 'faq') {

        within({frame: "[id^=nanoRep_frame_embed]"}, () => {
            if (id=='Get instant answers') {
                I.fillField('.nr-autocomplete-input', text);
            }
        });
    }
}

const iClickFrameInTheInputWithTheText= async function (id,frameid) {
    if (frameid == 'faq') {

        within({frame: "[id^=nanoRep_frame_embed]"}, () => {
            // if (id=='can i change the date i pay my bill') {
                I.click('.nr-autocomplete-drop > ul:nth-child(1) > li:nth-child(1)');
            // }
        });
    }
}

const ie2etrunkonlyorder = async function(table) {
    console.log("E2E Test Case for Submit Order started")

    var today = new Date();
    var csvfilename = today.getFullYear()+'-'+(today.getMonth()+1)+'-'+today.getDate() + '-' + today.getHours() + ':' + today.getMinutes()
    console.log(csvfilename)

    // Open a csv file
    var fs = require('fs')
    var writeStream = fs.createWriteStream("Digital-"+csvfilename+".xls")


    console.log("order placing starts : ")
    for (const id in table.rows) {
        console.log("forloop: " + id)
        if (id < 1) {
            var header = "S_no"
            console.log("table.rows[id].length: " + table.rows[id].cells.length)
            for (const cid in table.rows[id].cells){
                header = header + "\t" + table.rows[id].cells[cid].value
            }

            header = header + "\t" + "Order-ID" + "\n"
            writeStream.write(header)
            continue; // skip a header of a table
        }
        const cells = table.rows[id].cells

        // Set Start Time

        var startTime = igetTime()
        console.log(startTime)

        // await iClickTheLinkInTheSection('Create new order', undefined, 'orders dashboard')
        await iWaitForSeconds(1)
        await I.click('Orders')
        await iWaitForSeconds(0.5)
        await I.click('Create new order')
        I.wait(1)
        await iShouldBeOnThePage('', '', 'new order business details')
        await iWaitForSeconds(0.5)

        // Enter Business details page details

        await iFillInTheInputWithTheText('business name', cells[0].value)
        await iFillInTheInputWithTheText('postcode', cells[1].value)
        await iClickTheElement('find', 'button')
        iWaitForSeconds(5)
        await iShouldSeeTheElement('', '', 'address', 'dropdown list')
        await iSelectTheOptionInTheDropdownList('0', 'address')
        await iClickTheElement('yes', 'button')
        await iSelectTheOptionInTheDropdownList('Avaya', 'make')
        await iSelectTheOptionInTheDropdownList('Call Manager', 'model')
        await iSelectTheOptionInTheDropdownList('6.2', 'version')
        await iClickTheElement('save and continue', 'button')
        iWaitForSeconds(1)

        // Enter Service Details page details
        await iShouldBeOnThePage('', '', 'new order service details')
        await iSelectTheOptionInTheDropdownList('12 months', 'commitment period')
        await iFillInTheInputWithTheText('number of channels', '60')
        await iClickTheElement('i only need outbound calls', 'radio')
        /*if (){
            await iClickTheElement('new numbers', 'checkbox')
            await iFillInTheInputWithTheText('amount of new numbers', '22')
        }*/

        await iClickTheElement('save and continue', 'button')

        // Enter Service Features page details
        I.waitForElement("#clir button, button[data-selector='clir']",5)
        await iClickTheElement('CLIR', 'button')
        await iClickTheElement('no barring', 'checkbox')
        await iClickTheElement('international calls', 'checkbox')
        await iClickTheElement('premium rate services', 'checkbox')
        await iClickTheElement('directory enquiries', 'checkbox')
        await iClickTheElement('all calls except emergency numbers', 'checkbox')
        await iClickTheElement('save and continue', 'button')
        iWaitForSeconds(2)
        // iWaitForSeconds(2)
        var filenamescreenshot = ""
        filenamescreenshot = cells[0].value + '_Summary.jpg'
        iTakeAScreenshot(filenamescreenshot)
        await iClickTheElement('confirm order', 'button')
        // I.click('#confirmOrder button, button[data-selector="confirmOrder"]')
        iWaitForSeconds(1)
        I.waitForNavigation(30)
        await iShouldBeOnThePage('','','new order confirmation')
        I.see("Your order number is")
        iTakeAScreenshot(cells[0].value+'_orderID.jpg')
        var pin = await I.grabTextFrom("//section[contains(@class,'vfuk-index__page-container')]//p[1]")

        var ettime = igetTime()

        var scenedata = id
        console.log("table.rows[id].length: " + table.rows[id].cells.length)
        for (const cid in table.rows[id].cells){
            scenedata = scenedata + "\t" + table.rows[id].cells[cid].value
        }
        scenedata = scenedata + "\t" + startTime + "\t" + ettime+ "\t" + pin + "\n"
        writeStream.write(scenedata)
        await I.click("//span[@class='vfuk-Button__content']")
        await iWaitForSeconds(1)
    }
    // End of the loop Close the csv file as all the records completed.
    writeStream.close()
}
const igetTime = function(){
    return  Date.now()
}


const iLogInAsADummy  = async function () {
    console.log("Login Function completed by Dummy")
}

const iShouldSeeTheTextInTheCreateOrderSummaryPage = async function (seeornot, seetext, checkfield){
  let assertext = await I.grabTextFrom("//div[contains(text(),'" + checkfield + "')]//following-sibling::*[1]")
  // console.log("see::" + seetext);
  // console.log("check::" + checkfield);
  // console.log("assert::" + assertext);
  if (seeornot === ''){
    if (seetext !== assertext){
      throw new Error(`The Text should be present, But it is NOT present. '${seetext}' vs '${assertext}'!`)
    }
  } else {
    if (seetext === assertext){
      throw new Error(`The Text should not present, But it is present. '${seetext}' vs '${assertext}'!`)
    }
  } 
}
module.exports = {
  iClickTheElement,
  iClickTheElementWithSelector,
  iClickTheLinkInTheSection,
  iClickTheTableColumnHeader,
  iCompleteTheNewOrderBusinessDetailsPage,
  iCompleteTheNewOrderServiceDetailsPage,
  iCompleteTheNewOrderServiceFeaturesPage,
  iCompleteTheNewOrderSummaryPage,
  iCreateAnIndexFileForAnyAuditResults,
  iEnsureIAmLoggedOut,
  iFillInTheElementWithTheSelectorWithTheText,
  iFillInTheInputWithTheRecorded,
  iFillInTheInputWithTheText,
    iFillInTheAutoCompleteWithTheText,
  iGoToTheUrl,
  iGoToThePage,
  iLogInAsAPartner,
  iNavigateFromTheDashboardToThePage,
  iRecordTheAsThe,
  iRecordTheInputAsThe,
  iRecordTheTextAsThe,
  iSelectTheOptionInTheDropdownList,
  iSelectTheRecordedOptionInTheDropdownList,
  iSetTheRangeTo,
  iShouldBeOnThePage,
  iShouldBeOnTheUrl,
  iShouldSeeTheElement,
  iShouldSeeTheRecordedInTheSection,
  iShouldSeeTheTextInTheSection,
    iShouldSeeTheTextInTheSegment,
    iTakeAScreenshot,
    iTakeScreenshotAs,
  iWaitForMinutes,
  iWaitForSeconds,
  theCheckboxOrRadioButtonShouldBeChecked,
  theDropdownListShouldHaveTheRecordedValue,
  theDropdownListShouldHaveTheValue,
  theFileShouldExist,
  theInputShouldContainTheRecorded,
  theInputShouldContainTheText,
  theTableShouldBeOrderedByTheColumn,
  theTableShouldContainTheRecorded,
  theTableShouldContainTheText,
  theTableShouldHaveATotalOfRows,
  theTableShouldHaveRows,
    iClickTheLinkInTheSegment,
    ivalidateiframecontent,
    iFillFrameInTheInputWithTheText,
    iClickFrameInTheInputWithTheText,
    ie2etrunkonlyorder,
    iLogInAsADummy,
    iWaitForPagetoNavigation,
    iWaitForElement,
    iWaitForText,
    iShouldSeeTheTextInTheField,
    iClickTheLinkInSummaryPage,
    iClickTheLink,
    iShouldSeeTheTextInTheCreateOrderSummaryPage,
    iWaitForPagetoLoad
}
  