package main

import "encoding/json"

func must(err error) {
	if err != nil {
		panic(err)
	}
}

func neat(a any) string {
	data, err := json.MarshalIndent(a, "", " ")
	must(err)
	return string(data)
}
