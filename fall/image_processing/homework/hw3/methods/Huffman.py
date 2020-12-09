import cv2
import matplotlib.pyplot as plt
from queue import PriorityQueue
# number of grey values
INTENSITIES = 256

# This class will build our encoding tree
class Node(object):
    def __init__(self, level, prob):
        # Left and right children 
        self.right = None 
        self.left =  None
        self.prob = prob
        self.level = level # intensity level this node represents

    # Method to comare node's values, used for priority queue
    def __cmp__(self, node):
        return cmp(self.prob, node.prob)
    

class Huffman:
    def __init__(self, imagename):
        print("Staring Huffman encoder.")
        self.image = cv2.imread(imagename)
        self.gray = cv2.cvtColor(self.image, cv2.COLOR_BGR2GRAY)
        self.frequencies = [0] * INTENSITIES
        self.num_pixels = (self.image.shape[0] * self.image.shape[1])
        self.queue = PriorityQueue()
        self._find_frequencies()
        self._build_tree()
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
        # 1. Create node for each intensity level
        
        # TODO: Figure out how to insert item to priority queue
        for idx, freq in enumerate(self.frequencies):
            #nodes.append(Node(level=idx, prob=freq))
            #node = Node(level=idx, prob=freq)
            self.queue.put(Node(level=idx, prob=freq))
        while not self.queue.empty():
            pup = self.queue.get()
            print(pup)
        pass

    def _build_tree(self):
        """
            1. Build the nodes priority queue.
            2. Merge the two nodes with the lowest probabilities.
            3. Repeat until done
        """
        print("\tBuilding huffman tree")
        # 1. Build the nodes priority queue
        self._build_nodes_queue()
        pass
