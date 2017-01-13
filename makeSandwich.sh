#!/bin/bash
./scripts/install.sh
./scripts/generatePNGs.sh DE
./scripts/generateA4.sh DE
./scripts/generateA6.sh DE
./scripts/generatePNGs.sh EN
./scripts/generateA4.sh EN
./scripts/generateA6.sh EN
#./scripts/printPDF.sh
./scripts/printAll.sh DE
./scripts/printAll.sh EN
