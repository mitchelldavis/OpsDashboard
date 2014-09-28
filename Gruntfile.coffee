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
		mochaTest:
			test:
				options:
					reporter: 'spec'
				src: ['bin/server.tests/**/*.js']
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
	grunt.loadNpmTasks 'grunt-mocha'
	grunt.loadNpmTasks 'grunt-mocha-test'
	grunt.loadNpmTasks 'grunt-contrib-copy'
	grunt.loadNpmTasks 'grunt-contrib-clean'

	grunt.registerTask 'default', [
		'mkdir',
		'coffee', 
		'copy:serverPublic', 
		'copy:serverViews', 
		'mochaTest'
	]

	grunt.registerTask 'rebuild', [
		'clean',
		'default'	
	]
