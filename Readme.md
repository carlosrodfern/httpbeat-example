This is an example of how to make httpbeat work with Kibana 5.X.


Related issues:

https://github.com/christiangalsterer/httpbeat/issues/25 and https://github.com/elastic/kibana/issues/1084

The main change is replacing the `nested` fields in `httpbeat.template.json` to `object` in the original `httpbeat.template.json` file and then tell httpbeat to use it.


First, configure your endpoints in the httpbeat.yml


Then, build the image:

```sh
$ sudo docker build -t myhttppuller .
```

Finally, run it.

```sh
$ sudo docker run myttppuller
```


If you are planning to use `httpbeat` to pull metrics, you may want to add the following to the `dynamic_templates` array inside `httpbeat.template.json` to tell elasticsearch to use `double` for all number fields instead of trying to dynamically assign the type `long` to fields that come as `0`s for the first time.

```json
{
  "long_as_double": {
    "mapping": {
      "type": "double"
    },
    "match_mapping_type": "long"
  }
}
```


