# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('exam', '0002_auto_20191112_1259'),
    ]

    operations = [
        migrations.AlterField(
            model_name='student',
            name='first_lang',
            field=models.CharField(max_length=30, verbose_name=b'first Language', choices=[(b'English', b'English'), (b'Spanish', b'Spanish'), (b'French', b'French'), (b'German', b'German'), (b'Hindi', b'Hindi'), (b'Tamil', b'Tamil'), (b'Kannada', b'Kannada'), (b'Telugu', b'Telugu')]),
        ),
        migrations.AlterField(
            model_name='student',
            name='second_lang',
            field=models.CharField(max_length=30, verbose_name=b'second Language', choices=[(b'French', b'French'), (b'Hindi', b'Hindi'), (b'Tamil', b'Tamil'), (b'Kannada', b'Kannada'), (b'Telugu', b'Telugu')]),
        ),
    ]
