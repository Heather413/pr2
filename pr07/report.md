# ПР №7. AppArmor, Capabilities и Docker

## 1. Linux Capabilities

### Разбор getcap /usr/bin/ping
cap_net_raw=ep: cap_net_raw — ..., e — ..., p — ...

### CapPrm / CapEff / CapBnd — в чём разница
...

### setcap — демонстрация
До: python3 порт 80 → [результат]
После setcap cap_net_bind_service=ep: → [результат]
Почему лучше чем sudo: ...

### Флаги e, i, p в cap_net_raw+eip
e — ..., i — ..., p — ...

## 2. AppArmor

### Количество профилей
enforce: N, complain: N

### Результаты pr07-reader
| Действие | Без профиля | complain | enforce |
|---|---|---|---|
| Читать /tmp/pr07-allowed.txt | ... | ... | ... |
| Читать /etc/shadow | ... | ... | ... |
| Писать в /tmp/ | ... | ... | ... |
| Писать в /etc/ | ... | ... | ... |

### Разбор строки DENIED
```
# вставить строку
```
operation=..., profile=..., name=..., denied_mask=...

## 3. Docker — изоляция

| Ресурс | Хост | Контейнер |
|---|---|---|
| Процессы | N шт | N шт |
| Сетевые интерфейсы | ... | ... |
| /etc/shadow хоста | доступен | ... |
| Монтирование | разрешено | ... |

### Capabilities: обычный vs --privileged
Обычный CapEff: [значение] → [расшифровка]
--privileged CapEff: [значение] → [расшифровка]
Чего нет у обычного: ...
Почему --privileged опасен: ...

### Итоговый nginx
Capabilities: ...
Почему именно эти: ...

## 4. Эшелонированная защита

| Слой | Инструмент | Что ограничивает |
|---|---|---|
| DAC | chmod/chown | ... |
| Capabilities | --cap-drop ALL + cap-add | ... |
| MAC | AppArmor | ... |
| Изоляция | Docker namespaces | ... |

## Выводы
...

