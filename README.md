## Random Password Generator

A simple microservice demo (R + Plumber + Docker)

#### Components:

- A `Plumber` worker (aka generator) that returns random password, e.g. dog-red-alpha
- An `R` worker (aka tester) that sends N requests to generator and store result to database
- A `MongoDB` instance that stores documents from tester
- A `Plumber` worker (aka validator) that fetches documents from database and does simple analysis

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

#### How to test Generator API?

Port 8888 is mapped from `Generator` onto your host machine

```
# to generate single password
curl --request GET --url '127.0.0.1:8888/gen_password'

# to generate N passwords (default N = 3)
curl --request GET --url '127.0.0.1:8888/gen_n_password?n=4'
```

#### How to view result?

Port 8899 is mapped from `Validator` onto your host machine

```
# to view validation status
curl --request GET --url http://127.0.0.1:8899/status

# to view validation graph (in png form)
curl --request GET --url http://127.0.0.1:8899/graph > result.png
```

