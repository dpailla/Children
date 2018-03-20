# Generated by Django 2.0.3 on 2018-03-20 15:59

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('clubes', '0001_initial'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='configuracionprograma',
            name='confifuracion_actividades',
        ),
        migrations.AddField(
            model_name='configuracionprograma',
            name='confifuracion_actividades',
            field=models.ManyToManyField(to='clubes.ConfiguracionActividades'),
        ),
        migrations.RemoveField(
            model_name='configuracionprograma',
            name='confifuracion_casas',
        ),
        migrations.AddField(
            model_name='configuracionprograma',
            name='confifuracion_casas',
            field=models.ManyToManyField(to='clubes.ConfiguracionCasas'),
        ),
        migrations.RemoveField(
            model_name='configuracionprograma',
            name='confifuracion_elemento_clave',
        ),
        migrations.AddField(
            model_name='configuracionprograma',
            name='confifuracion_elemento_clave',
            field=models.ManyToManyField(to='clubes.ConfiguracionElementosClave'),
        ),
    ]
