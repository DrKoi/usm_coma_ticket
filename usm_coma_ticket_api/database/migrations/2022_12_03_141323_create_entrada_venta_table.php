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
            $table->string('entrada_id');
            $table->unsignedInteger('venta_id');
            $table->primary(['entrada_id', 'venta_id']);
            $table->foreign('entrada_id')->references('id')->on('entradas');
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
