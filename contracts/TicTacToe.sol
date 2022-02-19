//SPDX-License-Identifier: Unlicense
pragma solidity ^0.4.24;

/**
 * @title TicTacToe contract
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
        return ((board[a] == board[b]) && (board[b] == board[c]) );
    }

    /**
     * @dev get the status of the game
     * @param pos the position the player places at
     * @return the status of the game
     */
    function _getStatus(uint pos) private view returns (uint) {
        /*Please complete the code here.*/
        return status;
    }

    /**
     * @dev ensure the game is still ongoing before a player moving
     * update the status of the game after a player moving
     * @param pos the position the player places at
     */
    modifier _checkStatus(uint pos) {
        /*Please complete the code here.*/
        require(status == 0);
        /* We update the status according to if the player who did the last move won or not */
        if (pos == 0) {
            if (_threeInALine(0, 1, 2) || _threeInALine(0, 4, 8) || _threeInALine(0, 3, 6)) {
                status = turn;
            } else {
                status = 0;
            }
        } else if (pos == 1) {
            if (_threeInALine(0, 1, 2) || _threeInALine(1, 4, 7)) {
                status = turn;
            }
        } else if (pos == 2) {
            if (_threeInALine(0, 1, 2) || _threeInALine(2, 5, 8) || _threeInALine(2, 4, 6)) {
                status = turn;
            }
        } else if (pos == 3) {
            if (_threeInALine(3, 4, 5) || _threeInALine(0, 3, 6)) {
                status = turn;
            }
        } else if (pos == 4) {
            if (_threeInALine(3, 4, 5) || _threeInALine(1, 4, 7) || _threeInALine(0, 4, 8) || _threeInALine(2, 4, 6)) {
                status = turn;
            }
        } else if (pos == 5) {
            if (_threeInALine(3, 4, 5) || _threeInALine(2, 5, 8)) {
                status = turn;
            }
        } else if (pos == 6) {
            if (_threeInALine(6, 7, 8) || _threeInALine(0, 3, 6) || _threeInALine(6, 4, 2)) {
                status = turn;
            }
        } else if (pos == 7) {
            if (_threeInALine(6, 7, 8) || _threeInALine(1, 4, 7)) {
                status = turn;
            }
        } else if (pos == 8) {
            if (_threeInALine(6, 7, 8) || _threeInALine(0, 4, 8) || _threeInALine(2, 5, 8)) {
                status = turn;
            }
        }
        _;
    }

    /**
     * @dev check if it's msg.sender's turn
     * @return true if it's msg.sender's turn otherwise false
     */
    function myTurn() public view returns (bool) {
       /*Please complete the code here.*/
        if (players[turn - 1] == msg.sender) {
            return true;
        } else {
            return false;
        }
    }

    /**
     * @dev ensure it's a msg.sender's turn
     * update the turn after a move
     */
    modifier _myTurn() {
      /*Please complete the code here.*/
        require(myTurn());
        if (turn == 1) {
            turn = 2;
        } else {
            turn = 1;
        }
        _;
    }

    /**
     * @dev check a move is valid
     * @param pos the position the player places at
     * @return true if valid otherwise false
     */
    function validMove(uint pos) public view returns (bool) {
        /*Please complete the code here.*/
        if ( 0 <= pos && pos < 9) { /* Check if the player places within the board */
            if (board[pos] != 1 && board[pos] != 2) {   /* Check if the pos is free, i.e. has not been chosen before */
                board[pos] = turn;
            } else {
                return false;
            }
            return true;
        } else {
            return false;
        }
    }

    /**
     * @dev ensure a move is valid
     * @param pos the position the player places at
     */
    modifier _validMove(uint pos) {
      /*Please complete the code here.*/
        require(validMove(pos));
        _;
    }

    /**
     * @dev a player makes a move
     * @param pos the position the player places at
     */
    function move(uint pos) public _validMove(pos) _checkStatus(pos) _myTurn {
    }

    /**
     * @dev show the current board
     * @return board
     */
    function showBoard() public view returns (uint[9]) {
      return board;
    }
}
