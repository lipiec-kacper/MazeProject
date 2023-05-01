import Foundation

class Moves{

func moveForward(Maze: Maze)  {
    Maze.movePlayer(to: (0, -1))

}

    func moveBack(Maze: Maze) {
    Maze.movePlayer(to: (0, 1))
}

    func moveLeft(Maze: Maze) {
    Maze.movePlayer(to: (-1, 0))
}

    func moveRight(Maze: Maze) {
    Maze.movePlayer(to: (1, 0))
}

}
