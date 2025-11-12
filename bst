# Practical 4

class Node:
    key = None
    left = None
    right = None

# Create new node
def create_node(key):
    new_node = Node()
    new_node.key = key
    new_node.left = None
    new_node.right = None
    return new_node

# Insert node into BST
def insert(root, key):
    if root is None:
        return create_node(key)
    if key < root.key:
        root.left = insert(root.left, key)
    elif key > root.key:
        root.right = insert(root.right, key)
    else:
        print("Duplicate entry (key ignored!)")
    return root

# Find minimum value node
def min_value_node(node):
    current = node
    while current and current.left is not None:
        current = current.left
    return current

# Delete node
def delete(root, key):
    if root is None:
        print("Tree is empty")
        return root
    if key < root.key:
        root.left = delete(root.left, key)
    elif key > root.key:
        root.right = delete(root.right, key)
    else:
        if root.left is None:
            return root.right
        elif root.right is None:
            return root.left
        temp = min_value_node(root.right)
        root.key = temp.key
        root.right = delete(root.right, temp.key)
    return root

# Search in BST
def search(root, key):
    if root is None:
        print("Tree is empty")
        return False
    if root.key == key:
        return True
    elif key < root.key:
        return search(root.left, key)
    else:
        return search(root.right, key)

# Inorder Traversal
def inorder(root):
    if root:
        inorder(root.left)
        print(root.key, end=" ")
        inorder(root.right)

# Main program with if-else menu
def main():
    root = None
    while True:
        print("\nBinary Search Tree Operations")
        print("1. Insert")
        print("2. Delete")
        print("3. Search")
        print("4. Display Tree (Inorder)")
        print("5. Exit")

        choice = int(input("Enter choice: "))

        if choice == 1:
            val = int(input("Enter value to insert: "))
            root = insert(root, val)

        elif choice == 2:
            val = int(input("Enter value to delete: "))
            root = delete(root, val)

        elif choice == 3:
            val = int(input("Enter value to search: "))
            print("Found" if search(root, val) else "Not Found")

        elif choice == 4:
            inorder(root)
            print()

        elif choice == 5:
            print("Exiting...")
            break

        else:
            print("Invalid choice. Try again.")

# Run main function
main()
