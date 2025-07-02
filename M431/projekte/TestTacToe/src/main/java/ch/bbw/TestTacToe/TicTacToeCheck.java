package ch.bbw.TestTacToe;

public class TicTacToeCheck {
    private boolean checkAllWins(char[][] input, char player) {
        return checkRows(input, player) || checkColumns(input, player) || checkDiagonals(input, player);
    }

    public boolean hasFinished(char[][] input) {
        return checkAllWins(input, 'x') || checkAllWins(input, 'o');
    }

    public char whoWon(char[][] input) {
        if (checkAllWins(input, 'x')) {
            return 'x';
        } else if (checkAllWins(input, 'o')) {
            return 'o';
        } else {
            return ' ';
        }
    }

    boolean checkRows(char[][] input, char player) {
        return (input[0][0] == player && input[0][1] == player && input[0][2] == player)
                || (input[1][0] == player && input[1][1] == player && input[1][2] == player)
                || (input[2][0] == player && input[2][1] == player && input[2][2] == player);
    }

    boolean checkColumns(char[][] input, char player) {
        return (input[0][0] == player && input[1][0] == player && input[2][0] == player)
                || (input[0][1] == player && input[1][1] == player && input[2][1] == player)
                || (input[0][2] == player && input[1][2] == player && input[2][2] == player);

    }

    boolean checkDiagonals(char[][] input, char player) {
        return (input[0][0] == player && input[1][1] == player && input[2][2] == player)
                || (input[0][2] == player && input[1][1] == player && input[2][0] == player);
    }
}