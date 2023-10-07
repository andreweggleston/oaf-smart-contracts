# Balance Sheet

## Exercise: Write a smart contract that does the following:
      1. Maintains a balance sheet of addresses -> to amounts.
      2. Gives the deployer of the contract a balance of 10_000 at the time of contract creation.
      3. Allows an address to transfer its balance to another address.

## Solution: 
      1. create a 'mapping' from addresses to balances (uint)
      2. create a constructor that uses msg.sender to grant an initial balance of 10_000 to the deployer of the contract
      3. create a public method to transfer from a senders balance to a receivers balance

## Tests:
      1. constructor does what its supposed to do
      2. transfer from an empty balance fails
      3. transfer amount less than balance succeeds and moves the correct amount
      4. transfer amount more than balance fails