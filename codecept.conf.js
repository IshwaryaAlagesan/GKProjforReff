const selenium = require('selenium-standalone');
const { exec } = require('child_process');
  
exports.config = {
  output: './output',
  helpers: {
    WebDriver: {
      url: 'https://ent.dx-int.digital.vodafoneaws.co.uk',
      browser: 'firefox',
      fullPageScreenshots: true,
      restart: false,
      // keepCookies: true, // keep cookies for all tests
    }
  },
  include: {
    I: './steps_file.js'
  },
  mocha: {},
  bootstrap: null,
  teardown: null,
  
  bootstrapAll: function(done) {
  console.log('stopping zombie selenium processes before restarting selenium');    
  
      exec('pkill -f selenium-standalone', () => { 
  
        console.log('starting selenium');
        setTimeout(() => {
          console.log('Selenium Starting in progress........')
        }, 3);
        selenium.start( ()=> {
          console.log('selenium started.');
          done();
        });
      });
  },
  hooks: [],
  gherkin: {
    features: './features/specifications/*.feature',
    steps: ['./features/step_definitions/steps.js']
  },
  plugins: {
    screenshotOnFail: {
      enabled: true
    },
    wdio: {
      enabled: true,
      services: ['selenium-standalone']
    },
    stepByStepReport: {
      enabled: true,
      deleteSuccessful: true,
      ignoreSteps: ['wait*','fill*','grab*','set*','click*','select*','am*'],
      screenshotsForAllureReport: true
    },
    allure: {
      enabled: true,
      // enableScreenshotDiffPlugin: true,
    },
    autoDelay: {
      enabled: true
    },

  },
  tests: './*_test.js',
  name: 'codeceptJS-new'
}