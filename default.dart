{
    "machine": {
        "gpu": 1,
        "ram": 100,
        "cpu": 1000
    },
    "job": {
        "APIVersion": "V1beta1",
        "Metadata": {
            "CreatedAt": "0001-01-01T00:00:00Z",
            "Requester": {}
        },
        "Spec": {
            "Deal": {
                "Concurrency": 1
            },
           "Docker": {
                "Entrypoint": [
                    "bash", "-c",
                    "python3 inference.py 2>/dev/null"
                ],
                "Image": "quay.io/lukemarsden/sdxl:v0.9-lilypad1-v2",
                "EnvironmentVariables": [
                    {{if .Prompt}}"{{ subt "PROMPT=%s" .Prompt }}"{{else}}"PROMPT=a swarm of hi-tech bees building a futuristic hive"{{end}},
                    {{if .Seed}}"{{ subt "RANDOM_SEED=%s" .Seed }}"{{else}}"RANDOM_SEED=42"{{end}},
                    "OUTPUT_DIR=/outputs/",
                    "HF_HUB_OFFLINE=1"
                ]
            },
            "Engine": "Docker",
            "Language": {
                "JobContext": {}
            },
            "Network": {
                "Type": "None"
            },
            "PublisherSpec": {
                "Type": "local"
            },
            "Resources": {
                "CPU": "3",
                "Memory": "3gb",
                "GPU": "1"
            },
            "Timeout": 1800,
            "Verifier": "Noop",
            "Wasm": {
                "EntryModule": {}
            },
            "outputs": [
                {
                    "Name": "outputs",
                    "path": "/outputs"
                }
            ]
        }
    }
}
