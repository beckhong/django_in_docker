# django_in_docker


Note: 先開啟docker
```
# 更新dockerfile後執行
docker-compose build

# 建立jango新專案
docker-compose run --rm app sh -c "django-admin startproject app ."

# 建立start app: core
docker-compose run --rm app sh -c "python -B manage.py startapp core"

# 建立model
docker-compose run --rm app sh -c "python -B manage.py makemigrations"
```
