<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Venta extends Model
{
    use HasFactory, SoftDeletes;

    protected $table = 'ventas';
    protected $keyType = 'integer';
    public $timestamps = false;
    protected $appends = ['total_venta'];
    protected $hidden = ['entradasConPivot'];

    //retorna los entradas de la venta
    public function entradas(){
        return $this->belongsToMany(Entrada::class,'entrada_venta','venta_id','cod_entrada');
    }

    public function entradasConPivot(){
        return $this->belongsToMany(Entrada::class,'entrada_venta','venta_id','cod_entrada')->withPivot('cantidad','precio_venta');
    }

    //indicar el total de la venta
    public function getTotalVentaAttribute(){
        $totalVenta = 0;
        foreach($this->entradasConPivot as $entr){
            $totalVenta += $entr->pivot->cantidad * $entr->pivot->precio_venta;
        }
        return $totalVenta;
    }
}
