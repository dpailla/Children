# Generated by Django 2.0.3 on 2018-03-20 15:31

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('clubes', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Cita',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('fecha', models.DateField(verbose_name='Fecha y hora')),
                ('evento', models.CharField(max_length=200)),
                ('club', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='clubes.Club')),
            ],
        ),
    ]