FROM php:7.2-apache

# �V�X�e���A�b�v�f�[�g
RUN apt-get update && apt-get install -y \
    git \
    unzip

# Composer�̃C���X�g�[��
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# apache�ݒ�t�@�C���̃R�s�[
COPY ./conf/000-default.conf /etc/apache2/sites-available/

# laravel�̃C���X�g�[��
RUN composer create-project laravel/laravel --prefer-dist .

# �h�L�������g���[�g�̃p�[�~�b�V������ύX
RUN chown -R www-data:www-data /var/www

