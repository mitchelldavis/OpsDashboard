module.exports = (grunt) ->

	grunt.initConfig
		mkdir:
			all:
				options:
					create: ['bin']
		coffee:
			glob_to_multiple:
				expand: true,
				flatten: false,
				src: ['server/**/*.coffee', 'server.tests/**/*.coffee'],
				cwd: '.',
				dest: 'bin',
				ext: '.js'
        #mochaTest:
		#	test:
		#		options:
		#			reporter: 'spec'
		#		src: ['bin/server.tests/**/*.js']
		jasmine_node:
			options:
				forceexit: true
				match: '.'
				matchall: false
				extensions: 'js'
				specNameMatcher: ''
			all: ['bin/server.tests/']
		copy:
			serverPublic:
				src: ['server/public/**']
				dest: 'bin/'
			serverViews:
				src: ['server/views/**']
				dest: 'bin/'
		clean:
			options:
				force: true
			default:
				src: ['bin']

	grunt.loadNpmTasks 'grunt-mkdir'
	grunt.loadNpmTasks 'grunt-contrib-coffee'
	grunt.loadNpmTasks 'grunt-contrib-less'
	grunt.loadNpmTasks 'grunt-contrib-copy'
	grunt.loadNpmTasks 'grunt-contrib-clean'
	grunt.loadNpmTasks 'grunt-jasmine-node'

	grunt.registerTask 'default', [
		'mkdir',
		'coffee',
		'copy:serverPublic',
		'copy:serverViews',
		'jasmine_node'
	]

	grunt.registerTask 'rebuild', [
		'clean',
		'default'
	]
