# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import datetime


class Migration(migrations.Migration):

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Students',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('name', models.CharField(max_length=200)),
                ('type', models.CharField(default=b'undefined', max_length=50, verbose_name=b'type', choices=[(b'undefined', b'undefined'), (b'philosophy', b'philosophy'), (b'patriotic', b'patriotic'), (b'gk', b'gk'), (b'engineering', b'engineering'), (b'cartoon', b'cartoon'), (b'romantic', b'romantic'), (b'historical', b'historical')])),
                ('description', models.CharField(max_length=1000)),
                ('author_name', models.CharField(max_length=200)),
                ('release_date', models.DateTimeField(default=datetime.datetime.now, blank=True)),
                ('signed', models.BooleanField(default=False)),
                ('price', models.IntegerField()),
            ],
        ),
    ]
