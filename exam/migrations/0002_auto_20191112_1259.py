# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import datetime


class Migration(migrations.Migration):

    dependencies = [
        ('exam', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Exam',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('subject', models.CharField(default=b'1', max_length=10, verbose_name=b'subject', choices=[(b'Maths', b'Maths'), (b'Science', b'Science'), (b'Social', b'Social'), (b'Geography', b'Geography'), (b'FirstLang', b'FirstLang'), (b'SecondLang', b'SecondLang')])),
                ('maximum_marks', models.IntegerField(default=100)),
                ('paper_time', models.IntegerField(default=3, verbose_name=b'paper timelines in hours')),
                ('percentage', models.IntegerField(default=25, verbose_name=b'paper timelines in hours')),
                ('updation_date', models.DateTimeField(default=datetime.datetime.now, blank=True)),
            ],
        ),
        migrations.CreateModel(
            name='Result',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('terms', models.CharField(max_length=1, verbose_name=b'terms', choices=[(b'1', b'1'), (b'2', b'2'), (b'3', b'3'), (b'4', b'4')])),
                ('gained_marks', models.IntegerField()),
                ('updation_date', models.DateTimeField(default=datetime.datetime.now, blank=True)),
                ('examFK', models.ForeignKey(verbose_name=b'employee', to='exam.Exam')),
            ],
        ),
        migrations.CreateModel(
            name='Student',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('roll_no', models.IntegerField()),
                ('name', models.CharField(max_length=200)),
                ('standard', models.CharField(default=b'1', max_length=1, verbose_name=b'standard', choices=[(b'1', b'1'), (b'2', b'2'), (b'3', b'3'), (b'4', b'4'), (b'5', b'5')])),
                ('section', models.CharField(default=b'A', max_length=1, verbose_name=b'section', choices=[(b'A', b'A'), (b'B', b'B'), (b'C', b'C'), (b'D', b'D'), (b'E', b'E')])),
                ('first_lang', models.CharField(max_length=1, verbose_name=b'first Language', choices=[(b'English', b'English'), (b'Spanish', b'Spanish'), (b'French', b'French'), (b'German', b'German'), (b'Hindi', b'Hindi'), (b'Tamil', b'Tamil'), (b'Kannada', b'Kannada'), (b'Telugu', b'Telugu')])),
                ('second_lang', models.CharField(max_length=1, verbose_name=b'second Language', choices=[(b'French', b'French'), (b'Hindi', b'Hindi'), (b'Tamil', b'Tamil'), (b'Kannada', b'Kannada'), (b'Telugu', b'Telugu')])),
                ('year', models.IntegerField(default=2019)),
                ('terms', models.IntegerField(default=4)),
                ('updation_date', models.DateTimeField(default=datetime.datetime.now, blank=True)),
            ],
        ),
        migrations.DeleteModel(
            name='Students',
        ),
        migrations.AddField(
            model_name='result',
            name='studentFK',
            field=models.ForeignKey(verbose_name=b'employee', to='exam.Student'),
        ),
    ]
