# Kanban

<img src="https://github.com/polinakamurko/kanban/blob/master/Example.gif?raw=true" width="200" height="400" />

## Classes description

`KanbanViewController` creates the first collection view with horizontal scroll to show boards.

`BoardsCollectionViewCell` defines board cell: board title, items collection view, and button for adding new items to `ItemsCollectionView`.

`ItemsCollectionView` sets up collection view with vertical scroll inside BoardsCollectionViewCell.

`ItemsCollectionViewCell` creates item cell and defines its layout.

`Board` and `Item` are models.
