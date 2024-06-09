Terminal 1:
```
docker compose run ubuntu-2204-hwasan-env-with-nuitka bash
```

Terminal 2:
```
docker cp <image>:/code/module.build module.build
docker cp <image>:/usr/local/lib/python3.10/dist-packages/nuitka/build/ nuitka.build
```
