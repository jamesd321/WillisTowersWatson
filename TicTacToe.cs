using System;

public class TicTacToe
{
    private int _nxnDimensionSize { get; set; } // Get set not needed but it helps with VS references 
    private int[,] _grid { get; set; }
    private int _availableSpaces { get; set; }
    /// <summary>
    /// -1 Game in progress, 0 No Winner, 1+ Player who won
    /// </summary>
    private int _gameStatus { get; set; } = -1;

    /// <summary>
    /// Created a Tic Tac Tow game board
    /// Assumption: Invalid operations exceptions will be thrown if the nxn dimension value is 0 or less. 
    /// </summary>
    /// <param name="n">nxn dimension for the game board</param>
    public TicTacToe(int n)
    {
        ValidateNxnDimension(n);

        // Game settings
        _nxnDimensionSize = n;
        _grid = new int[_nxnDimensionSize, _nxnDimensionSize];
        _availableSpaces = _nxnDimensionSize * _nxnDimensionSize;
    }

    /// <summary>
    /// Place a piece on the game board
    /// Assumption: Starting column and row placements will be 0 even though 1 is human readable. 
    /// Assumption: Invalid operations exceptions will be thrown for invalid operations. 
    /// Assumption: Invalid operations exceptions will be thrown if the game is over. 
    /// Assumption: No inforcement of "next player" is in place 
    /// </summary>
    /// <param name="row">row to place a piece</param>
    /// <param name="col">column to place a piece</param>
    /// <param name="player">the player (1 or 2) the piece is for</param>
    /// <returns>0 = no winner, 1 = player 1 won, 2 = player 2 won</returns>
    public int PlacePiece(int row, int col, int player)
    {
        CheckGameStatus();
        CheckPlacement(row, col);
        UpdateGame(row, col, player);

        return _gameStatus > 0 ? _gameStatus : 0;
    }

    /// <summary>
    /// Updates the grid and game status
    /// </summary>
    /// <param name="row">row to place a piece</param>
    /// <param name="col">column to place a piece</param>
    /// <param name="player">the player (1 or 2) the piece is for</param>
    private void UpdateGame(int row, int col, int player)
    {
        bool isWinner = false;

        _grid[row, col] = player;

        // Check horizontal
        CheckGridForWinner(player, ref isWinner, index => { return _grid[row, index]; });
        // Check vertical
        CheckGridForWinner(player, ref isWinner, index => { return _grid[index, col]; });
        // Check diagonal 1
        CheckGridForWinner(player, ref isWinner, index => { return _grid[index, index]; });
        // Check diagonal 2
        CheckGridForWinner(player, ref isWinner, index => { return _grid[_nxnDimensionSize - 1 - index, index]; });

        if (isWinner)
        {
            _gameStatus = player; // Player is the winner
        }
        else if ((_availableSpaces--).Equals(0))
        {
            _gameStatus = 0; // No winner
        }
    }

    /// <summary>
    /// Sets isWinner to true if all values from the getGridValue is the same as the player parameter
    /// </summary>
    /// <param name="player">the player (1 or 2) the piece is for</param>
    /// <param name="isWinner">reference to if the player is a winner</param>
    /// <param name="getGridValue">Function that returns the value from the grid</param>
    private void CheckGridForWinner(int player, ref bool isWinner, Func<int, int> getGridValue)
    {
        if (isWinner)
        {
            return;
        }

        for (int i = 0; i < _nxnDimensionSize; i++)
        {
            int gridValue = getGridValue(i);

            if (!gridValue.Equals(player))// Different player in space
            {
                return;
            }
            else if (i.Equals(_nxnDimensionSize - 1))// End of grid with all spaces as player
            {
                isWinner = true;
            }
        }
    }

    /// <summary>
    /// Throws invalid operation if game is not in progress
    /// </summary>
    private void CheckGameStatus()
    {
        if (_gameStatus > -1)
        {
            throw new InvalidOperationException("Game is complete. No moves available");
        }
    }

    /// <summary>
    /// Throws invalid operation if the position is populated or if it is out of boundaries
    /// </summary>
    /// <param name="row">row to place a piece</param>
    /// <param name="col">column to place a piece</param>
    private void CheckPlacement(int row, int col)
    {
        if (
            row >= _nxnDimensionSize || col >= _nxnDimensionSize // Upper boundaries
           || row < 0 || col < 0 // lower boundaries
           )
        {
            throw new InvalidOperationException("Position is outside of boundaries.");
        }
        if (_grid[row, col] > 0)
        {
            throw new InvalidOperationException("Position is taken");
        }
    }

    /// <summary>
    /// Throws invalid operation if n is 0 or less
    /// </summary>
    /// <param name="n">nxn dimension for the game board</param>
    private static void ValidateNxnDimension(int n)
    {
        if (n <= 0)
        {
            throw new InvalidOperationException("n (nxn dimension) must be greater than 0 and recommended to be 3 or greater.");
        }
    }

}
