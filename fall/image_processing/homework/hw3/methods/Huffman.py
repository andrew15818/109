import cv2
import matplotlib.pyplot as plt
import copy
import numpy as np
from queue import PriorityQueue
# number of grey values
INTENSITIES = 256

# This class will build our encoding tree
class Node(object):
    def __init__(self, prob, level=-1):
        # Left and right children 
        self.right = None 
        self.left =  None
        self.prob = prob
        self.level = level # intensity level this node represents
        self.value = -1 # 
    # Method to comare node's values, used for priority queue
    def __cmp__(self, node):
        return (self.prob <= node.prob)
        #return cmp(self.prob, node.prob)
    def __lt__(self, node):
        return (self.prob <= node.prob)
    

class Huffman:
    def __init__(self, imagename):
        print("Staring Huffman encoder.")
        self.image = cv2.imread(imagename)
        self.gray = cv2.cvtColor(self.image, cv2.COLOR_BGR2GRAY)
        self.frequencies = [0] * INTENSITIES
        self.num_pixels = (self.image.shape[0] * self.image.shape[1])
        self.queue = PriorityQueue()
        self.table = {} # Dictionary for our codes

        # TODO: Figure out how to encode the pixels in the image
        # using the reduces source symbols
        # Find the Huffman code for each symbol (store it in dict)
        self._find_frequencies()
        self.root = self._build_tree() 
        self._print_tree(self.root)
        self._make_table(self.root, '')
        
        
    # The probability is just the time each intensity level appears / num. pixels 
    def _find_frequencies(self):
        maxi, mini = 0, 1000
        for row in range(len(self.gray)):
            for col in range(len(self.gray[row])):
                #maxi = maxi if maxi > self.gray[row][col] else self.gray[row][col] 
                #mini= mini if mini < self.gray[row][col] else self.gray[row][col] 
                intensity = self.gray[row][col]
                self.frequencies[intensity] += 1

        self.frequencies = [(level / self.num_pixels) for level in self.frequencies]

    # Builds a priority queue indexed by probability
    def _build_nodes_queue(self): 
        """
            1. Create a node for each intensity level.
            2. Create a priority queue indexed by the node's prob
        """
        print("\t\tBuilding nodes priority queue")
        # Create a node and insert it into the priority queue 
        for idx, freq in enumerate(self.frequencies):
            node = Node(prob=freq, level=idx)
            self.queue.put((node.prob, node))
        sumo = 0
        '''
        while not self.queue.empty():
            tmp = self.queue.get()
            print(f'{tmp[1].prob}')
            sumo += tmp[1].prob
        '''
    def _make_parent(self, node1, node2):
        left = node1 if node1.prob <= node2.prob else node2
        right = node1 if node1.prob> node2.prob else node2
    
        # Get the two nodes with the lowest priorities
        node = Node(prob=node1.prob+node2.prob)
        node.left = left
        node.right = right
        return node

    # Print the tree for debug
    def _print_tree(self, node):
        if node == None:
            return
        self._print_tree(node.right)
        self._print_tree(node.left)

    # Build the code string for each level as we move down the string 
    # and assign it once we reach a leaf node.
    def _make_table(self, node, string):
        if node == None:
            return
        elif node.level != -1:
            #print(f'level:{node.level}, prob:{node.prob} code:{string}')
            self.table[node.level] = string
        self._make_table(node.right, string+'0') 
        self._make_table(node.left, string+'1') 

    # Given the code, find the corresponding intensity level
    def _retrieve_level(self, symbol):
        #node = copy.deepcopy(self.root)
        node = self.root
        for bit in symbol:
            if bit == '0':
                node = node.right
            elif bit == '1':
                node = node.left
        return node.level

    def _build_tree(self):
        """
            1. Build the nodes priority queue.
            2. Merge the two nodes with the lowest probabilities.
            3. Repeat until done
        """
        print("\tBuilding huffman tree")
        # 1. Build the nodes priority queue
        self._build_nodes_queue()
        
        # 2. Merge the two nodes with the lowest probability
        while self.queue.qsize() > 1:
            left = self.queue.get() 
            right = self.queue.get()
            #print(f'Comparing {left[1].prob} and {right[1].prob}')
            parent = self._make_parent(left[1], right[1])

            # Return once we have only the root node 
            if self.queue.qsize() == 0:
                return parent
            self.queue.put((parent.prob, parent))  

    # Replace the pixel values in the image with code from our table
    def encode(self):
        self.compressed = []

        for row in range(len(self.gray)):
            tmp = []
            for col in range(len(self.gray[row])):
                tmp.append(self.table[self.gray[row][col]])
            self.compressed.append(tmp)

        return self.compressed

    # Take in a deocded image and return the uncompressed version
    def decode(self, encoded):
        decompressed = np.array((self.gray.size[0], self.gray.size[1])) 
        for row in range(len(encoded)):
            for col in range(len(encoded[row])):
                # Retrieve the level corresponding to the symbol
                decompressed[row][col] = self._retrieve_level(encoded[row][col])
        return decompressed
