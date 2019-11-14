from django.db import models
from django.contrib.auth.models import User
from datetime import datetime
# Create your models here.

AVAILABLE_TYPES=(
    ('undefined','undefined'),
    ('philosophy','philosophy'),
    ('patriotic','patriotic'),
    ('gk','gk'),
    ('engineering','engineering'),
    ('cartoon','cartoon'),
    ('romantic','romantic'),
    ('historical','historical')
)

SECTIONS=(
    ('A','A'),
    ('B','B'),
    ('C','C'),
    ('D','D'),
    ('E','E'),
)

STANDARD=(
    ('1', '1'),
    ('2', '2'),
    ('3', '3'),
    ('4', '4'),
    ('5', '5'),
)

FIRST_LANG = (
    ('English', 'English'),
    ('Spanish', 'Spanish'),
    ('French', 'French'),
    ('German', 'German'),
    ('Hindi', 'Hindi'),
    ('Tamil', 'Tamil'),
    ('Kannada', 'Kannada'),
    ('Telugu', 'Telugu'),
)

SECOND_LANG = (
    ('French', 'French'),
    ('Hindi', 'Hindi'),
    ('Tamil', 'Tamil'),
    ('Kannada', 'Kannada'),
    ('Telugu', 'Telugu'),
)

SUBJECT = (
    ('Maths', 'Maths'),
    ('Science', 'Science'),
    ('Social', 'Social'),
    ('Geography', 'Geography'),
    ('FirstLang', 'FirstLang'),
    ('SecondLang', 'SecondLang'),
)

TERMS=(
    ('1', '1'),
    ('2', '2'),
    ('3', '3'),
    ('4', '4'),
)

class Student(models.Model):
    roll_no = models.IntegerField(blank=False, null=False)
    name = models.CharField(max_length=200, blank=False, null=False)
    standard = models.CharField('standard', max_length=1, choices=STANDARD, default='1')
    section = models.CharField('section', max_length=1, choices=SECTIONS, default='A')
    first_lang = models.CharField('first Language', max_length=30, choices=FIRST_LANG)
    second_lang = models.CharField('second Language', max_length=30, choices=SECOND_LANG)
    year = models.IntegerField(blank=False, null=False, default=2019)
    updation_date = models.DateTimeField(default=datetime.now, blank=True)

    def __unicode__(self):
        return "%s" % (self.name)


class Exam(models.Model):
    subject = models.CharField('subject', max_length=10, choices=SUBJECT, default='1')
    maximum_marks = models.IntegerField(blank=False, null=False, default=100)
    paper_time = models.IntegerField('paper timelines in hours', blank=False, null=False, default=3)
    percentage = models.IntegerField('percentage', blank=False, null=False, default=25)
    updation_date = models.DateTimeField(default=datetime.now, blank=True)

    def __unicode__(self):
        return "%s" % (self.subject)


class Result(models.Model):
    studentFK = models.ForeignKey(Student, verbose_name='student name')
    examFK = models.ForeignKey(Exam, verbose_name='exam subject')
    terms = models.CharField('terms', max_length=1, choices=TERMS)
    gained_marks = models.IntegerField(blank=False, null=False)
    updation_date = models.DateTimeField(default=datetime.now, blank=True)

    # def get_considered_overall_marks(self, subject):
    #     total_count = Exam.objects.filter(subject=subject)
    #     cnt = Answer.objects.filter(option=self).count()
    #     perc = cnt * 100 / total_count
    #     return perc

    def __unicode__(self):
        return "%s - %s" % (self.studentFK, self.examFK)

