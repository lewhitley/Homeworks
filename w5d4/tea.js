const readline = require('readline');

function absurdTimes(numTimes, fn, completionFn) {
  let i = 0;
  function loopStep() {
    if (i === numTimes) {
      completionFn();
      return;
    }
    i += 1;
    fn(loopStep);
  }
  loopStep();
}

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

reader.question("What is your name?", function (answer) {
  console.log(`Hello ${answer}!`);
});

console.log("Last program line");

function teaAndBiscuits () {
  reader.question('Would you like some tea?', (res1) => {
    console.log(`You replied ${res1}.`);
    reader.question('Would you like some biscuits?', (res2) => {
      console.log(`You replied ${res2}.`);
      const first = (res1 === 'yes') ? 'do' : 'don\'t';
      const second = (res2 === 'yes') ? 'do' : 'don\'t';

      console.log(`So you ${first} want tea and you ${second} want biscuits.`);
      reader.close();
    });
  });
}
