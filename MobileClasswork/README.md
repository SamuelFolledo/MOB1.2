# [MOB1.2](https://make-school-courses.github.io/MOB-1.2-Introduction-to-iOS-Development/#/) Classworks and Homeworks

## Table Of Contents:
1. [Autolayout Pt.1](#day1)
2. [Autolayout Pt.2](#day2)
3. [Coding Constraints](#day3)
4. [Custom Views](#day4)
5. [MVC & Navigation](#day5)
6. [Table Views](#day6)
7. [Collection Views](#day7)
8. [Compositional Layouts](#day8)
9. [UITabBarController](#day9)
10. [Generics](#day10)
11. [Lab](#day11)
12. [Exploring SwiftUI](#day12)
13. [Final Exam](#day13)
14. [Presentations](#day14)
-  [Important References](#importantReferences)


---

<a name="day1"></a>
## Day 1. [Autolayout Pt.1](https://make-school-courses.github.io/MOB-1.2-Introduction-to-iOS-Development/#/Lessons/01-Autolayout/README)
### Topics
- Autolayout in storyboard

### CW: Autolayout and UIStackview in storyboard
<img src="https://github.com/SamuelFolledo/MOB1.2/blob/master/MobileClasswork/static/screenshots/day1CW1.png">

---

<a name="day2"></a>
## Day 2. [Autolayout Pt.2](https://make-school-courses.github.io/MOB-1.2-Introduction-to-iOS-Development/#/Lessons/02-AutoLayout/README)
### Topics
- Autolayout Part 2
- UIScrollView

### CW: Scrollable in storyboard
<img src="https://github.com/SamuelFolledo/MOB1.2/blob/master/MobileClasswork/static/gif/day2CW1.gif" width="640" height="446">

### HW: [Size Classes Tutorial](https://github.com/Make-School-Courses/MOB-1.2-Introduction-to-iOS-Development/blob/master/Lessons/02-AutoLayout/assignments/sizeclasses.md) Vary for Traits and adapting UI if landscape or portrait mode

<img src="https://github.com/SamuelFolledo/MOB1.2/blob/master/MobileClasswork/static/gif/day2HW1.gif" width="640" height="400">

---

<a name="day3"></a>
## Day 3. [Coding Constraints](https://make-school-courses.github.io/MOB-1.2-Introduction-to-iOS-Development/#/Lessons/03-CodingConstraints/README)
### Topics
- Constraints programmatically
- Anchors and NSLayoutConstraint class

### HW: Create an Onboarding Programmatically using UIScrollView
<img src="https://github.com/SamuelFolledo/MOB1.2/blob/master/MobileClasswork/static/gif/day3hw1.gif" width="640" height="496">

https://github.com/SamuelFolledo/MOB1.2/tree/master/MobileClasswork/MobileClasswork/Day3-Onboarding

---

<a name="day4"></a>
## Day 4. [Custom Views](https://make-school-courses.github.io/MOB-1.2-Introduction-to-iOS-Development/#/Lessons/04-CustomViews/README)
### Topics
- Review Onboarding
- Creating Custom Views
- Xib files

### CW: Creating Onboarding Programmatically in a UIScrollView with Gradient Background
<img src="https://github.com/SamuelFolledo/MOB1.2/blob/master/MobileClasswork/static/gif/day4cw1.gif" width="640" height="496">

https://github.com/SamuelFolledo/MOB1.2/tree/master/MobileClasswork/MobileClasswork/Day4-DryOnboarding

---

<a name="day5></a>
## Day 5. [MVC & Navigation](https://make-school-courses.github.io/MOB-1.2-Introduction-to-iOS-Development/#/Lessons/05-Intro-to-MVC/README)
### Topics
- Model, View, Controller
- Navigation via Segue programmatically
    - [Basic Navigation from MOB1.1](https://make-school-courses.github.io/MOB-1.1-Introduction-to-Swift/#/Lessons/12-Basic-Navigation/README)
    - Removed storyboard
    - [UINavigationController extension](https://github.com/SamuelFolledo/MOB1.2/blob/master/MobileClasswork/MobileClasswork/Helper/Extensions/UINavigtaionController%2Bextensions.swift) with initRootViewController method that reassigns a new VC as the rootVC

### HW:
- Programmatically navigate from OnboardingVC to LoginVC then to HomeVC and resetting the initial root view controller via [extension](https://github.com/SamuelFolledo/MOB1.2/blob/master/MobileClasswork/MobileClasswork/Helper/Extensions/UINavigtaionController%2Bextensions.swift).

<img src="https://github.com/SamuelFolledo/MOB1.2/blob/master/MobileClasswork/static/gif/day5demo.gif" width="238" height="480">

https://github.com/SamuelFolledo/MOB1.2/tree/master/MobileClasswork/MobileClasswork/Onboarding-Project

---

<a name="day6"></a>
## Day 6. [Table Views](https://make-school-courses.github.io/MOB-1.2-Introduction-to-iOS-Development/#/Lessons/06-TableViews/README)
### Topics
- __Reset Tip__ Go to Xcode's System Preferences, location, and Derived Data and delete everything
- TableViews Three Ways 🎈🌳👽
    - [TableView + Storyboard](https://github.com/Make-School-Courses/MOB-1.2-Introduction-to-iOS-Development/blob/master/Lessons/06-TableViews/assignments/tableStoryboard.md)
    - [TableView + xib file](https://github.com/Make-School-Courses/MOB-1.2-Introduction-to-iOS-Development/blob/master/Lessons/06-TableViews/assignments/tableXib.md)
    - [TableView programmatically](https://github.com/Make-School-Courses/MOB-1.2-Introduction-to-iOS-Development/blob/master/Lessons/06-TableViews/assignments/tableCode.md)

### HW: 
- Push a tableVC from HomeVC which pushes another tableVC on cell tap

<img src="https://github.com/SamuelFolledo/MOB1.2/blob/master/MobileClasswork/static/gif/day6demo.gif" width="238" height="480">

https://github.com/SamuelFolledo/MOB1.2/tree/master/MobileClasswork/MobileClasswork/Onboarding-Project

---
<a name="day7"></a>
## Day 7. [Collection Views](https://make-school-courses.github.io/MOB-1.2-Introduction-to-iOS-Development/#/Lessons/07-CollectionViews/README)
### Topics
•    Implement UICollectionViews in code
•    Handle UICollectionView’s datasource and delegate
•    Manage update animations
•    __UICollectionViewFlowLayout__ - look of collection view and its cells
•    __performBatchUpdates__ - performs cell animation with insert and delete cells

### CW:
- [Activity](https://github.com/Make-School-Courses/MOB-1.2-Introduction-to-iOS-Development/blob/master/Lessons/07-CollectionViews/assignments/assignment.md): Building a collection view

### HW:
<img src="https://github.com/SamuelFolledo/MOB1.2/blob/master/MobileClasswork/static/gif/day7hw.gif" width="238" height="480">

https://github.com/SamuelFolledo/MOB1.2/tree/master/MobileClasswork/MobileClasswork/Day7-CollectionView

---

<a name="day8"></a>
## Day 8. [Compositional Layouts](https://make-school-courses.github.io/MOB-1.2-Introduction-to-iOS-Development/#/Lessons/08-CompositionalLayouts/README)
### Topics
•    Understand the different elements of the new layout
•    Implement Compositional Layouts using different sections

### CW:
- [Compositional Layout Activity](https://github.com/amelinagzz/CompositionalLayout)

### HW: 
<img src="https://github.com/SamuelFolledo/MOB1.2/blob/master/MobileClasswork/static/gif/day8hw.gif" width="238" height="480">

---
<a name="day9"></a>
## Day 9. [UITabBarController](#day9)
### Topics

### CW:

### HW:

---

<a name="day10"></a>
## Day 10. [](#day10)
### Topics

### CW: 

### HW: 

---
<a name="day11"></a>
## Day 11. [Lab](#day11)
### Topics

### CW:

### HW:

---

<a name="day12"></a>
## Day 12. [Exploring SwiftUI](#day12)
### Topics

### CW: 

### HW: 

---
<a name="day13"></a>
## Day 13. [Final Exam](#day13)
### Topics

### CW:

### HW:

---

<a name="day14"></a>
## Day 14. [Presentations](#day14)
### Topics

### CW: 

### HW: 

---

<a name="importantReferences"></a>
## Important References
- [Notes and Recordings](https://github.com/SamuelFolledo/MOB1.2/tree/master/NotesAndRecordings)
- Day 2's [Size Classes Tutorial](https://github.com/Make-School-Courses/MOB-1.2-Introduction-to-iOS-Development/blob/master/Lessons/02-AutoLayout/assignments/sizeclasses.md)
- Day 6's [TableView + XIB](https://github.com/Make-School-Courses/MOB-1.2-Introduction-to-iOS-Development/blob/master/Lessons/06-TableViews/assignments/tableXib.md)
- Day 6's [TableView + programmatically](https://github.com/Make-School-Courses/MOB-1.2-Introduction-to-iOS-Development/blob/master/Lessons/06-TableViews/assignments/tableCode.md)
- Day 8's [Compositional Layout Activity](https://github.com/amelinagzz/CompositionalLayout)
