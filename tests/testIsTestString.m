function testSuite = testIsTestString
%testIsTestString Unit tests for isTestString

%   Steven L. Eddins
%   Copyright 2008 The MathWorks, Inc.

localFunctionHandles = cellfun(@str2func, ...
  which('-subfun', mfilename('fullpath')), 'UniformOutput', false);
testSuite = buildFunctionHandleTestSuite(localFunctionHandles);

function testOneStringIs
assertTrue(xunit.utils.isTestString('testFoobar'));
assertTrue(xunit.utils.isTestString('Test_foobar'));

function testOneStringIsNot
assertFalse(xunit.utils.isTestString('foobar'));

function testCellArray
strs = {'testFoobar', 'foobar_test', 'foobar', 'foobar_Test'};
assertEqual(xunit.utils.isTestString(strs), [true true false true]);
assertEqual(xunit.utils.isTestString(strs'), [true; true; false; true]);