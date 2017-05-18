const gulp = require('gulp')
const haxe = require('gulp-haxe')
const sourcemaps = require('gulp-sourcemaps')
const shell = require('gulp-shell')

gulp.task('compile', function() {
  return haxe('build.hxml')
    //.pipe(sourcemaps.init())
    //.pipe(uglify()) //uncomment this to uglify the output js
    //.pipe(sourcemaps.write())
    .pipe(gulp.dest('dest'))
    .pipe(shell(["./compile-tests.sh"]))
})

gulp.task('watch', function() {
  gulp.watch(['src/**/*.hx', 'test/**/*hx'], ['compile'])
})

gulp.task('compile-and-run-tests', function() {
  return gulp.src('').pipe(
    shell(["./compile-tests.sh && ava dest/test"])
  )
})

gulp.task('watch-tests', function() {
  gulp.watch(['test/**/*hx', 'src/**/*.hx'], ['compile-and-run-tests'])
})

gulp.task('default', ['compile', 'watch'])

gulp.task('test', ['compile-and-run-tests', 'watch-tests'])
