# COMP70017-CW2

In coursework 2, you are given a decentralized application for a tic-tac-toe game. The game isn't yet functional, and we expect you to know the rules of the game.

We hence ask you to please complete the missing parts, identified with `/*Please complete the code here.*/`.

We packaged the entire code into a docker container, such that you literally don't need to configure anything.

## Instructions
Once you completed the contract (everything to be completed is in the `contracts/TicTacToe.sol`), you can run `docker build -t tic-tac-toe .` to build the tic-tac-toe docker image.

We provide several test cases to test the basic functions of your contract, which however is not complete as you are supposed to test your application through the UI and with MetaMask. You can anyways run `docker run tic-tac-toe npm test` to check the incomplete test results and you are encouraged to extend the tests yourself, if you like. Our grading script will follow a similar methodology as the test script (i.e., to test your smart contract and grade based on the test results).

Prerequisite: please [install docker](https://docs.docker.com/desktop/) on your system.

To set up and play your tic-tac-toe game, you can:

1. start the ganache test chain

`docker run -p 8545:8545 -d trufflesuite/ganache-cli:latest -g 0`

2. start the web server

`docker run -p 8080:8080 -d tic-tac-toe`

3. open `http://localhost:8080/` in two separate web browsers with each a separate Metamask installed, and enjoy the game. On Chrome you can create **two different users** and install Metamask in each. You'll need to configure Metamask to connect to your local chain as well (which is not graded but we leave this up to you as part of the exercise for your own testing).

# Grading Scheme

You can get 100% of the grades with 10 points, distributed as follows over the 7 functions of the contract:

`_threeInALine()` : 1 point

`_getStatus()` : 4 points

`_checkStatus()` : 1 point

`myTurn()` : 1 point

`_myTurn()` : 1 point

`validMove()` : 1 point

`_validMove()` : 1 point

Once you're done, please upload your zip file containing the entire project on Cate.
