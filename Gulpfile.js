import gulp from "gulp";

// const download = require('gulp-download-stream');
import shell from "gulp-shell";
// const env = require('gulp-env');

// Download Translations
// const files = [
//     {
//         file: 'en-us/en.json',
//         url: 'https://translations.integral-systems.ch/api/translations/assessment/assessment-client/de/file/',
//     },
//     {
//         file: 'de-de/de.json',
//         url: 'https://translations.integral-systems.ch/api/translations/assessment/assessment-client/en/file/',
//     },
// ];
// gulp.task('translations', () => download(files, {
//     auth: {
//         bearer: 'wlu_DvWGcvl42zXLOVf7Hm6CGlnMkXQEBweRQhNw',
//     },
// }).pipe(gulp.dest('src/i18n/')));

// gulp.task('set-env', (done) => {
//     env({
//         vars: {
//             API_URL: 'https://beta.api.assessment.integralworks.ch/',
//             STAGING: 'true',
//         },
//     });
//     done();
// });

gulp.task('dev', shell.task('concurrently "yarn run dev:only" "yarn run tailwind:watch"'));
gulp.task('build', shell.task('svelte-kit build'));

// Init
gulp.task('build', gulp.series('dev'));
gulp.task('default', gulp.series('dev'));