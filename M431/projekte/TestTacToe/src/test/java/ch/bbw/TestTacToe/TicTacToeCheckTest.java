package ch.bbw.TestTacToe;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertTrue;

class TicTacToeCheckTest {

    @Test
    @DisplayName("x has first row")
    void xHasRow1() {
        TicTacToeCheck ticTacToeCheck = new TicTacToeCheck();
        assertTrue(ticTacToeCheck.checkRows(new char[][]{{'x', 'x', 'x'}, {'o', ' ', 'o'}, {'x', ' ', 'o'}}, 'x'));
    }

    @Test
    @DisplayName("o doesn't have rows")
    void oHasNoRow() {
        TicTacToeCheck ticTacToeCheck = new TicTacToeCheck();
        assertFalse(ticTacToeCheck.checkRows(new char[][]{{'x', 'x', 'x'}, {'o', ' ', 'o'}, {'x', ' ', 'o'}}, 'o'));
    }

    @Test
    @DisplayName("x has first column")
    void xHasCol1() {
        TicTacToeCheck ticTacToeCheck = new TicTacToeCheck();
        assertTrue(ticTacToeCheck.checkColumns(new char[][]{{'x', 'o', 'o'}, {'x', ' ', ' '}, {'x', 'o', 'x'}}, 'x'));
    }

    @Test
    @DisplayName("o doesn't have columns")
    void oHasNoCol() {
        TicTacToeCheck ticTacToeCheck = new TicTacToeCheck();
        assertFalse(ticTacToeCheck.checkColumns(new char[][]{{'x', 'o', 'o'}, {'x', ' ', ' '}, {'x', 'o', 'x'}}, 'o'));
    }
}
