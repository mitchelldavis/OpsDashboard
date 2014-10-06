#dummy server test we'll use to make sure the test runner is working

assert = require "assert"

describe 'Dummy Test', ->
	describe '#indexOf()', ->
		it 'should return -1 when the value is not present', ->
			expect([1,2,3].indexOf(5)).toBe(-1)
			expect([1,2,3].indexOf(0)).toBe(-1)
