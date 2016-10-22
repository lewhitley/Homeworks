import React from 'react';

class Calculator extends React.Component {
  constructor(props) {
    super(props);
    this.state = {result: 0, num1: "", num2: ""};

    this.change1 = this.change1.bind(this);
    this.change2 = this.change2.bind(this);
    this.add = this.add.bind(this);
    this.multiply = this.multiply.bind(this);
    this.subtract = this.subtract.bind(this);
    this.divide = this.divide.bind(this);
    this.clear = this.clear.bind(this);
  }

  change1(event){
    event.preventDefault();
    this.setState({num1: Number(document.getElementById("num1").value)});
  }

  change2(event){
    event.preventDefault();
    this.setState({num2: Number(document.getElementById("num2").value)});
  }

  add(event){
    event.preventDefault();
    this.setState({result: this.state.num1 + this.state.num2});
  }

  multiply(event){
    event.preventDefault();
    this.setState({result: this.state.num1 * this.state.num2});
  }

  subtract(event){
    event.preventDefault();
    this.setState({result: this.state.num1 - this.state.num2});
  }

  divide(event){
    event.preventDefault();
    this.setState({result: this.state.num1 / this.state.num2});
  }

  clear(event){
    event.preventDefault();
    this.setState({result: 0, num1: "", num2: ""});
  }

  render() {
    return (
      <div>
        <h1>{this.state.result}</h1>
        <input onChange={this.change1} value={this.state.num1}
          id="num1"></input>
        <input onChange={this.change2} value={this.state.num2}
          id="num2"></input>
        <button onClick={this.clear} id="clear">Clear</button>
        <br />
        <button onClick={this.add} id="add">+</button>
        <button onClick={this.multiply} id="multiply">*</button>
        <button onClick={this.subtract} id="subtract">-</button>
        <button onClick={this.divide} id="divide">/</button>
      </div>
    );
  }
}

export default Calculator;
