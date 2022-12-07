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
        Schema::create('entradas', function (Blueprint $table) {
            $table->string('cod_entrada', 20);
            $table->string('cod_evento');
            $table->primary(['cod_entrada', 'cod_evento']);
            $table->unsignedInteger('precio');
            $table->integer('stock');
            $table->softDeletes();
            
            $table->foreign('cod_evento')->references('cod_evento')->on('eventos');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('entradas');
    }
};
