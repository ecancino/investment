#!/usr/bin/env coffee

numeral = require 'numeral'

if process.argv.length < 6
  console.log("Usage: interes_compuesto deposito_inicial ahorro_mensual tasa_anual años [inflacion_anual]")
  process.exit 0

deposito_inicial = Number(process.argv[2]);
ahorro_mensual = Number(process.argv[3]);
tasa_anual = Number(process.argv[4]);
tiempo_ahorro = Number(process.argv[5]);
inflacion_anual = Number(process.argv[6]) || 0;

interes_compuesto = (deposito_inicial, ahorro_mensual, tasa_anual, tiempo_ahorro, inflacion_anual) ->
  return null if not tasa_anual or not (deposito_inicial + ahorro_mensual) or not tiempo_ahorro

  saldo = (deposito_inicial * 1.0)
  ahorro = (ahorro_mensual * 1.0)
  inflacion = (inflacion_anual * 1.0) / 12
  tasa = ((tasa_anual * 1.0) / 12) - inflacion
  meses = (tiempo_ahorro * 12)
  mes = i = 1

  while i <= meses
    interes = Math.round((saldo * tasa / 100) * 100) / 100
    saldo = saldo + interes + ahorro

    mes += 1
    if mes > 12
      mes = 1
      ahorro = ahorro * (1 + inflacion * 12 / 100)
      ahorro = Math.round(ahorro * 100) / 100
    i += 1

  Math.round saldo

total = interes_compuesto(deposito_inicial, ahorro_mensual, tasa_anual, tiempo_ahorro, inflacion_anual)
console.log numeral(total).format('$ 0,0[.]00')



















