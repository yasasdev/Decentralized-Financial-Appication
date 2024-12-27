import React from 'react';

function Form() {
  return (
    <div>
      <h1>Form</h1>
      <div className="container">
        <img src="dbank_logo.png" alt="DBank logo" width="100" />
        <h1>
          Current Balance: $<span id="value">234</span>
        </h1>
        <div className="divider"></div>
        <form onSubmit={(e) => e.preventDefault()}>
          <h2>Amount to Top Up</h2>
          <input
            id="input-amount"
            type="number"
            step="0.01"
            min="0"
            name="topUp"
            defaultValue=""
          />
          <h2>Amount to Withdraw</h2>
          <input
            id="withdrawal-amount"
            type="number"
            name="withdraw"
            step="0.01"
            min="0"
            defaultValue=""
          />
          <input
            id="submit-btn"
            type="submit"
            value="Finalise Transaction"
          />
        </form>
      </div>
    </div>
  );
}

export default Form;
