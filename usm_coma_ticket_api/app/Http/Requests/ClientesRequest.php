<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class ClientesRequest extends FormRequest
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
            'cod_cliente'=> 'required|unique:clientes,cod_cliente',
            'nombre'=> 'required',
            'email'=> 'required'
        ];
    }

    public function messages(){
        return[
                'cod_cliente.required'=>'Campo obligatorio',
                'cod_cliente.unique'=>'Debe ser único',
                'nombre.required'=>'Campo obligatorio',
                'email.required'=>'Campo obligatorio',
        ];
    }
}
