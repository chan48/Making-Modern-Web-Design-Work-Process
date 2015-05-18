/**
 * --------------------------------
 * Grunt 코드 패턴
 * --------------------------------
 */

// Grunt 설정
grunt.initConfig({

	// Sass 설정
	sass: {
		dist: {
			files: [{
				cwd: 'app/styles',
				src: '**/*.scss',
				dest: '../.tmp/styles',
				expand: true,
				ext: '.css'
			}]
		}
	},

	// Autoprefixer 설정
	autoprefixer: {
		options: ['last 1 version'],
		dist: {
			files: [{
				expand: true,
				cwd: '.tmp/styles',
				src: '{,*/}*.css',
				dest: 'dist/styles'
			}]
		}
	},

	// 관찰 업무 설정
	watch: {
		styles: {
			files: ['app/styles/{,*/}*.scss'],
			tasks: ['sass:dist', 'autoprefixer:dist']
		}
	}

});

// Grunt 업무 등록
grunt.registerTask('default', ['sass','autoprefixer', 'watch']);