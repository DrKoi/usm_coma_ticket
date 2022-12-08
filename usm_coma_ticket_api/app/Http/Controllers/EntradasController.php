<?php

namespace App\Http\Controllers;

use App\Models\Entrada;
use Illuminate\Http\Request;

class EntradasController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return Entrada::all()->load('cliente','evento');
        //return Entrada::orderBy('cod_entrada')->get(['cod_entrada','cod_cliente','cod_evento','num_entrada','precio_entrada']);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $entrada= new Entrada();
        $entrada->cod_entrada= request->cod_entrada;
        $entrada->cod_cliente=request->cliente; 
        $entrada->cod_evento=request->evento;
        $entrada->nombre=request->evento;
        $entrada->num_entrada=request->num_entrada;
        $entrada->precio_entrada=request->evento;
        $entrada->save();
        return $entrada;
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Entrada  $entrada
     * @return \Illuminate\Http\Response
     */
    public function show(Entrada $entrada)
    {
        return $entrada;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Entrada  $entrada
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Entrada $entrada)
    {
        $entrada->cod_entrada= request->cod_entrada;
        $entrada->cod_cliente=request->cliente; 
        $entrada->cod_evento=request->evento;
        $entrada->nombre=request->evento;
        $entrada->num_entrada=request->num_entrada;
        $entrada->precio_entrada=request->evento;
        $entrada->save();
        return $entrada;
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Entrada  $entrada
     * @return \Illuminate\Http\Response
     */
    public function destroy(Entrada $entrada)
    {
        $entrada->delete();
    }
}
