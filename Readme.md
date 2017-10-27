This is an example of how to make httpbeat work with Kibana 5.X.


Related issues:

https://github.com/christiangalsterer/httpbeat/issues/25 and https://github.com/elastic/kibana/issues/1084




First, configure your endpoints in the httpbeat.yml


Then, build the image:

```sh
$ sudo docker build -t myhttppuller .
```

Finally, run it.

```sh
$ sudo docker run myttppuller
```

