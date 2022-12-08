<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class EntradasRequest extends FormRequest
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
            'cod_entrada'=>'required|unique:entradas,cod_entrada',
            'num_entrada'=>'required|lte:1'
        ];
    }
    public function messages(){
        return[
            'cod_entrada.required'=>'Campo obligatorio',
            'num_entrada.unique'=>'Debe ser único',
            'num_entrada.lte'=>'Solo se permite comprar una entrada por cliente',
        ];
    }
}
