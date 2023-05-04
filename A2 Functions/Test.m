testScores = [92,76,48,82,89,68];
testNames = ["Andre","Nichelle","Bob","Hope","Carol","Indigo"];

logicalTestScores = testScores >= 70;
highestScores = find(max(testScores));
passingNames = testNames(logicalTestScores);
highestName = testNames(highestScores);

disp(passingNames)
disp(highestName)