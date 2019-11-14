# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('exam', '0003_auto_20191112_1301'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='student',
            name='terms',
        ),
        migrations.AlterField(
            model_name='exam',
            name='percentage',
            field=models.IntegerField(default=25, verbose_name=b'percentage'),
        ),
        migrations.AlterField(
            model_name='result',
            name='examFK',
            field=models.ForeignKey(verbose_name=b'exam subject', to='exam.Exam'),
        ),
        migrations.AlterField(
            model_name='result',
            name='studentFK',
            field=models.ForeignKey(verbose_name=b'student name', to='exam.Student'),
        ),
    ]
