## Random Password Generator

A simple microservice demo (R + Plumber + Docker)

#### Components:

- A `Plumber` worker (aka generator) that returns random password, e.g. dog-red-alpha
- An `R` worker (aka tester) that sends N requests to generator and store result to database
- A `MongoDB` instance that stores documents from tester
- A `Plumber` worker (aka validator) that fetches documents from tester and does simple analysis

#### How to build?

```bash
git clone https://github.com/tmasjc/Random_Pwd_Generator.git

cd Random_Pwd_Generator

git submodule init && git submodule update

docker-compose build
```

#### How to run?

```bash
docker-compose up
```

#### How to view result?

Port 8899 is mapped onto your host machine, you can do 

```
curl --request GET --url http://127.0.0.1:8899/trigger > result.png
```

It will fetch result in png form.
