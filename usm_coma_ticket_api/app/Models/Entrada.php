<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Entrada extends Model
{
    use HasFactory, SoftDeletes;
    protected $table = 'entradas';
    protected $primaryKey = 'cod_entrada';
    protected $keyType = 'string';
    public $timestamps = false;
    protected $appends = ['cantidad_ventas', 'unidades_vendidas'];
    protected $hidden = ['ventas', 'ventasConPivot'];

    public function ventas(){
        return $this->belongsToMany(Venta::class, 'entrada_venta', 'cod_entrada', 'venta_id');

    }
    public function ventasConPivot(){
        return $this->belongsToMany(Venta::class, 'entrada_venta', 'cod_entrada', 'venta_id')->withPivot('cantidad', 'precio_venta');
    }
    
    public function getCantidadVentasAttriibute(){
        return count($this->ventas);
    }

    public function getUnidadesVendidasAttribute(){
        return $this->ventasConPivot->sum('pivot.cantidad');
    }
}
