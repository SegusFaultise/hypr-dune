#!/bin/bash

INTERVAL="1"
INTERFACE=$(ip route get 1.1.1.1 | awk '{print $5; exit}')

if [ -z "$INTERFACE" ]; then
  echo "󰖪 N/A"
  exit
fi

format_speed() {
  speed_bps=$1

  if ((speed_bps < 1048576)); then
    printf "%'d KB/s" $((speed_bps / 1024))
  else
    echo "$(echo "scale=1; $speed_bps / 1048576" | bc) MB/s"
  fi
}

RX_BYTES_OLD=$(cat "/sys/class/net/${INTERFACE}/statistics/rx_bytes")
TX_BYTES_OLD=$(cat "/sys/class/net/${INTERFACE}/statistics/tx_bytes")

sleep $INTERVAL

RX_BYTES_NEW=$(cat "/sys/class/net/${INTERFACE}/statistics/rx_bytes")
TX_BYTES_NEW=$(cat "/sys/class/net/${INTERFACE}/statistics/tx_bytes")

RX_DIFF=$((RX_BYTES_NEW - RX_BYTES_OLD))
TX_DIFF=$((TX_BYTES_NEW - TX_BYTES_OLD))

RX_SPEED_BPS=$((RX_DIFF / INTERVAL))
TX_SPEED_BPS=$((TX_DIFF / INTERVAL))

FORMATTED_RX=$(format_speed $RX_SPEED_BPS)
FORMATTED_TX=$(format_speed $TX_SPEED_BPS)

echo " ${FORMATTED_RX}  ${FORMATTED_TX}"
