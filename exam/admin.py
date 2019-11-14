from django.contrib import admin
#from django.contrib.auth.models import User
#from django.contrib.auth.admin import UserAdmin
from exam.models import Student, Exam, Result

# Register your models here.
class AdminStudent(admin.ModelAdmin):
    list_display = ('roll_no', 'name', 'standard', 'section', 'first_lang', 'second_lang', 'year', 'updation_date')
    search_fields = ('roll_no', 'name', 'standard', 'section', 'first_lang', 'second_lang', 'year', 'updation_date')


class AdminExam(admin.ModelAdmin):
    list_display = ('subject', 'maximum_marks', 'paper_time', 'percentage', 'updation_date')
    search_fields = ('subject', 'maximum_marks', 'paper_time', 'percentage', 'updation_date')


class AdminResult(admin.ModelAdmin):
    list_display = ('studentFK', 'examFK', 'terms', 'gained_marks', 'updation_date')
    search_fields = ('studentFK', 'examFK', 'terms', 'gained_marks', 'updation_date')


admin.site.register(Student,AdminStudent)
admin.site.register(Exam,AdminExam)
admin.site.register(Result,AdminResult)
