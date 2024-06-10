Terminal 1:
```
docker compose run ubuntu-2404-hwasan-factory-env-with-nuitka bash
```

Terminal 2:
```
docker cp <image>:/code/module.build module.build                                   
docker cp <image>:/usr/local/lib/python3.12/dist-packages/nuitka/build/ nuitka.build
```
