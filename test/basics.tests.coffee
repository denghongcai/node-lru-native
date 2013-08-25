assert = require('chai').assert
LRUCache = require '..'

describe 'basics', ->

	describe 'a cache with default settings', ->

		cache = undefined
		beforeEach -> cache = new LRUCache()

		it 'should be able to set and retrieve primitive values', ->
			cache.set 'foo', 42
			value = cache.get 'foo'
			assert.equal value, 42

		it 'should be able to set and retrieve string values', ->
			cache.set 'foo', 'bar'
			value = cache.get 'foo'
			assert.equal value, 'bar'

		it 'should be able to set and retrieve object values', ->
			obj = {example: 42}
			cache.set 'foo', obj
			value = cache.get 'foo'
			assert value is obj, 'an unexpected item was returned'

		describe 'when size() is called', ->

			it 'should return the correct size', ->
				assert.equal cache.size(), 0
				cache.set 'foo', 42
				assert.equal cache.size(), 1

		describe 'when clear() is called', ->

			it 'should remove all items in the cache', ->
				cache.set 'foo', 42
				cache.set 'bar', 21
				cache.clear()
				assert cache.get('foo') is undefined
				assert cache.get('bar') is undefined