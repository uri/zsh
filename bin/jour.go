// /usr/bin/true; exec /usr/bin/env GO111MODULE=off go run -C $(dirname "$0") $(basename $0) "$@"
package main

import (
	"flag"
	"fmt"
	"io/fs"
	"log"
	"log/slog"
	"os"
	"os/exec"
	"path/filepath"
	"strings"
	"time"
)

var allFlag = flag.Bool("a", false, "open entire journals dir")
var filesWithMatches = flag.Bool("l", false, "only print the files that matches")

func main() {
	flag.Parse()

	args := flag.Args()

	dir := os.Getenv("NOTEBOOK_DIR")
	if dir == "" {
		log.Fatalf("NOTEBOOK_DIR not set")
	}

	var notePath string

	if *allFlag {
		notePath = filepath.Join(notePath)
	} else if len(args) > 0 {
		input := args[0]
		filepath.WalkDir(filepath.Join(dir, "pages"), func(path string, d fs.DirEntry, err error) error {
			name := d.Name()
			if strings.Contains(strings.ToLower(name), strings.ToLower(input)) {
				notePath = path
				return filepath.SkipAll
			}
			return nil
		})

		if notePath == "" {
			log.Fatalf("could not find any pages matching %q", input)
		}
	} else {
		today := time.Now().Format("2006_01_02") + ".md"
		notePath = filepath.Join(dir, "journals", today)
	}

	switch {
	case *filesWithMatches:
		fmt.Println(notePath)
	default:
		cmd := exec.Command("nvim", notePath)
		cmd.Stdin = os.Stdin
		cmd.Stdout = os.Stdout
		cmd.Stderr = os.Stderr

		slog.Debug("running command", "command", cmd.String())
		if err := cmd.Run(); err != nil {
			log.Fatalf(err.Error())
		}
	}
}
