# Chapter 1: Introduction to Statistics
This chapter introduces observations and how we use some data to make predictions.
There are three types of ways of performing **statistical inference** on a set
of observations:
1. Retrospective Study: We look at logs or history of some variables to draw
our conclusions.
2. Observational Study: Try to disturb the environment as little as possible
and record relationships b/w data points.
3. Designed Experiments

Retrospective studies use archived data from a given period in time when
the activity took place. These can sometimes miss the relationships between
data values because we might not know exactly how some change in a varibale
influences the sample. Also, since the frequency of the time we recorded the
inputs might not be the same, we might miss some of the relationships.

In a designed experiment, we purposefully change the variable values to describe
the effect of a particular variable on the rest of the sample. The variability
of a single experiment cannot be applied to the entirety of the sample. If we 
have a varibility of *x* in one sample, then trying to compensate for this 
variability in the next trial can actually increase the variability of the 
sample as a whole. That's because each sample is a random trial, so it is 
unaffected by the variability of the previous trial. This is called 
**overcontrol** or **tampering**.

## 1.3 Mechanistic and Empirical Models
A **mechanistic** model is built on the underlying physical principle. We know
how something is supposed to work on the physical level, but when we take
measurements, there are many different reasons why some measurements might not
conform exactly to our expectations.

This means that there is a random variable $\epsilon$ added to every variable.

An **empirical** model is more ad-hoc, where we know of a relationship between
some values but we don't understand the underlying physical principles. Thus
we kind of have to improvise. A **regression** model would take a look at the 
plotted or measured data and derive a model based on those results. We try 
to create a function that approximates the results.

The **least squares** method tries to minimize the difference between the 
squares of the distance between the point and the horizontal plane.
