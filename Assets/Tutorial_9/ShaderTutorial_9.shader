﻿Shader "Custom/ShaderTutorial_9"
{
    Properties
    {
        _Color ("Color", Color) = (1,1,1,1)
		_MetallicTex("Metallic (R)", 2D) = "white" {}
		_Metallic("Metallic", Range(0.0, 1.0)) = 0.0
		_Emission("Emission", Range(0.0, 10.0)) = 0.0
    }
    SubShader
    {
		// Not necessary, done by default
		Tags{ "Queue" = "Geometry" }

		CGPROGRAM
			#pragma surface surf Standard

			float4 _Color;
			half _Metallic;
			half _Emission;
			sampler2D _MetallicTex;

			struct Input
			{
				float2 uv_MetallicTex;
			};

			void surf(Input IN, inout SurfaceOutputStandard o)
			{
				o.Albedo = _Color.rgb;
				o.Smoothness = tex2D(_MetallicTex, IN.uv_MetallicTex).r;
				o.Metallic = _Metallic;
				o.Emission = tex2D(_MetallicTex, IN.uv_MetallicTex).r * _Emission;
			}
		ENDCG
    }
    FallBack "Diffuse"
}
