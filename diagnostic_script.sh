#!/bin/bash

# SPDX-FileCopyrightText: 2026 Kristina Efimova <rubymantella413@email.com>
#
# SPDX-License-Identifier: MIT

echo "=== ШАГ 1: Поиск подозрительных процессов ==="
ps auxf
echo ""
# Ищет процессы, запущенные из /tmp (включая скрытые папки вроде .hidden_malware), /var/tmp и /dev/shm
ps aux | grep -E '/tmp|/var/tmp|/dev/shm' | grep -v grep

echo ""
echo "=== ШАГ 2: Анализ сетевой активности ==="
ss -tulnp
echo ""
sudo lsof -i :4444

echo ""
echo "=== ШАГ 3: Проверка путей автозапуска ==="
crontab -l
echo ""
ls -la /etc/cron*

echo ""
echo "=== ШАГ 4: Поиск удаленных, но запущенных файлов ==="
sudo lsof | grep deleted
