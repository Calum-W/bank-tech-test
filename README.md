Bank Tech Test
===============

This repo was created as a practice tech test in week 10 of Makers' Academy.

### Acceptance criteria

**Given** a client makes a deposit of 1000 on 10-01-2012  
**And** a deposit of 2000 on 13-01-2012  
**And** a withdrawal of 500 on 14-01-2012  
**When** she prints her bank statement  
**Then** she would see

```
date || credit || debit || balance
14/01/2012 || || 500.00 || 2500.00
13/01/2012 || 2000.00 || || 3000.00
10/01/2012 || 1000.00 || || 1000.00

```

Based on these acceptance criteria I created the following user stories:

```
As a bank customer
So I can keep my money safe
I would like to make a deposit into an account
```

```
As a bank customer
So I can use my money
I would like to withdraw an amount from the account
```

```
As a bank customer
So I can keep track of my transactions
I would like to print a copy of my bank statement
```

### Solution
I decided that the best way to fulfil these criteria was to create one class, which would output the given statement in the same formatting after a series of transactions. I did this by initialising with a balance and a transactions array. Each time a withdrawal/deposit was made, a method would be called that created a formatted statement line to be passed into the start of the transactions array. The print_statemtn method would then simply print the header, along with the transactions array joined with "\n".

After discussing the test with coaches in the afternoon, I discovered that I was wrong to approach a tech test as finding the most simple solution that fulfils only the acceptance criteria. Given my new understanding of tech tests and the expectations employers have, I would have created separate transaction and statement classes.
