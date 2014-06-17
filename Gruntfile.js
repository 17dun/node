module.exports = function(grunt) {

  // Project configuration.
  grunt.initConfig({
    pkg: grunt.file.readJSON('package.json'),
    closure_template:{
      list:{
            options:{
                sourceDir:"./templateList/soy/",
                outPutPath:"./build/templateList/",
                debugFilePath:"../workspace/"
            },
            files:{
                src: ['template/soy/','template/yundu/']
            }
        },
        newsContent:{
            options:{
                sourceDir:"./templateNewsContent/soy/",
                outPutPath:"./build/templateNewContent/",
                debugFilePath:"../workspace/"
            },
            files:{
                src: ['template/soy/','template/yundu/']
            }
        },
        ss:{
            options:{
                sourceDir:"./template/soy/",
                outPutPath:"./build/template/",
                debugFilePath:"../workspace/"
            },
            files:{
                src: ['template/soy/','template/yundu/']
            }
        }
    },
    watch: {
        soy:{
           files:['template/soy/**/*.soy'],
           options: {
                 //livereload:8666,
                 spawn: false,
                 interrupt: true, // 是否打断当前正在执行的,
                 event : 'all'    // added/changed/deleted
           }
        },
        tpl:{
           files:['template/**/*.tpl'],
           tasks:["closure_template:ss"],
           options: {
                 spawn: false,
                 interrupt: true, // 是否打断当前正在执行的,
                 event : 'all'    // added/changed/deleted
           }
        }
    }
  });


  // Load the plugin that provides the "uglify" task.
  //grunt.loadNpmTasks('grunt-contrib-uglify');
  grunt.loadNpmTasks('grunt-contrib-watch');
  grunt.loadNpmTasks('grunt-closure-template');
  // Default task(s).
  grunt.registerTask('default', ["closure_template:ss",'watch']);

};
