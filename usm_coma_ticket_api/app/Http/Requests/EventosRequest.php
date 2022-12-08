<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class EventosRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, mixed>
     */
    public function rules()
    {
        return [
           'cod_evento'=>'required|unique:eventos,cod_evento',
           'nombre'=> 'required',
           'precio_entrada'=> 'required',
           'stock_entradas'=> 'required',
           'estado'=> 'required',
        ];
    }
    public function messages(){
        return[
            'cod_evento.required'=>'Campo obligatorio',
            'cod_evento.unique'=>'Debe ser único',
            'nombre.required'=>'Campo obligatorio',
            'precio_entrada.required'=>'Campo obligatorio',
            'stock_entradas.required'=>'Campo obligatorio',
            'estado.required'=>'Campo obligatorio',
        ];
    }
}
