package basic.algos;

public class BSTNode<T> {

    public int key;
    public T obj;

    public BSTNode parent;
    public BSTNode left;
    public BSTNode right;

    public BSTNode(int key, T obj) {
        this.key = key;
        this.obj = obj;
        this.left = null;
        this.right = null;
    }

    public void print() {
        System.out.println("The key is: " + key);
        System.out.println("The object is: " + obj.toString());
    }

    public static void preOrderWalk(BSTNode node) {
        if (node != null) {
            node.print();
            preOrderWalk(node.left);
            preOrderWalk(node.right);
        }
    }

    public static void inOrderWalk(BSTNode node) {
        if (node != null) {
            inOrderWalk(node.left);
            node.print();
            inOrderWalk(node.right);
        }
    }

    public static BSTNode search(BSTNode node, int k) {
        if (node == null || node.key == k) {
            return node;
        }

        if (k < node.key) {
            return BSTNode.search(node.left, k);
        } else {
            return BSTNode.search(node.right, k);
        }

    }

    public BSTNode iterativeSearch(int k) {

        BSTNode node = this;

        while (node != null && node.key != k) {
            if (k < node.key) {
                node = node.left;
            } else {
                node = node.right;
            }
        }

        return node;
    }

    public static BSTNode max(BSTNode node) {
        while (node != null && node.right != null) {
            node = node.right;
        }

        return node;
    }

    public static BSTNode min(BSTNode node) {
        while (node != null && node.left != null) {
            node = node.left;
        }

        return node;
    }

    public BSTNode succ(BSTNode node) {

        if (node == null) {
            return null;
        }

        if (node.right != null) {
            return min(node.right);
        }

        BSTNode p = node.parent;
        while (p != null && p.right == node) {
            node = p;
            p = p.parent;
        }
        return p;

    }

    public void insert(BSTNode tree, BSTNode z) {
        BSTNode trailing = null;
        BSTNode child = tree;

        while (child != null) {
            trailing = child;
            if (z.key < child.key) {
                child = child.left;
            } else {
                child = child.right;
            }
        }
        z.parent = trailing;
        if (trailing == null) {
            tree = z;
        } else if (z.key < trailing.key) {
            trailing.left = z;
        } else {
            trailing.right = z;
        }

    }

    public void transplant(BSTNode root, BSTNode u, BSTNode v) {

        if (u.parent == null) {
            root = v;
        } else if (u == u.parent.left) {
            u.parent.left = v;
        } else {
            u.parent.right = v;
        }

        if (v != null) {
            v.parent = u.parent;
        }
    }

    public void delete(BSTNode z) {
        if (z.left == null) {
            this.transplant(this, z, z.right);
        } else if (z.right == null) {
            this.transplant(this, z, z.left);
        } else {
            BSTNode y = BSTNode.min(z.right);
            if (y.parent != z) {
                this.transplant(this, y, y.right);
                y.right = z.right;
                y.right.parent = y;
            }

            this.transplant(this, z, y);
            y.left = z.left;
            y.left.parent = y;

        }
    }

    public static void bstTest() {

        System.out.println("==========BST Test==========");
        /**
         * Set up.
         */
        BSTNode<Double> a = new BSTNode<>(9, 9.9);
        BSTNode<Double> b = new BSTNode<>(5, 5.5);
        BSTNode<Double> c = new BSTNode<>(1, 1.1);
        BSTNode<Double> d = new BSTNode<>(7, 7.7);
        BSTNode<Double> e = new BSTNode<>(8, 8.8);
        BSTNode<Double> f = new BSTNode<>(10, 10.0);

        a.left = b;
        a.right = f;
        b.parent = a;
        b.left = c;
        b.right = d;
        c.parent = b;
        d.parent = b;
        d.right = e;
        e.parent = d;
        f.parent = a;

        /**
         * In-order walk test.
         */
        System.out.println("-----In-order walk test-----");
        BSTNode.inOrderWalk(a);

        /**
         * Search test.
         */
        System.out.println("-----Search test-----");
        BSTNode s = BSTNode.search(a, 7);
        System.out.println("Searching node 7: ");
        s.print();

        /**
         * Iterative search test.
         */
        System.out.println("-----Iterative search test-----");
        BSTNode ss = BSTNode.search(a, 8);
        System.out.println("Iteratively searching 1: ");
        ss.print();

        /**
         * Maximum test (Minimum exactly the same).
         */
        System.out.println("-----Maximum test-----");
        BSTNode max = BSTNode.max(a);
        max.print();

        /**
         * Successor test.
         */
        System.out.println("-----Successor test-----");
        BSTNode csucc = a.succ(c);
        System.out.println("The successor of c should be 5");
        csucc.print();

        BSTNode esucc = a.succ(e);
        System.out.println("The successor of e should be 9:");
        esucc.print();

        BSTNode bsucc = a.succ(b);
        System.out.println("The successor of b should be 7:");
        bsucc.print();

        /**
         * Insertion Test.
         */
        System.out.println("-----Insertion test-----");
        BSTNode<Double> n = new BSTNode<>(6, 6.6);
        a.insert(a, n);
        System.out.println("Printing tree after insertion");
        BSTNode.preOrderWalk(a);

        /**
         * Deletion Test.
         */
        System.out.println("-----Deletion test-----");
        a.delete(b);
        System.out.println("Printing tree after deletion");
        BSTNode.preOrderWalk(a);

    }

}
