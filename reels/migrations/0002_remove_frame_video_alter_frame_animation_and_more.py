# Generated by Django 4.2.1 on 2023-05-17 19:39

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('reels', '0001_initial'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='frame',
            name='video',
        ),
        migrations.AlterField(
            model_name='frame',
            name='animation',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='frames', to='reels.animation'),
        ),
        migrations.AlterField(
            model_name='template',
            name='category',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='templates', to='reels.category'),
        ),
    ]