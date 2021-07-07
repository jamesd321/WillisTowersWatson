using Microsoft.VisualStudio.TestTools.UnitTesting;
using System;

[TestClass]
public class TicTacToeTests
{
    [TestMethod]
    public void OnePlayerHorizontalTest()
    {
        TicTacToe game = new TicTacToe(3);
        Assert.AreEqual(0, game.PlacePiece(0, 0, 1));
        Assert.AreEqual(0, game.PlacePiece(0, 1, 1));
        Assert.AreEqual(1, game.PlacePiece(0, 2, 1));
    }
    [TestMethod]
    public void OnePlayerVerticalTest()
    {
        TicTacToe game = new TicTacToe(3);
        Assert.AreEqual(0, game.PlacePiece(1, 0, 1));
        Assert.AreEqual(0, game.PlacePiece(0, 0, 1));
        Assert.AreEqual(1, game.PlacePiece(2, 0, 1));
    }
    [TestMethod]
    public void OnePlayerDiagonal1Test()
    {
        TicTacToe game = new TicTacToe(3);
        Assert.AreEqual(0, game.PlacePiece(1, 1, 1));
        Assert.AreEqual(0, game.PlacePiece(0, 0, 1));
        Assert.AreEqual(1, game.PlacePiece(2, 2, 1));
    }
    [TestMethod]
    public void OnePlayerDiagonal2Test()
    {
        TicTacToe game = new TicTacToe(3);
        Assert.AreEqual(0, game.PlacePiece(1, 1, 1));
        Assert.AreEqual(0, game.PlacePiece(0, 2, 1));
        Assert.AreEqual(1, game.PlacePiece(2, 0, 1));
    }
    [TestMethod]
    public void TwoPlayerTest()
    {
        TicTacToe game = new TicTacToe(3);
        Assert.AreEqual(0, game.PlacePiece(0, 0, 1));
        Assert.AreEqual(0, game.PlacePiece(0, 1, 1));

        Assert.AreEqual(0, game.PlacePiece(2, 2, 2));
        Assert.AreEqual(0, game.PlacePiece(2, 1, 2));
        Assert.AreEqual(2, game.PlacePiece(2, 0, 2));
    }
    [TestMethod]
    public void NoValidMovesTest()
    {
        TicTacToe game = new TicTacToe(3);
        Assert.AreEqual(0, game.PlacePiece(0, 0, 1));
        Assert.AreEqual(0, game.PlacePiece(0, 1, 1));
        Assert.AreEqual(0, game.PlacePiece(1, 2, 1));
        Assert.AreEqual(0, game.PlacePiece(2, 0, 1));
        Assert.AreEqual(0, game.PlacePiece(2, 2, 1));

        Assert.AreEqual(0, game.PlacePiece(0, 2, 2));
        Assert.AreEqual(0, game.PlacePiece(1, 0, 2));
        Assert.AreEqual(0, game.PlacePiece(1, 1, 2));
        Assert.AreEqual(0, game.PlacePiece(2, 1, 2));

        Assert.ThrowsException<InvalidOperationException>(() => game.PlacePiece(2, 0, 2));
    }
    [TestMethod]
    public void InValidMovesTest()
    {
        TicTacToe game = new TicTacToe(3);
        Assert.AreEqual(0, game.PlacePiece(0, 0, 1));
        Assert.ThrowsException<InvalidOperationException>(() => game.PlacePiece(0, 0, 1));
    }
    [TestMethod]
    public void GameDoneInValidMovesTest()
    {
        TicTacToe game = new TicTacToe(3);
        Assert.AreEqual(0, game.PlacePiece(1, 1, 1));
        Assert.AreEqual(0, game.PlacePiece(0, 0, 1));
        Assert.AreEqual(1, game.PlacePiece(2, 2, 1));
        Assert.ThrowsException<InvalidOperationException>(() => game.PlacePiece(2, 0, 1));
    }

    [TestMethod]
    public void GridBoundarySizeTest()
    {
        Assert.ThrowsException<InvalidOperationException>(() => new TicTacToe(-1));
        Assert.ThrowsException<InvalidOperationException>(() => new TicTacToe(0));
        new TicTacToe(1);
    }
    [TestMethod]
    public void GridGrowSizeTest()
    {
        for (int nxn = 1; nxn <= 5; nxn++)
        {
            TicTacToe game = new TicTacToe(nxn);
            for (int pos = 0; pos < nxn; pos++)
            {
                if (pos == nxn - 1)
                {
                    Assert.AreEqual(1, game.PlacePiece(pos, pos, 1));
                }
                else
                {
                    Assert.AreEqual(0, game.PlacePiece(pos, pos, 1));
                }
            }
        }
    }
}