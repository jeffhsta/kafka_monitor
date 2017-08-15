# KafkaMonitor

It's an app to monitor your Kafka topics, partitions and messages

To start your Phoenix app:

  * Install dependencies with `mix deps.get`
  * Start Phoenix endpoint with `mix phoenix.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

When request GET / the response should be something like this:

```json
[
    {
        "topic": "topic_2",
        "partitions": {
            "0": {
                "replicas": [
                    1001
                ],
                "messages": [
                    {
                        "value": "messaeg number 4",
                        "offset": 0,
                        "key": null,
                        "crc": 3567991281,
                        "attributes": 0
                    }
                ],
                "leader": 1001
            },
            "1": {
                "replicas": [
                    1001
                ],
                "messages": [
                    {
                        "value": "message number 3",
                        "offset": 0,
                        "key": null,
                        "crc": 374785454,
                        "attributes": 0
                    }
                ],
                "leader": 1001
            },
            "2": {
                "replicas": [
                    1001
                ],
                "messages": [
                    {
                        "value": "message number 5",
                        "offset": 0,
                        "key": null,
                        "crc": 4281688219,
                        "attributes": 0
                    }
                ],
                "leader": 1001
            }
        }
    },
    {
        "topic": "topic_1",
        "partitions": {
            "0": {
                "replicas": [
                    1001
                ],
                "messages": [
                    {
                        "value": "message number 1",
                        "offset": 0,
                        "key": null,
                        "crc": 4166558850,
                        "attributes": 0
                    }
                ],
                "leader": 1001
            },
            "1": {
                "replicas": [
                    1001
                ],
                "messages": [
                    {
                        "value": "message numer 2",
                        "offset": 0,
                        "key": null,
                        "crc": 2720465340,
                        "attributes": 0
                    }
                ],
                "leader": 1001
            }
        }
    }
]
```

## Learn more

  * Official website: http://www.phoenixframework.org/
  * Guides: http://phoenixframework.org/docs/overview
  * Docs: https://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix
