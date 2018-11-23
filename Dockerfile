FROM php:7.2-apache

# システムアップデート
RUN apt-get update && apt-get install -y \
    git \
    unzip

# Composerのインストール
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# apache設定ファイルのコピー
COPY ./conf/000-default.conf /etc/apache2/sites-available/

# laravelのインストール
RUN composer create-project laravel/laravel --prefer-dist .

# ドキュメントルートのパーミッションを変更
RUN chown -R www-data:www-data /var/www

