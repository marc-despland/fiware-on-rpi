# Fiware Components

To deploy the FIWARE Components we will use [dockar swarm](https://docs.docker.com/engine/swarm/) so the first step is to initiate the cluster.

```
docker swarm init
```

We assume the work directory is the folder where you clone this repository.

```
git clone https://github.com/marc-despland/fiware-on-rpi.git
cd fiware-on-rpi
```

Then prepare the installation copying the files needed to create the differents components using docker compose.

```
$ sudo mkdir /opt/fiware
$ sudo cp -r opt/fiware/* /opt/fiware/
```

Then you can start the FIWARE components.

```
$ docker stack deploy -c /opt/fiware/docker-compose-fiware.yaml fiware
```

This will create orion, comet and cygnus with their databases.

Finaly to you can create the subscription for cygnus

```
curl -v http://127.0.0.1:1026/v2/subscriptions -s -S --header 'Content-Type: application/json' \
    -d @- <<EOF
{
    "description": "Store all entities",
    "expires": "2040-01-01T14:00:00.00Z",
    "subject": {
      "entities": [
        {
          "idPattern": ".*",
          "typePattern": ".*"
        }
      ],
      "condition": {
        "attrs": []
      }
    },
    "notification": {
      "attrs": [],
      "onlyChangedAttrs": false,
      "attrsFormat": "legacy",
      "http": {
        "url": "http://cygnus:5051/notify"
      }
    }
}
EOF
```

At this point you have a valid Orion listening on port 1026 and Comet on port 8080

If you want to create a new docker stack application conneting to orion or comet connect the container to the right network.

```
networks:
  fiware_orion:
    external: true
  fiware_comet:
    external: true
```