server {
		listen       80;
		server_name  evobits.woocommerce.localhost;
		set $root_path '/storage/projects/www/EvoBits/woocommerce';
		root $root_path;
		index index.php;

        location = /favicon.ico {
                log_not_found off;
                access_log off;
        }

        location = /robots.txt {
                allow all;
                log_not_found off;
                access_log off;
        }

        location / {
                # This is cool because no php is touched for static content.
                # include the "?$args" part so non-default permalinks doesn't break when using query string
                try_files $uri $uri/ /index.php?$args;
        }

        location ~ \.php$ {
                #include fastcgi.conf;
                #fastcgi_intercept_errors on;
				#fastcgi_pass php71-fpm;

				try_files $uri = 404;
				fastcgi_split_path_info ^(.+\.php)(/.+)$;
				fastcgi_pass php71-fpm;
				fastcgi_index index.php;
				fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
				include fastcgi_params;
        }

        location ~* \.(js|css|png|jpg|jpeg|gif|ico)$ {
                expires max;
                log_not_found off;
		}
}
