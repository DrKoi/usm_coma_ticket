<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class VentasRequest extends FormRequest
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
            'id'=> 'required|unique:ventas,id',
            'fecha'=> 'required',
            'metodo_pago'=> 'required'
        ];
    }
    public function messages(){
        return[
            'id.required'=>'Campo obligatorio',
            'id.unique'=>'Debe ser único',
            'fecha.required'=>'Campo obligatorio',
            'metodo_pago.required'=>'Campo obligatorio',
            
        ];
    }
}
