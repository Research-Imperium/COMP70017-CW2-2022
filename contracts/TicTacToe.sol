//SPDX-License-Identifier: Unlicense
pragma solidity ^0.4.24;

/**
 * @title TicTacToe contract
  _threeInALine() : 1 point

  _getStatus() : 4 points

  _checkStatus() : 1 point

  myTurn() : 1 point

  _myTurn() : 1 point

  validMove() : 1 point

  _validMove() : 1 point
 **/
contract TicTacToe {
    address[2] public players;

    /**
     turn
     1 - players[0]'s turn
     2 - players[1]'s turn
     */
    uint public turn = 1;

    /**
     status
     0 - ongoing
     1 - players[0] won
     2 - players[1] won
     3 - draw
     */
    uint public status;

    /**
    board status
     0    1    2
     3    4    5
     6    7    8
     */
    uint[9] private board;

    /**
      * @dev Deploy the contract to create a new game
      * @param opponent The address of player2
      **/
    constructor(address opponent) public {
        require(msg.sender != opponent, "No self play");
        players = [msg.sender, opponent];
    }

    /**
      * @dev Check a, b, c in a line are the same
      * _threeInALine doesn't check if a, b, c are in a line
      * @param a position a
      * @param b position b
      * @param c position c
      **/    
    function _threeInALine(uint a, uint b, uint c) private view returns (bool){
        /*Please complete the code here.*/
        return a == b && a == c && a != 0;
    }

    /**
     * @dev get the status of the game
     * @param pos the position the player places at
     * @return the status of the game
     */
    function _getStatus(uint pos) private view returns (uint) {
        /*Please complete the code here.*/
        uint row = pos / 3;
        uint col = pos % 3;

        bool isRow = _threeInALine(board[row * 3], board[row * 3 + 1], board[row * 3 + 2]);
        bool isCol = _threeInALine(board[col], board[col + 3], board[col + 6]);
        
        bool isDia1 = _threeInALine(board[0], board[4], board[8]);
        bool isDia2 = _threeInALine(board[2], board[4], board[6]);

        bool isFull = true;
        for (uint i = 0; i < board.length; i++) {
          if (board[i] == 0) {
            isFull = false;
          }
        }

        if (isRow || isCol || isDia1 || isDia2) {
          return msg.sender == players[0] ? 1 : 2;
        } else if (isFull) {
          return 3;
        } else {
          return 0;
        }
    }

    /**
     * @dev ensure the game is still ongoing before a player moving
     * update the status of the game after a player moving
     * @param pos the position the player places at
     */
    modifier _checkStatus(uint pos) {
        /*Please complete the code here.*/
        require(status == 0);
        _;
        status = _getStatus(pos);
    }

    /**
     * @dev check if it's msg.sender's turn
     * @return true if it's msg.sender's turn otherwise false
     */
    function myTurn() public view returns (bool) {
       /*Please complete the code here.*/
      if (msg.sender == players[0]) {
        return turn == 1;
      } else if (msg.sender == players[1]) {
        return turn == 2;
      } 
    }

    /**
     * @dev ensure it's a msg.sender's turn
     * update the turn after a move
     */
    modifier _myTurn() {
      /*Please complete the code here.*/
      require(myTurn());
      _;
      if (msg.sender == players[0]) {
        turn = 2;
      } else {
        turn = 1;
      }
    }

    /**
     * @dev check a move is valid
     * @param pos the position the player places at
     * @return true if valid otherwise false
     */
    function validMove(uint pos) public view returns (bool) {
      /*Please complete the code here.*/
      return board[pos] == 0 && pos <= 8 && pos >= 0;
    }

    /**
     * @dev ensure a move is valid
     * @param pos the position the player places at
     */
    modifier _validMove(uint pos) {
      /*Please complete the code here.*/
      require(board[pos] == 0 && pos <= 8 && pos >= 0);
      _;
    }

    /**
     * @dev a player makes a move
     * @param pos the position the player places at
     */
    function move(uint pos) public _validMove(pos) _checkStatus(pos) _myTurn {
        board[pos] = turn;
    }

    /**
     * @dev show the current board
     * @return board
     */
    function showBoard() public view returns (uint[9]) {
      return board;
    }
}
