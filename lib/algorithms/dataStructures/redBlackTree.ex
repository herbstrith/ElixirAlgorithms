defmodule Algorithms.DataStructures.RedBlackTree do
  @moduledoc """
     A red-black tree is approximately balanced
     A red-black tree is a binary tree that satisfies the following red-black properties:
     1. Every node is either red or black.
     2. The root is black.
     3. Every leaf (NIL) is black.
     4. If a node is red, then both its children are black.
     5. For each node, all simple paths from the node to descendant leaves contain the
       same number of black nodes.
     Using the implementantion of insertion found in the article
     "Red-black trees in a functional setting" by Chris Okasaki
   """
   alias Algorithms.DataStructures.RedBlackTree, as: RBNode
   defstruct key: nil, left: nil, right: nil, data: nil, color: :black

   def create() do
     %RBNode{}
   end

   # haskel equivalent: balance B (T R (T R a x b) y c) z d = T R (T B a x b) y (T B c z d)
   def balance(_nodeColor = :black, leftNode = %RBNode{color: :red, left: %RBNode{color: :red}}, x, rightNode) do
     %RBNode{
       color: :red,
       left: %RBNode{
         color: :black,
         key: leftNode.left.key,
         data: leftNode.left.data,
         left: leftNode.left.left,
         right: leftNode.left.right,
       },
       key: leftNode.key,
       data: leftNode.data,
       right: %RBNode{
         color: :black,
         key: x.key,
         data: x.data,
         left: leftNode.right,
         right: rightNode,
       },
     }
   end

   # haskel equivalent: balance B (T R a x (T R b y c)) z d = T R (T B a x b) y (T B c z d)
   def balance(_nodeColor = :black, leftNode = %RBNode{color: :red, right: %RBNode{color: :red}}, x, rightNode) do
     %RBNode{
       color: :red,
       left: %RBNode{
         color: :black,
         key: leftNode.key,
         data: leftNode.data,
         left: leftNode.left,
         right: leftNode.right.left,
       },
       key: leftNode.right.key,
       data: leftNode.right.data,
       right: %RBNode{
         color: :black,
         key: x.key,
         data: x.data,
         left: leftNode.right.right,
         right: rightNode,
       },
     }
   end

   # haskel equivalent: balance B a x (T R (T R b y c) z d) = T R (T B a x b) y (T B c z d)
   def balance(_nodeColor = :black, leftNode, x, rightNode = %RBNode{color: :red, left: %RBNode{color: :red}}) do
     %RBNode{
       color: :red,
       left: %RBNode{
         color: :black,
         key: x.key,
         data: x.data,
         left: leftNode,
         right: rightNode.left.left,
       },
       key: rightNode.left.key,
       data: rightNode.left.data,
       right: %RBNode{
         color: :black,
         key: rightNode.key,
         data: rightNode.data,
         left: rightNode.left.right,
         right: rightNode.right,
       },
     }
   end

   #haskel original: balance B a x (T R b y (T R c z d)) = T R (T B a x b) y (T B c z d)
   def balance(_nodeColor = :black, leftNode, x, rightNode = %RBNode{color: :red, right: %RBNode{color: :red}}) do
     %RBNode{
       color: :red,
       left: %RBNode{
         color: :black,
         key: x.key,
         data: x.data,
         left: leftNode,
         right: rightNode.left,
       },
       key: rightNode.key,
       data: rightNode.data,
       right: %RBNode{
         color: :black,
         key: rightNode.right.key,
         data: rightNode.right.data,
         left: rightNode.right.left,
         right: rightNode.right.right,
       },
     }
   end

   # used in delete
   # haskel equivalent: balance BB a x (T R (T R b y c) z d) = T B (T B a x b) y (T B c z d)
   def balance(_nodeColor = :blackblack, leftNode, x, rightNode = %RBNode{color: :red, right: %RBNode{color: :red}}) do
     %RBNode{
       color: :black,
       left: %RBNode{
         color: :black,
         key: x.key,
         data: x.data,
         left: leftNode,
         right: rightNode.left,
       },
       key: rightNode.key,
       data: rightNode.data,
       right: %RBNode{
         color: :black,
         key: rightNode.right.key,
         data: rightNode.right.data,
         left: rightNode.right.left,
         right: rightNode.right.right,
       },
     }
   end

   # used in delete
   # haskel equivalent: balance BB (T R a x (T R b y c)) z d = T B (T B a x b) y (T B c z d)
   def balance(_nodeColor = :black, leftNode = %RBNode{color: :red, right: %RBNode{color: :red}}, x, rightNode) do
     %RBNode{
       color: :black,
       left: %RBNode{
         color: :black,
         key: x.key,
         data: x.data,
         left: leftNode,
         right: rightNode.left,
       },
       key: rightNode.key,
       data: rightNode.data,
       right: %RBNode{
         color: :black,
         key: rightNode.right.key,
         data: rightNode.right.data,
         left: rightNode.right.left,
         right: rightNode.right.right,
       },
     }
   end

   def balance(nodeColor, leftNode, x, rightNode) do
     %RBNode{
       color: nodeColor,
       left: leftNode,
       key: x.key,
       data: x.data,
       right: rightNode
     }
   end

   def insert(actualTreeNode = %RBNode{}, newNode = %RBNode{}) do
     %RBNode{insertRec(actualTreeNode, newNode) | color: :black}
   end

   def insertRec(_actualTreeNode = nil, newNode = %RBNode{}) do
     %{newNode | color: :red}
   end

   def insertRec(actualTreeNode = %RBNode{}, newNode = %RBNode{}) do
     cond do
       actualTreeNode.key > newNode.key ->
         balance(actualTreeNode.color, insertRec(actualTreeNode.left, newNode), actualTreeNode, actualTreeNode.right)
       actualTreeNode.key == newNode.key ->
         actualTreeNode
       actualTreeNode.key < newNode.key ->
         balance(actualTreeNode.color, actualTreeNode.left, actualTreeNode, insertRec(actualTreeNode.right, newNode))
     end
   end

   def delete(actualTreeNode = %RBNode{}, deleteNode = %RBNode{}) do
     #redden
     %RBNode{deleteRec(actualTreeNode, deleteNode) | color: :red}
   end

   def deleteRec(actualTreeNode = %RBNode{}, deleteNode = %RBNode{color: :red, left: nil, right: nil}) do
     cond do
       actualTreeNode.key == deleteNode.key -> nil
       actualTreeNode.key != deleteNode.key -> deleteNode
     end
   end

   def deleteRec(actualTreeNode = %RBNode{}, deleteNode = %RBNode{color: :black, left: nil, right: nil}) do
     cond do
       actualTreeNode.key == deleteNode.key -> :emptyempty
       actualTreeNode.key != deleteNode.key -> deleteNode
     end
   end

   def deleteRec(actualTreeNode = %RBNode{}, deleteNode = %RBNode{
     color: :black,
     left:  %RBNode{
       color: :red,
       left: nil,
       right: nil,
     } ,
     right: nil}) do
     cond do
       actualTreeNode.key < deleteNode.key ->  %{ actualTreeNode | color: :black, left: deleteRec(actualTreeNode.left, deleteNode)}
       actualTreeNode.key == deleteNode.key ->  %{ actualTreeNode.left | left: nil, right: nil }
       actualTreeNode.key > deleteNode.key -> actualTreeNode
     end
   end

   def deleteRec(actualTreeNode = %RBNode{}, deleteNode = %RBNode{}) do
     cond do
       actualTreeNode.key < deleteNode.key ->  rotate(
         actualTreeNode.color,
         deleteRec(%{ actualTreeNode.left | color: :red, left: nil, right: nil}, deleteNode),
         actualTreeNode,
         nil)
       actualTreeNode.key == deleteNode.key ->
         {y, b} = min_del(actualTreeNode.right)
         rotate(
           actualTreeNode.color,
           actualTreeNode.left,
           y,
           b)
       actualTreeNode.key > deleteNode.key -> rotate(
         actualTreeNode.color,
         actualTreeNode.left,
         actualTreeNode,
         deleteRec(actualTreeNode.right, deleteNode))
     end
   end

   # rotate R (T BB a x b) y (T B c z d) = balance B (T R (T B a x b) y c) z d
   def rotate(_color = :red,
      leftNode = %RBNode{ color: :blackblack},
      actualNode = %RBNode{},
      rightNode = %RBNode{ color: :black}) do
     balance(:black,
      %{ actualNode | color: :red, left: %{leftNode | color: :black}, right: rightNode.left },
      rightNode,
      rightNode.right
      )
   end

   #rotate R EE y (T B c z d) = balance B (T R E y c) z d
   def rotate(_color = :red,
      _leftNode = :emptyempty,
      actualNode = %RBNode{},
      rightNode = %RBNode{ color: :black}) do
     balance(:black,
      %{ actualNode | color: :red, left: nil, right: rightNode.left },
      rightNode,
      rightNode.right
      )
   end

   #rotate R (T B a x b) y (T BB c z d) = balance B a x (T R b y (T B c z d))
   def rotate(_color = :red,
      leftNode = %RBNode{ color: :black},
      actualNode = %RBNode{},
      rightNode = %RBNode{ color: :blackblack}) do
     balance(:black,
      leftNode.left,
      leftNode,
      %{ actualNode | color: :red, left: leftNode.right, right: rightNode }
      )
   end

   #rotate R (T B a x b) y EE = balance B a x (T R b y E)
   def rotate(_color = :red,
   leftNode = %RBNode{ color: :black},
   actualNode = %RBNode{},
   _rightNode = :emptyempty) do
      balance(:black,
      leftNode.left,
      leftNode,
      %{ actualNode | color: :red, left: leftNode.right, right: nil }
      )
  end

  # rotate B (T BB a x b) y (T B c z d) = balance BB (T R (T B a x b) y c) z d
  def rotate(_color = :black,
   leftNode = %RBNode{ color: :blackblack},
   actualNode = %RBNode{},
   rightNode = %RBNode{ color: :black}) do
      balance(:blackblack,
      %{ actualNode | color: :red, left: %{leftNode | color: :black }, right: rightNode.left },
      rightNode,
      rightNode.right
      )
  end

  # rotate B EE y (T B c z d) = balance BB (T R E y c) z d
  def rotate(_color = :black,
   _leftNode = :emptyempty,
   actualNode = %RBNode{},
   rightNode = %RBNode{ color: :black}) do
      balance(:blackblack,
      %{ actualNode | color: :red, left: nil, right: rightNode.left },
      rightNode,
      rightNode.right
      )
  end

  # rotate B (T B a x b) y (T BB c z d) = balance BB a x (T R b y (T B c z d))
  def rotate(_color = :black,
   leftNode = %RBNode{ color: :black},
   actualNode = %RBNode{},
   rightNode = %RBNode{ color: :blackblack}) do
      balance(:blackblack,
      leftNode.left,
      leftNode,
      %{ actualNode | color: :red, left: leftNode.right, right: %{rightNode | color: :black} }
      )
  end

  # rotate B (T B a x b) y EE = balance BB a x (T R b y E)
  def rotate(_color = :black,
   leftNode = %RBNode{ color: :black},
   actualNode = %RBNode{},
   _rightNode = :emptyempty) do
      balance(:blackblack,
      leftNode.left,
      leftNode,
      %{ actualNode | color: :red, left: leftNode.right, right: nil }
      )
  end

  # rotate B (T BB a w b) x (T R (T B c y d) z e) = T B (balance B (T R (T B a w b) x c) y d) z e
  def rotate(_color = :black,
   leftNode = %RBNode{ color: :blackblack},
   actualNode = %RBNode{},
   rightNode = %RBNode{color: :red, left: %RBNode{color: :black}}) do
      balance(:black,
      %{actualNode | color: :red, left: %{leftNode | color: :black}, right: rightNode.left.left },
      rightNode,
      rightNode.right
      )
  end

  # rotate B EE x (T R (T B c y d) z e) = T B (balance B (T R E x c) y d) z e
  def rotate(_color = :black,
   _leftNode = :emptyempty,
   actualNode = %RBNode{},
   rightNode = %RBNode{color: :red, left: %RBNode{color: :black}}) do
      balance(:black,
      %{actualNode | color: :red, left: nil, right: rightNode.left.left },
      rightNode.left,
      rightNode.right
      )
  end

  # rotate B (T R a w (T B b x c)) y (T BB d z e) = T B a w (balance B b x (T R c y (T B d z e)))
  def rotate(_color = :black,
   leftNode = %RBNode{ color: :red, right: %RBNode{color: :black}},
   actualNode = %RBNode{},
   rightNode = %RBNode{color: :blackblack}) do
    %{ leftNode |
      color: :black,
      right: balance(:black,
        leftNode.right.left,
        leftNode.right,
        %{actualNode | color: :red, left: leftNode.right.right, right: %{rightNode | color: :black }}
        )
    }
  end

  # rotate B (T R a w (T B b x c)) y EE = T B a w (balance B b x (T R c y E))
  def rotate(_color = :black,
   leftNode = %RBNode{ color: :red, right: %RBNode{color: :black}},
   actualNode = %RBNode{},
   _rightNode = :emptyempty) do
    %{ leftNode |
      color: :black,
      right: balance(:black,
        leftNode.right.left,
        leftNode.right,
        %{actualNode | color: :red, left: leftNode.right.right, right: nil}
        )
    }
  end

  # rotate color axb= T color a x b
  def rotate(color = :black,
   leftNode = %RBNode{},
   actualNode = %RBNode{},
   rightNode = %RBNode{}) do
    %{ actualNode | color: color, left: leftNode, right: rightNode }
  end

  # min_del (T R E x E) = (x,E)
  def min_del (actualTreeNode = %RBNode{color: :red, right: nil, left: nil}) do
    {actualTreeNode, nil}
  end

  # min_del (T B E x E) = (x,EE)
  def min_del (actualTreeNode = %RBNode{color: :black, right: nil, left: nil}) do
    {actualTreeNode, :emptyempty}
  end

  # min_del (T B E x (T R E y E)) = (x,T B E y E)
  def min_del (actualTreeNode = %RBNode{color: :black, left: nil, right: %RBNode{color: :red, left: nil, right: nil}}) do
    {actualTreeNode, :emptyempty}
  end

  # min_del (T c a x b) = let (x',a') = min_del a
  # in (x',rotate c a' x b)
  def min_del (actualTreeNode = %RBNode{}) do
    {xl, al} = min_del(actualTreeNode.left)
    {xl, rotate(actualTreeNode.color, al, actualTreeNode,actualTreeNode.right)}
  end
 end
