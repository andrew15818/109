# Outline for Research Project Report, Poster, and Presentation
Report has to include:

## Idea 
Create a shell script that runs all the stages in the pipeline automatically.
Then we can mention the modular aspect of our design.

## Report

The report should be *at least* 8 pages and at most 16.
1. **Title page**: Containing name of the project in Chinese and English, 
group members, advisor, and date.

Checklist: 
	- Name in chinese/English
	- Group Members
	- Advisor
	- Date

2. **Abstract**
This project attempts to find a modular approach of implementing image stitching
in a modular fashion to provide real-time results to be used in a larger project.
The input should be a set of two or more unordered images. Since the images are to
be captured from drones, they are probably going to be unordered. Thus being able to
work despite of this is important.

3. **Introduction**
Maybe explain the EagleEye project better? 
What role does the image stitching module play?
How does image stitching occur? You already made the pipeline diagram.

4. **Description of the problem**
What are you trying to solve?
What are your constraints?
What does a possible solution look like?
Since we ended up opting for a modular design rather than 
a single script, we can optimize individual parts at the cost of 
larger read/writing operations every time we call a script.

5. **Current literature and comparison**
SIFT, Image Stitching using Invariant Features are the standard approaches.
In this project, we chose to change the feature matching stage with an AI model that
been tested both on indoor and outdoor scenes.

Since the publication of the original papers, there have been some new methods 
and algorithms that can handle certain parts of the pipeline, but are not a 
replacement for the entire procedure.

6. **Method of Resolution**
We first analyzed the required inputs and outputs at each stage of the pipeline, 
and we made a series of simple scripts which would read some files as their inputs, 
perform a single step of the pipeline, and then print their results to a file.
This was made so that every step need not be performed, or a single part might be optimized
without compromising the entire system.

7. **System Design and Implementation**
Maybe talk about the file structure and how to run it. (Only designed for two images at a time though)

8. **Result Analysis**
Show how much the timing was improved by changing out a part of the pipeline 
Say what remains to be done: replace the other part of the pipeline, and actually containerize it 
and apply it on the server.

9. **Conclusion and contributions**
In conclusion, I'm happy to be done with this class!

10. **References**
1. http://matthewalunbrown.com/papers/ijcv2007.pdf - Image Stitching 

2. https://www.cs.ubc.ca/~lowe/papers/iccv99.pdf - SIFT 

3. https://dl.acm.org/doi/10.1145/361002.361007 - k-d trees 

4. https://arxiv.org/abs/1911.11763 - SuperGlue Pretrained Network

## Poster
The poster is supposed to summarize the contents of the report.

## Presentation
