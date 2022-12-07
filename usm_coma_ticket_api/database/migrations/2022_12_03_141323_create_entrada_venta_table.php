<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('entrada_venta', function (Blueprint $table) {
            $table->string('cod_entrada');
            $table->unsignedInteger('venta_id');
            $table->primary(['cod_entrada', 'venta_id']);

            $table->unsignedSmallInteger('cantidad');
            $table->unsignedInteger('precio_venta');
            
            $table->foreign('cod_entrada')->references('id')->on('entradas');
            $table->foreign('venta_id')->references('id')->on('ventas');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('entrada_venta');
    }
};
