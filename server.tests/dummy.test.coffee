#dummy server test we'll use to make sure the test runner is working

assert = require "assert"

describe 'Dummy Test', ->
	describe '#indexOf()', ->
		it 'should return -1 when the value is not present', ->
			assert.equal -1, [1,2,3].indexOf(5)
			assert.equal -1, [1,2,3].indexOf(0)